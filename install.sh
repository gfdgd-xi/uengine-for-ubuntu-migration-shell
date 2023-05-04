#/bin/bash
echo 送杜少府之任蜀州
echo 城阙辅三秦，风烟望五津。
echo 与君离别意，同是宦游人。
echo 海内存知己，天涯若比邻。
echo 无为在歧路，儿女共沾巾。 
echo
echo 译文：巍巍长安，雄踞三秦之地；渺渺四川，却在迢迢远方。你我命运何等相仿，奔波仕途，远离家乡。只要有知心朋友，四海之内不觉遥远。即便在天涯海角，感觉就像近邻一样。岔道分手，实在不用儿女情长，泪洒衣裳。
echo =========================
find . -name '*.deb' | xargs sudo dpkg -i
sudo apt-mark hold lxc lxc-templates liblxc1 liblxc-common lxc-utils
sudo apt install -f -y
sudo apt install libdframeworkdbus2 screen -y
# 检测安装是否成功
which uengine
if [[ $? != 0 ]]; then
    # 安装失败
    sudo rm /usr/share/applications/uengine-loading-ubuntu.desktop
    sudo rm /etc/xdg/autostart/uengine-loading-ubuntu.desktop
    sudo rm /usr/bin/uengine-loading-ubuntu
    for username in $(ls /home)  
    do
        echo /home/$username
        sudo rm /home/$username/uengine-launch/run_daemon.sh
    done
    zenity --error --no-wrap '--text=抱歉，UEngine 安装失败，已移除安装时进行的修改'
    exit
fi
# 添加 apt 源以拉取最新版本的 UEngine Android Image
if [[ ! -f /etc/apt/sources.list.d/gfdgdxi-uengine-without-root-list-apt.list ]]; then
    mkdir -p /tmp/gfdgd-xi-sources
    wget -P /tmp/gfdgd-xi-sources https://code.gitlink.org.cn/gfdgd_xi/uengine-apt/raw/branch/master/gpg.asc
    wget -P /tmp/gfdgd-xi-sources https://code.gitlink.org.cn/gfdgd_xi/uengine-apt/raw/branch/master/sources/gitlink.list
    gpg --dearmor /tmp/gfdgd-xi-sources/gpg.asc
    sudo cp -v /tmp/gfdgd-xi-sources/gpg.asc.gpg /etc/apt/trusted.gpg.d/gfdgdxi-uengine-without-root-list-apt.gpg
    sudo cp -v /tmp/gfdgd-xi-sources/gitlink.list /etc/apt/sources.list.d/gfdgdxi-uengine-without-root-list-apt.list
    sudo apt update
fi
echo "请重启并换成5.17内核，然后运行launch_uengine.sh即可启动"
