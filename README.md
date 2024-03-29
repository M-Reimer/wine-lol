IMPORTANT NOTICE
================

Riot plans to add Vanguard, a hightly intrusive always running kernel level anti cheat, to LoL [within just a few patches](https://www.leagueoflegends.com/en-us/news/game-updates/patch-14-4-notes/#patch-vanguard). If you haven't started to play LoL by now, and you plan to play exclusively on Linux, then you shouldn't waste time into this game and better give [Dota 2](https://www.dota2.com/) a chance. Another option for the future may be [SMITE 2](https://www.smite2.com/) which will be in early alpha in Spring 2024. SMITE 2 will officially support the SteamDeck and so likely runs on any Linux system.

More info:

* [riot's new anti-cheat is a HUGE problem.](https://www.youtube.com/watch?v=nk6aKV2rY7E) by [Low Level Learning](https://www.youtube.com/@LowLevelLearning)



Wine-LoL
========

This repository contains build scripts to build wine-lol for [Arch Linux](https://archlinux.org/) (with sync to [AUR](https://aur.archlinux.org/)). These PKGBUILDs build or repackage the [LoL wine version created by GloriousEggroll](https://github.com/GloriousEggroll/wine-ge-custom/). If you are no Arch user, please get the [builds from GloriousEggroll](https://github.com/GloriousEggroll/wine-ge-custom/releases?q=-LoL&expanded=true) directly.

All the PKGBUILDs do is help maintaining the LoL wine version on a central location. If you use it directly, you'll find the "wine executable" at the path `/opt/wine-lol/bin/wine`. But most users probably want to use a helper tool like [leagueoflegends-git](https://aur.archlinux.org/packages/leagueoflegends-git).

**NOTE**: Wine is a huge project. Depending on your system performance, you can expect *up to one hour of build time or even longer*. If you don't want to wait that long, please use the **wine-lol-bin** PKGBUILD which will just repackage the prebuilt version from GloriousEggroll and so is considerably faster!

**WARNING**: While in the past the Linux community received some help from Riot employees in cases where the in-game anti cheat caused the game to break on Linux with Wine, this is not guaranteed to keep this way. Especially as Riot plans to create some [kernel driver based anti cheat](https://eune.leagueoflegends.com/en-pl/news/dev/dev-null-anti-cheat-kernel-driver/) which may land in LoL at some time. So far noone knows for sure if LoL will still work with Wine as soon as this happens. So if you are playing on Linux, it is strongly recommended to not spend any money on skins or other in-game items! Your money will be lost as soon as Wine support breaks.

Short overview about this repository:

- **wine-lol** contains the PKGBUILD of wine-lol itself
- **wine-lol-bin** contains a PKGBUILD which repackages GloriousEggroll's official binaries
- **pkg.sh** Small helper I use for handling "git subtree" for AUR

Contributor notes about Wine version updates
--------------------------------------------

I no longer choose, patch and test Wine versions. This repository is **only** building or repackaging the great work done by GloriousEggroll. So only releases he decides to be ready to ship will be handled by my PKGBUILDs. So check his [Releases](https://github.com/GloriousEggroll/wine-ge-custom/releases?q=-LoL&expanded=true) before flagging out of date or opening an Issue.
