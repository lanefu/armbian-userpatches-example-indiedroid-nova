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

uses `config-nova-gnmoe-bloated` to build a gnome desktop bloated by most application groups selected

`./compile.sh nova-gnome-bloated`
