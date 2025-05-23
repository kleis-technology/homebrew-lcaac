# Homebrew LCAAC

This repository contains the Homebrew formulae related to [LCAAC](https://github.com/kleis-technology/lcaac).


To update the nix file
- update the src url
- set `sha256 = lib.fakeSha256`
- run `nix-build .`
You will get an error, stating that the hash does not match the actual hash value.
Copy-paste the actual hash value.

To update the homebrew file
- update the src url
- download the archive file, and execute `sha256sum <file.tar.gz>`
- copy and set the sha 256 value accordingly

In all cases, don't forget to update the version numbers.
