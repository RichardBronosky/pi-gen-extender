for file in files/*.deb; do

on_chroot << EOF
TEMP_DEB="\$(mktemp)"
base64 -d > "\$TEMP_DEB" << SELEOF
`base64 $file`
SELEOF
dpkg -i "\$TEMP_DEB"
rm -f "\$TEMP_DEB"
EOF

done
