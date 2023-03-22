# armbian-userpatches-example-indiedroid-nova
reference implementation of having a unique device completely configured via userpatches.


## if you haven't used armbian before.

it's best let armbian use docker on your behalf.

this means 2 things.

1. install docker
1. add your user account to the `docker` user group so that docker can be ran without sudo

that might look like this

```bash
sudo apt install docker.io -i
sudo usermod -a -G docker ${USER}
logout
```

## usage

git clone https://github.com/armbian/build.git
cd build
git submodule add -f -b main https://github.com/lanefu/armbian-userpatches-example-indiedroid-nova.git userpatches
./compile.sh nova-sid
```
