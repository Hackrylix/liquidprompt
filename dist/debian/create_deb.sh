#!/bin/sh

echo "Creating Debian's package..."
nano ./liquidprompt/DEBIAN/control

echo "Copying files..."
if [ ! -d ./liquidprompt/usr/bin/ ]
then
	mkdir -p ./liquidprompt/usr/bin/
fi
if [ ! -d ./liquidprompt/etc/profile.d/ ]
then
mkdir -p ./liquidprompt/etc/profile.d/
fi
cp ../../liquidprompt ./liquidprompt/usr/bin/liquidprompt
cp ../../liquidpromptrc ./liquidprompt/etc/profile.d/liquidpromptrc.sh
chmod a+x ./liquidprompt/usr/bin/liquidprompt
chmod a+x ./liquidprompt/etc/profile.d/liquidpromptrc.sh

echo "Building liquidprompt.deb..."
dpkg-deb -b liquidprompt

echo "Done !"
