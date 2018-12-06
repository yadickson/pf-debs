# Debian Package for Programmer's Friend Project

[![TravisCI Status][travis-image]][travis-url]

**Build dependencies**

- debhelper (>= 9)
- cdbs
- default-jdk
- maven-debian-helper (>= 1.5)

**Download source code**

- unzip
- wget
- libc-bin
- dos2unix 

```
$ debian/rules get-orig-source
$ debian/rules publish-source
```

**Build project**

```
$ dpkg-buildpackage -rfakeroot -D -us -uc -i -I -sa
```
or
```
$ QUILT_PATCHES=debian/patches quilt push -a
$ fakeroot debian/rules clean binary
```

**Tested**

- Debian wheezy
- Debian jessie
- Debian buster

[travis-image]: https://api.travis-ci.org/yadickson/pf-debs.svg?branch=wheezy
[travis-url]: https://travis-ci.org/yadickson/pf-debs

[Release page](https://github.com/yadickson/pf-debs/releases)
[Debian Repository](https://bintray.com/yadickson/debian)

