# knowledge
Opening and editing markdown files:
```shell
apostrophe main.md
```

## LINUX
Run darktable when it does not start  
```shell
darktable --disable-opencl
```

iptables list all
```shell
sudo iptables -A
```

Find location
```shell
ldd gpg
```

Setup network bridge
```shell
nmcli connection add type bridge ifname br0 stp no

nmcli connection add type bridge-slave ifname enp7s0 master br0

nmcli connection down enp7s0

nmcli connection up bridge-br0
nmcli connection up bridge-slave-enp7s0
```

Monitor all files accessed by a command
```shell
strace -f -o log -e openat,open,creat ./command
```

Unmount a busy device
```shell
umount -l /PATH/OF/BUSY-DEVICE
```

Port numbers in computer networking represent communication endpoints. Ports are unsigned 16-bit integers (0-65535) that identify a specific process, or network service. IANA is responsible for internet protocol resources, including the registration of commonly used port numbers for well-known internet services.
Well Known Ports: 0 through 1023.
Registered Ports: 1024 through 49151.
Dynamic/Private : 49152 through 65535.

## VIM
* `:w !sudo tee %` - save file with sudo permissions
* `:%s/foo/bar/gc` - search
* `[line] + G` - jump to line
* `ctrl + o`, `ctrl + l` - unjump (back) and ununjump
* `W, shift w, b, e` - move in words
* `0` - jump to first symbol in line
* `$` - jump to last symbol in line
* `gg` - jump to file start
* `G` - jump to file end
* `: !<shell command>`
* `/word` - search in file

vim remove redundant spaces from line ends
```
:%s/\s\+$//
```

vim update tabs in document
```
:retab
```

My minimal .vimrc
```shell
set softtabstop=0 expandtab
set tabstop=4
set number
```

## SSH
sshfs mount
```shell
sshfs -o follow_symlinks andrey:/home/andrey/railings-automatic-collection ~/Docs/andrey
```


## APT
apt sources file (remotes)
```shell
/etc/apt/sources.list
```

## BYOBU / TMUX
byobu turn off tabs auto renaming  
`set-option -g allow-rename off` in file `/usr/share/byobu/profiles/tmux`

```shell
byobu list-session
```


## PYTHON
Install pip on any version of python
```shell
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10
```

## DWM
dwm get active monitor ([link](https://www.reddit.com/r/suckless/comments/k7806r/querying_active_monitor_in_dwm/), [link](https://dwm.suckless.org/patches/ipc/))  
Take 4k screenshots with 1080 monitor (rescale xrandr output)
```shell
xrandr --output eDP --scale 2x2 --panning 3840x2160
```

## UBUNTU
ubuntu do not go to sleep on lid close  
file `vim /etc/systemd/logind.conf`, uncomment and change `HandleLidSwitch=ignore`

## HARDWARE, MOTHERBOARDS, BIOS, DATA
asus change integrated gpu setting (igpu)  
`BIOS -> advanced -> System agent -> graphics configuration -> Primary display`  

USB standards:
![usb_standards](images/usb_standards.jpg)

`testdisk` - Recover disk (NO GPT support)  
`photorec` - better alternative with wider support

## DOCKER
[Docker migrate image](https://stackoverflow.com/questions/23935141/how-to-copy-docker-images-from-one-host-to-another-without-using-a-repository)

Docker create GUI display  
https://leimao.github.io/blog/Docker-Container-GUI-Display/

## SERVERS, STORAGE
[create GPT RAID6](https://unix.stackexchange.com/questions/318098/mdadm-raid-implementation-with-gpt-partitioning)  

linux test write speed
```shell
dd if=/dev/zero of=/tmp/test1.img bs=1G count=1 oflag=dsync
```

linux run speedtest in a docker container
```shell
docker run --rm -it gists/speedtest-cli
```

## GIT
Apply patch
```shell
patch -p1 < path/file.patch
```
Git pull (fetch) another branch
```shell
git fetch origin branch:branch
```

## WINDOWS
Running an `.exe` file using an absolute path with spaces
```shell
& "C:\Program Files\Blender Foundation\Blender 3.4\blender.exe" -b project.blend -E BLENDER_EEVEE --python use_gpu.py -o C:\Users\pavti\Documents\process-client\render\### -s 1 -a
```

## VIRTUALISATION
Windows virtual machine setup

BIOS
```shell
FX0:

lspci -nnk
```

Edit grub
```shell
vim /etc/default/grub
```
With
```shell
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash intel_iommu=on kvm.ignore_msrs=1 vfio-pci.ids=10de:2206,10de:1aef,10de:1b81,10de:10f0,8086:1901,8086:1905"
```
Reboot grub
```shell
grub-mkconfig -o /boot/grub/grub.cfg
```

`vim /etc/modprobe.d/vfio.conf`
```shell
blacklist nvidia
blacklist snd_hda_intel
options vfio-pci ids=10de:2206,10de:1aef
```

Host machine
Turn off power management and screen saver

Remove gdm
```shell
sudo dpkg-reconfigure gdm3
```

The normal Mint display manager is MDM, which with a bit of luck you can restore as the default with... 
```shell
sudo apt-get install --reinstall mdm
```

Remote desktop

Client for arch
```shell
yay realvnc-vnc-viewer
```

[Server](https://community.linuxmint.com/tutorial/view/2334)

```shell
sudo apt-get -y install x11vnc
sudo mkdir /etc/x11vnc
sudo x11vnc --storepasswd /etc/x11vnc/vncpwd
sudo vim /lib/systemd/system/x11vnc.service
```

```
[Unit]
Description=Start x11vnc at startup.
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth guess -forever -noxdamage -repeat -rfbauth /etc/x11vnc/vncpwd -rfbport 5900 -shared

[Install]
WantedBy=multi-user.target

sudo systemctl daemon-reload
sudo systemctl enable x11vnc.service
sudo systemctl start x11vnc.service
```

Connect
```shell
vncviewer 192.168.1.150
```

Running windows in virtual machine

```shell
sudo systemctl enable libvirtd --now
sudo adduser pavtiger libvirt
```

## OTHER
FTL save path `~/.local/share/FasterThanLight`
