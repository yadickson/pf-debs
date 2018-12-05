# pf-debs
Build Debian Package for Programmer's Friend

**Build dependencies**

- debhelper (>= 9)
- cdbs
- default-jdk
- maven-debian-helper (>= 1.5)

**Download source code**

```
debian/rules get-orig-source
debian/rules publish-source
```

**Build project**

```
dpkg-buildpackage --no-sign
```

**Tested**

- Debian wheezy
- Debian jessie
- Debian buster

[Release page](https://github.com/yadickson/pf-debs/releases)

