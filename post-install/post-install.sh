#!/bin/sh

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

flouser=$(logname)

echo "Installing mimetypes for .nu files..." # this is continuously adding the same entries to /etc/mime.types and have to be fixed
cat >> /etc/mime.types <<EOF
application/x-nu			        nu
EOF
cat > /usr/share/mime/packages/x-nu.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
  <mime-type type="application/x-nu">
    <comment>Nushell script</comment>
    <generic-icon name="application-x-nu"/>
    <glob pattern="*.nu"/>
  </mime-type>
</mime-info>

EOF
sudo update-mime-database /usr/share/mime
sudo gtk-update-icon-cache /usr/share/icons/gnome/ -f

echo "Installing icons for .nu files..."

git clone https://github.com/DaniellMesquita/linux-icon-builder.git
#git clone https://github.com/floflis/linux-icon-builder.git

cd linux-icon-builder
sh ./linux-icon-builder "$SCRIPTPATH/rsc/img/application-x-nu.png" "mimetypes" "application-x-nu.png"
cd icons

if [ ! -e /usr/share/icons/Floflis ]; then
   cp -r -f --preserve=all . /usr/share/icons/Yaru/
else
   cp -r -f --preserve=all . /usr/share/icons/ubuntu/Yaru/
fi

cd "$SCRIPTPATH"
rm -rf linux-icon-builder

echo "Installing handler for .nu files..."

echo "Installing nu-script-handler..."

sudo cp -f nu-script-handler /usr/bin/nu-script-handler

echo "Installing shortcut in /usr/share/applications..."
cat > /usr/share/applications/nu-script-handler.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Nu Script Handler
Exec=nu-script-handler %f
Icon=application-x-executable
StartupNotify=false
MimeType=application-x-nu;
EOF

echo "Turning nu-script-handler into the default program (to user $flouser) for .nu scripts..."
cat >> /home/$flouser/.config/mimeapps.list <<EOF
application/x-nu=nu-script-handler.desktop
EOF

installfail(){
   echo "Installation has failed."
   exit 1
}

if [ -f /usr/bin/nu-script-handler ];then
   echo "- Turning nu-script-handler into an executable..."
   sudo chmod +x /usr/bin/nu-script-handler
   if nu-script-handler babyisalive; then echo "Done! Running 'nu-script-handler' command as example to use it:" && (nu-script-handler &);exit 0; else installfail; fi
   else
      installfail
fi
