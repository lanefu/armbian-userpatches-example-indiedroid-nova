# armbian-userpatches-example-indiedroid-nova
reference implementation of having a unique device completely configured via userpatches.

## usage

```
git clone https://github.com/armbian/build.git
cd build
git submodule add -f -b main https://github.com/lanefu/armbian-userpatches-example-indiedroid-nova.git userpatches
./compile.sh EXPERT=yes DEBUG=yes nova-sid-cli build
```

