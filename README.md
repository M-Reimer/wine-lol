Wine-LoL
========

This repository contains build scripts to build wine-lol for Arch/Manjaro (with sync to AUR). These PKGBUILDs build the wine version created by [GloriousEggroll](https://github.com/GloriousEggroll).

You can find the source project here: https://github.com/GloriousEggroll/wine-ge-custom/

My PKGBUILDs are only meant to simplify some stuff for Arch Linux users. If you are no Arch user (or are an Arch user which does not need wine-lol installed globally) then just go to https://github.com/GloriousEggroll/wine-ge-custom/releases and grab the latest official "-LoL" release.

**WARNING**: While in the past the Linux community received some help from Riot employees in cases where the in-game anti cheat caused the game to break on Linux with Wine, this is not guaranteed to keep this way. Especially as Riot plans to create some [kernel driver based anti cheat](https://eune.leagueoflegends.com/en-pl/news/dev/dev-null-anti-cheat-kernel-driver/) which may land in LoL at some time. So far noone knows for sure if LoL will still work with Wine as soon as this happens. So if you are playing on Linux, it is strongly recommended to not spend any money on skins or other in-game items! Your money will be lost as soon as Wine support breaks.

- **wine-lol** contains the PKGBUILD of wine-lol itself
- **wine-lol-bin** contains a PKGBUILD which repackages GloriousEggroll's official binaries
- **repo-make.conf** allows to autobuild the packages on a dedicated build VM
- **pkg.sh** Small helper I use for handling "git subtree" for AUR

Contributor notes about Wine version updates
--------------------------------------------

Please keep in mind that the goal of this repository is **not** to keep a Wine version with the LoL patches up-to-date with the upstream Wine version but to keep **a** Wine version stable and running which allows to play LoL in a somewhat stable and performant way on Linux. It is absolutely OK if this Wine version is "old". All that matters is the result!

This leads us to a few points you should consider if you want to see an updated version here:
1. I have no time to test new versions. So it's you who has to do this! This means that a **new version** can not be requested at all in an Issue but **only with a Pull Request**!
2. You have to name **at least one improvement** in your Pull Request that this version provides for playing LoL on Linux. If a new version just works as well as the old version, then there is no need to update!

Contributer notes on building using Docker
---
Simple steps to build with Docker on **any** distro and export wine:
1. Clone master, then, in a terminal from the root directory, build it by running
`docker build . -f ./contrib/docker/Dockerfile -t wine-lol` (this will take a while as it's actually building).
2. Then run the image you created a moment ago with a directory from your computer mounted as `/wine-exports` so docker can export the packages:
`docker run -v /directory/to/export/to:/wine-exports wine-lol` (this only takes a moment because it's already built)
3. `/directory/to/export/to` will have the package that you just built.
