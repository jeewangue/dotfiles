#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

I3_GAPS_PARENT_PATH=$HOME/Downloads
I3_GAPS_PATH=$I3_GAPS_PARENT_PATH/i3-gaps

POLYBAR_DOWNLOAD_PATH=$HOME/Downloads

# install dependencies
sudo apt install \
	libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
	libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
	libstartup-notification0-dev libxcb-randr0-dev \
	libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
	libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
	autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

# clone the repository
git clone https://www.github.com/Airblader/i3 $I3_GAPS_PATH
cd $I3_GAPS_PATH

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install


############ Polybar

sudo apt install \
	build-essential clang git cmake cmake-data pkg-config \
	libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev \
	python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

# optional dependencies
sudo apt install \
	libxcb-xrm-dev \
	libpulse-dev \
	libjsoncpp-dev \
	libmpdclient-dev \
	libcurl4-openssl-dev \
	libnl-genl-3-dev

cd $POLYBAR_DOWNLOAD_PATH
wget https://github.com/jaagr/polybar/releases/download/3.3.0/polybar-3.3.0.tar
tar xvf polybar-3.3.0.tar
cd polybar

mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

cp -v -r $DIR/.config/i3 $DIR/.config/polybar $HOME/.config/
