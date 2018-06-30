# Takagi

## Project Description:

Takagi is an implementation of Cardano, the cryptographic currency.

## Stability Status:

- [x] Raw
- [ ] Draft
- [ ] Stable
- [ ] Deprecated
- [ ] Legacy

## Build Instructions
Ensure you've installed [nix](https://nixos.org/nix).
```
$ git clone git://github.com/fractalide/takagi.git
$ cd takagi
$ nix-build --argstr rs test -I fractalide=/path/to/fractalide/clone
```
