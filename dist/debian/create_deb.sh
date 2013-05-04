#!/bin/sh

echo "Creating Debian's package..."
nano ./liquidprompt/DEBIAN/control

echo "Copying files..."
if [ ! -d ./liquidprompt/usr/bin/ ]
then
	mkdir -p ./liquidprompt/usr/bin/
fi
if [ ! -d ./liquidprompt/etc/ ]
then
	mkdir -p ./liquidprompt/etc/
fi
cp ../../liquidprompt ./liquidprompt/usr/bin/liquidprompt
cp ../../liquidpromptrc ./liquidprompt/etc/liquidpromptrc
chmod a+x ./liquidprompt/usr/bin/liquidprompt

echo "Building liquidprompt.deb..."
dpkg-deb -b liquidprompt

echo "Done !"
