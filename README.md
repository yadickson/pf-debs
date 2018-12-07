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

**Repositories**

```
$ echo "deb [trusted=true] https://dl.bintray.com/yadickson/debian [distribution] main" | sudo tee -a /etc/apt/sources.list.d/bintray.list
$ sudo apt-get update
$ sudo apt-get upgrade -y
$ sudo apt-get install libpf-java
```

[Release page](https://github.com/yadickson/pf-debs/releases)

[Debian Repository](https://bintray.com/yadickson/debian)

[travis-image]: https://api.travis-ci.org/yadickson/pf-debs.svg?branch=wheezy
[travis-url]: https://travis-ci.org/yadickson/pf-debs

