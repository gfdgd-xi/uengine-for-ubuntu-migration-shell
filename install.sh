#/bin/bash
find . -name '*.deb' | xargs sudo dpkg -i
sudo apt-mark hold lxc lxc-templates liblxc1 liblxc-common lxc-utils
sudo apt install -f -y
sudo apt install libdframeworkdbus2 screen libnotify-bin -y
which uengine
if [[ $? != 0 ]]; then
    echo UEngine 安装失败！
    sudo rm -v /usr/bin/uengine-loading-ubuntu
    exit
fi
echo "请重启并换成5.17内核，然后运行launch_uengine.sh即可启动"
