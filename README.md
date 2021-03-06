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

  - Use issue forms to auto add aur packages?

## Customizing

To build AUR packages of your own selection, fork this repository.  The master branch contains most of the build actions.

  - Fork this GitHub repository.
  - Change config.json
  - Optional: add secret key "ENCRYPTION_KEY" for signing
  - Optional: create custom keyring package (Feel free to use mine as a reference)
  - Add git submodule
  - Each time you push an update to the repository, the package will be built and uploaded, and the repository updated.

## config.json default values (all values are optional)
```json
{
    "encGPG": "key.gpg.enc",
    "pubGPG": "public.gpg",
    "name": "GitHub Action",
    "email": "github-action@users.noreply.github.com",
    "repoName": "aur"
}
```