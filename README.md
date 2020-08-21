## sway  
  
i3-compatible Wayland compositor  
  
requires:    
```
apt install sway grim
```  
```
yum install sway grim
```   
```
pacman -S sway swayidle swaybg waybar mako rofi grim
```  
  
Automatic install/update:
```
bash -c "$(curl -LSs https://github.com/dfmgr/sway/raw/master/install.sh)"
```
Manual install:
```
mv -fv "$HOME/.config/sway" "$HOME/.config/sway.bak"
git clone https://github.com/dfmgr/sway "$HOME/.config/sway"
```
  
  
<p align=center>
  <a href="https://wiki.archlinux.org/index.php/sway" target="_blank">sway wiki</a>  |  
  <a href="https://github.com/swaywm" target="_blank">sway site</a>
</p>  
