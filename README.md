## list:

### Application

- ffmpeg-mmal - ffmpeg with mmal 

- htop-rpi - htop with temperature display, for raspberry pi

### base

- glibc

- libpng12

### kernel

- linux-rpi - alpine raspberry pi kernel with VC4 enabled

### drivers

- pi-bluetooth - zero, 3B/3B plus bluetooth driver

- waveshare35b - waveshare 3.5B drivers

- xf86-video-fbturbo

### framebuffer use

- con2fbmap 

- raspi2fb

- rpi-cpfb

## note:

to use framebuffer apps as non-root user, need to add user to [video] group:

```
sudo addgroup $(whoami) video
```

for those apps use `/dev/vchiq`, like omxplayer, if want avoid sudo, need setup udev rules:

```
sudo mkdir -p /etc/udev/rules.d
```

``` 
sudo sh -c 'cat > /etc/udev/rules.d/raspberrypi.rules <<"EOF"
SUBSYSTEM=="vchiq|input", MODE="0777"
KERNEL=="mouse*|mice|event*",  MODE="0777"
EOF'
```
