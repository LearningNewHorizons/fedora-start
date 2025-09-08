``` ShellSession
$ sudo nano /etc/sudoers
%sudo ALL=(ALL) NOPASSWD: ALL
```

firewall settings to home

TDP Manager (for intel): https://www.youtube.com/watch?v=UBgM7D3fBLE

EasyEffect add default preset and change the settings acordingly

``` ShellSession
$ nmcli connection mod [CONNECTION] ipv4.dns "1.1.1.1"
$ nmcli connection down [CONNECTION]
$ nmcli connection up [CONNECTION]
```

download and unzip resolve into ~/resolve-shortcut and run ~/resolve-shortcut/resolve-installer.sh to install the rest

# IMPORTANT
packages.sh assumes you have Intel CPU alongside Nvidia GPU and KDE Plasma as the default DE

run packages.sh to install