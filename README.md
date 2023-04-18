# Debos Generate Image

### 💻 Techs
<div style="display: flex;">
<br>
<img src="https://www.debian.org/Pics/openlogo-50.png" width="50">
<br>
<img src="https://static.vivaolinux.com.br/imagens/tux-linux.jpg" width="50">
<br>
</div>

### 👋 Hello! :)
This code has been development for generate bootable debian images in <i>SBC's</i> in an automated way. This images needs has specify packages and files to be use in a security system project. The idea is control the packages and files necessary before of the image to be generate, so that, after the image is generated and bootable on <i>SBC</i>, It don't needs more maintenance or alter on data. And to be possible that, was used the DEBOS project, this project allows control the final image and the scripts executed on system startup

You can see the DEBOS documentation <a href="https://github.com/go-debos/debos">here</a>.

### 💾 The Security System project

Writing...

### 📚 YAML FILE

All informations who will be on final generated image, is setup in a <b>YAML</b> file, this
file has all necessary specifications for project.
```yaml
architecture: armhf

actions:

- action: apt
description: Install orangepi packages
packages:
- gcc-arm-linux-gnueabihf
- python3-dev
- rustc
- cargo
- python3-cryptography
- sudo
- adduser
- systemd-sysv
- initramfs-tools
- u-boot-tools
- u-boot-menu
- util-linux
```

We have 3 yaml files to execute the script with success:

<ul>
<li>orangepi.yaml</li>
<li>raspberrypi.yaml</li>
<li>generate-image.yaml</li>
</ul>

# <h3>generate-image.yaml:</h3>

There is common configs in two images generate process. For example
<ul>
<li>Download codes</li>
<li>Install commmon packages</li>
<li>Download Debian Repository to packages instalations</li>
<li>File configs into SBC</li>
<li>Exec Scripts from project</li>
</ul>

# <h3>raspberrypi.yaml:</h3>

There is configs for raspberry build image process

<ul>
<li>Download Firmware of board</li>
<li>Instalation of Firmware</li>
<li>Instalation of Kernel</li>
<li>Mount and compact image with especific patitions for boot execution</li>
</ul>

# <h3>orangepi.yaml:</h3>

There is configs for orange build image process
<ul>
<li>Download the necessary and specific packages from armhf architecture</li>
<li>Mount and compact image with especific patitions for boot execution</li>
<li>Instalation of U-BOOT, this tool is necessary for system start on board (
Here needs some refactors because the U-BOOT config with error, is preventing the kernel modify the serial states)</li>
</ul>

### 🎬 Execution

To exec DEBOS, just exec the command:

```
debos file.yaml
```

The -m flag its related with the DEBOS memory and will be past join the command.

However, some params must be past for script YAML can be exec. These parameters are: <u>wifi ssid</u>, <u>wifi password</u>, <u> root password</u> and <u> board type for verify the architecture and commands</u>.

If you want use the raspberry wifi module, just write the ssid and password join the debos command

in addition, The fake-machine (U-BOOT part on project) have a error on execution, the it needs disable with the flag `--disable-fakemachine`.

The complete comand will be this way::

```
debos -m memory -t wifi_ssid:wifi_ssid -t wifi_passwd:wifi_passwd -t board:board -t root_passwd:root_passwd generate-image.yaml --disable-fakemachine
```

A use example is:
```
debos -m 8G -t wifi_ssid:PabloWifi -t wifi_passwd:Pablo123 -t board:raspberrypi -t root_passwd:root generate-image.yaml --disable-fakemachine
```
