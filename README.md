# armbian-userpatches-example-indiedroid-nova
reference implementation of having a unique device completely configured via userpatches.


## if you haven't used armbian before.

it's best let armbian use docker on your behalf.

this means 2 things.

1. install docker
1. add your user account to the `docker` user group so that docker can be ran without sudo

that might look like this

```bash
sudo apt install docker.io -y
sudo usermod -a -G docker ${USER}
logout
```

## usage

```bash
git clone https://github.com/armbian/build.git
cd build
git submodule add -f -b main https://github.com/lanefu/armbian-userpatches-example-indiedroid-nova.git userpatches
```

### interactive build

will prompt for menus etc

```
./compile.sh nova
```

### sid cli build

uses `config-nova-sid.conf` to build a cli based debian sid image

`./compile.sh nova-sid`

### really bloated gnome build

uses `config-nova-gnmoe-bloated.conf` to build a gnome desktop bloated by most application groups selected

`./compile.sh nova-gnome-bloated`

### really really opinionated configuration

uses `config-opinionated.conf` to build a debian sid cli image with custom ssh keys, strip out the normal interactive setup.  ready to boot.. and names itself princess-sbc



## learn more

Read the armbian docs to better understand the power available in the armbian build framework


### Understand Hookpoints

Hookpoints allow you to make

add functions prefixed with any of these [hook points](https://docs.armbian.com/Developer-Guide_Extensions-Hooks/) in your config file.

you can use them to use [existing functions](https://github.com/armbian/build/tree/main/lib/functions) or [extensions](https://docs.armbian.com/Developer-Guide_Extensions/)

### Understand Extensions

Extensions are a pluggable way to add a rich library of functions to armbian build framework.   Once enabled via a `enable_extension` call, They are generally available for use anywhere.

https://docs.armbian.com/Developer-Guide_Extensions/#what-is-an-extension      "Specifically, extension files should not contain any code outside of functions – they should do nothing when sourced."

**NOTE** slight edge-case that hooks related to build dependencies may get executed durring the Docker bootstrapping for cache management purposes regardless of being enabled... those extensions aren't otherwise available unless enabled with `enable_extension`