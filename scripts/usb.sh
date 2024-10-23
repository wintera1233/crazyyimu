# USB driver setup

PACKAGES_PATH=/home/USERNAME/iu_ws/src

sudo /lib/systemd/systemd-udevd --daemon
cd $PACKAGES_PATH
cd $PACKAGES_PATH/phidgets_api
sudo cp debian/udev /etc/udev/rules.d/99-phidgets.rules
sudo udevadm control --reload-rules && udevadm trigger