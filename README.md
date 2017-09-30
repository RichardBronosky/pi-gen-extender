# pi-gen-extender
This wrapper around the official RPi-Distro/pi-gen repo helps you build a minimal Raspbian image with extra debs installed.

# What does this do?

The provisioning script serves this purposes:

1. `git clone https://github.com/RPi-Distro/pi-gen.git` 
1. Remove stages 3, 4, & 5 to make a Raspbian-lite image
1. Create a `03-custom-installations` sub-stage under `stage2`
1. Copies the [00-run.sh][1] script into the new subsection
 - This is a really handy tool you can use as is for real work
 - It installs all the `*.deb` files in the `files` dir of the subsection
1. Builds a `helloworld.deb` file from the [helloworld][2] directory in this repo.
 - If you are looking for a easy way to install functionality into RaspberryPi/Debian and look like a pro doing it, this is the example you want to follow.

When you first boot your new image and log in as user, pi, you will find that there is a [helloworld.sh][3] script in the `/usr/local/bin` directory. Since it is in your `$PATH` you can just type `hell<tab>` and it will auto complete.

# What can you do with this?

Once you are able to build an image with helloworld installed, you can do make an image to do anything that a Raspberry Pi is capable of. And best of all, you can do it without having to even boot it.

# What's next?

Soon I will get a Pull Request upstream that will allow project owners (or helpful community members) to publish a single script that convert a stock Raspbian image into the desired project. This will replace the countless forum posts full of outdated copy-paste code.

# Usage

## without Vagrant:

### Note:
> I have successfully used an AWS EC2 instance with Ubuntu 16.04 to generate the Raspbian image using this method.

<!-- -->

    git clone https://github.com/RichardBronosky/pi-gen-extender.git
    cd pi-gen-extender
    source provision.sh
    provision
    sudo ./build.sh


## with Vagrant:

### Note:
> I have had problems doing this on macOS Sierra, but I'm including how it's intended to work here until I better understand the issue. It could be just my computer, or could be the OS. I've yet to try it on Linux or Windows.

<!-- -->

    git clone https://github.com/RichardBronosky/pi-gen-extender.git
    cd pi-gen-extender
    vagrant up
    vagrant ssh
    cd pi-gen
    sudo ./build.sh

[1]: https://github.com/RichardBronosky/pi-gen-extender/blob/master/00-run.sh
[2]: https://github.com/RichardBronosky/pi-gen-extender/tree/master/helloworld
[3]: https://github.com/RichardBronosky/pi-gen-extender/blob/master/helloworld/usr/local/bin/helloworld.sh