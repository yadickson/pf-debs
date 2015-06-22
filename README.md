# pf-debs
Build Debian Package for Programmer's Friend (v5.5.0)

**Instructions**

Inside of the debs folder

**Gets orig source code**

```
debian/rules get-orig-source
```

**Check dependencies**

```
dpkg-checkbuilddeps
```

**Build source package**

```
debuild -S -nc -uc -us
```

**Tested**

```
Debian jessie
```

