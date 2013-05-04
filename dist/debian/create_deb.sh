#!/bin/sh

echo "Creating Debian's package..."
nano ./liquidprompt/DEBIAN/control

echo "Copying files..."
if [ ! -d ./liquidprompt/etc/profile.d/ ]
then
mkdir -p ./liquidprompt/etc/profile.d/
fi
cp ../../liquidprompt.sh ./liquidprompt/etc/profile.d/liquidprompt.sh
cp ../../liquidpromptrc ./liquidprompt/etc/liquidpromptrc

chmod a+x ./liquidprompt/etc/profile.d/liquidprompt.sh

echo "Building liquidprompt.deb..."
dpkg-deb -b liquidprompt

echo "Done !"
