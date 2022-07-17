# PKGBUILDs

Use GitHub Actions for building and packaging a few [AUR](https://aur.archlinux.org) packages and deploy them to [GitHub Releases](https://github.com/jckimble/pkgbuilds/releases) so it can be used as a repository in [Arch Linux](https://www.archlinux.org).  Based on [djpohly/PKGBUILD](https://github.com/djpohly/PKGBUILD).


## Using as a pacman repository

To use as custom repository in [Arch Linux](https://www.archlinux.org), add to file `/etc/pacman.conf`:

```
[PKGBUILD]
SigLevel = Optional TrustAll
Server = https://github.com/jckimble/pkgbuilds/releases/download/repository
```

## TODO (Ideas)

  - Add GPG Signing with github action to keep key updated
  - Set matrix to only run changed files or submodules

## Customizing

To build AUR packages of your own selection, fork this repository.  The master branch contains most of the build actions.

  - Fork this GitHub repository.
  - Create a release (name currently hardcoded as "repository") in which your package repository will be stored.
  - Add git submodule
  - Each time you push an update to the repository, the package will be built and uploaded, and the repository updated.