#/bin/bash
echo "首先要启动容器守护，所以会出现一个失败的启动界面，关闭即可"
echo "打开守护之后,按Ctrl+Alt+D后即可安全关闭此窗口，开始安装/卸载/启动安卓应用"
sleep 3
uengine launch --package=org.anbox.appmgr --component=org.anbox.appmgr.AppViewActivity
screen -s ./run_daemon.sh

