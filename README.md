# docker-glibc-builder - i386

A glibc binary package builder in Docker. Produces a glibc binary package that can be imported into a rootfs to run applications dynamically linked against glibc.

This is a version of https://github.com/sgerrand/docker-glibc-builder modified to generate a i386 (32-bit) glibc.

## Usage

Build a glibc package based on version 2.23 with a prefix of `/usr/glibc-compat`:

```
make
```

## Requirements

The Docker container "ubuntu32:xenial" needs to be present in your system.
It can be created using https://github.com/daald/docker-brew-ubuntu-core-32bit
