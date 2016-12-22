# brightness
shell script for adjusting laptop monitor brightness on Ubuntu Xenial for non-free nvidia drivers

## using script with i3wm

### append to sudoers file

`sudo vi /etc/sudoers`

``` shell
Cmnd_Alias           CMDS = /path/to/setbrightness.sh
<USER> ALL=NOPASSWD: CMDS
```
[little article about SUID and sudoers file](http://askubuntu.com/a/167885)

### append to i3 config file

`vi .config/i3/config`

``` shell
bindsym XF86MonBrightnessUp exec "sudo /path/to/setbrightness.sh up 10"
bindsym XF86MonBrightnessDown exec "sudo /path/to/setbrightness.sh down 10"
```
