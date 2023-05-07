Wine-LoL
========

This repository contains build scripts to build wine-lol for [Arch Linux](https://archlinux.org/) (with sync to [AUR](https://aur.archlinux.org/)). These PKGBUILDs build the wine version created by [GloriousEggroll](https://github.com/GloriousEggroll).

You can find the source project here: https://github.com/GloriousEggroll/wine-ge-custom/

My PKGBUILDs are only meant to simplify some stuff for Arch Linux users. If you are no Arch user then just go to [the wine-ge-custom release page](https://github.com/GloriousEggroll/wine-ge-custom/releases?q=-LoL&expanded=true) and grab the latest official "-LoL" release to extract wherever you like.

**WARNING**: While in the past the Linux community received some help from Riot employees in cases where the in-game anti cheat caused the game to break on Linux with Wine, this is not guaranteed to keep this way. Especially as Riot plans to create some [kernel driver based anti cheat](https://eune.leagueoflegends.com/en-pl/news/dev/dev-null-anti-cheat-kernel-driver/) which may land in LoL at some time. So far noone knows for sure if LoL will still work with Wine as soon as this happens. So if you are playing on Linux, it is strongly recommended to not spend any money on skins or other in-game items! Your money will be lost as soon as Wine support breaks.

Short overview about this repository:

- **wine-lol** contains the PKGBUILD of wine-lol itself
- **wine-lol-bin** contains a PKGBUILD which repackages GloriousEggroll's official binaries
- **pkg.sh** Small helper I use for handling "git subtree" for AUR

Contributor notes about Wine version updates
--------------------------------------------

I no longer choose, patch and test Wine versions. This repository is **only** building or repackaging the great work done by GloriousEggroll. So only releases he decides to be ready to ship will be handled by my PKGBUILDs. So check his [Releases](https://github.com/GloriousEggroll/wine-ge-custom/releases?q=-LoL&expanded=true) before flagging out of date or opening an Issue.
