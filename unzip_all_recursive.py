import os
from pathlib import Path


for root, dirs, files in os.walk("C:\\Temp"):
    for file in files:
        if Path(file).suffix == ".7z":
            print(f'7z e "{os.path.join(root, file)}" -o"{root}" -y')
            os.system(f'7z e "{os.path.join(root, file)}" -o"{root}" -y')

