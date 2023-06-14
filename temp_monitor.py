import pandas as pd
import subprocess
import datetime
import time
import os

def get_fan():
    result = subprocess.run(['sensors'], stdout=subprocess.PIPE)
    ans = result.stdout.decode('utf-8')

    state = False
    for word in ans.split():
        if state:
            return word
            state = False
        if (word == 'fan1:'):
            state = True

def get_temp():
    result = subprocess.run(['sensors'], stdout=subprocess.PIPE)
    ans = result.stdout.decode('utf-8')
    
    state = False
    for word in ans.split():
        if state:
            return word
            state = False
        if (word == 'temp1:'):
            state = True


def get_process():
    p1 = subprocess.Popen(['top', '-b', '-o', '+%CPU'], stdout=subprocess.PIPE)
    p2 = subprocess.Popen(['head', '-n', '22'], stdin=p1.stdout, stdout=subprocess.PIPE)
    p1.stdout.close()  # Allow p1 to receive a SIGPIPE if p2 exits.
    output = p2.communicate()[0]
    ans = output.decode('utf-8')

    state = False
    for elem in ans.split():
        if state:
            print(elem)

        if elem == 'PID':
            print(elem)
            state = True

get_process()


filename = 'temp_data.csv'
try:
    data = pd.read_csv(filename)
    print(len(data['Raw_date']))
    ind = len(data['Raw_date'])
except:
    ind = 0
    print('remade')
    data = pd.DataFrame(columns=['Raw_date', 'Fan1', 'Temp1'])



while (True):
    data.loc[ind] = {'Raw_date':datetime.datetime.now(), "Fan1":get_fan(), "Temp1":get_temp()}
    ind += 1

    data.to_csv(filename, index=False)
    time.sleep(10)
