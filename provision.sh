#!/bin/bash

install_dependencies(){
	sudo apt-get update
	sudo apt-get install -y curl quilt parted realpath \
		qemu-user-static debootstrap zerofree pxz zip \
		dosfstools bsdtar libcap2-bin grep rsync xz-utils
}

create_basic_configuration(){
	echo 'IMG_NAME=Raspbian' >> config
}

create_installation_customization_demo(){
	files_path="$(pwd)/stage2/03-custom-installations/files"
	mkdir -p $files_path
	cd $(dirname "$0")
	script_path="$(pwd)"
	dpkg-deb --build helloworld
	cd - > /dev/null
	mv $script_path/helloworld.deb $files_path/
	cp $script_path/00-run.sh $(dirname $files_path)/
}

prepare_upstream_source(){
	git clone https://github.com/RPi-Distro/pi-gen.git
	cd pi-gen/
	rm -rf ./stage[345]
	create_basic_configuration
}

customize_user_environment(){
	(cat | tee -a ~/.bashrc | sudo tee -a ~root/.bashrc > /dev/null) <<EOF

export EDITOR=vim
set -o vi
alias ll='ls -la'
EOF
}

install_dependencies
customize_user_environment
prepare_upstream_source
create_installation_customization_demo
