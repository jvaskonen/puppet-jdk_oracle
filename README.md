# puppet-jdk_oracle
[![Build Status](https://travis-ci.org/schrepfler/puppet-jdk_oracle.svg?branch=master)](https://travis-ci.org/schrepfler/puppet-jdk_oracle)
[![Puppet Forge](https://img.shields.io/puppetforge/v/schrepfler/jdk_oracle.svg?style=flat)](https://forge.puppetlabs.com/schrepfler/jdk_oracle)
[![Puppet Forge Downloads](https://img.shields.io/puppetforge/dt/schrepfler/jdk_oracle.svg)](https://forge.puppetlabs.com/schrepfler/jdk_oracle)

Puppet module to install a JDK from the RPM binary distribution from oracle using wget.
Based on the https://github.com/tylerwalts/puppet-jdk_oracle this module removed support for JDK6 and the tgz installer.

Source: http://www.oracle.com/technetwork/java/javase/downloads/index.html

_Note:  By using this module you will automatically accept the Oracle agreement to download Java._

This module will work on Redhat family of OSs, and will use wget with a cookie to automatically grab the RPM installer from Oracle.

This approach was inspired by: http://stackoverflow.com/questions/10268583/how-to-automate-download-and-instalation-of-java-jdk-on-linux

Default Version
-----
* JDK8 8u151
* JDK7 7u80

Features
----
* RedHat Family (RedHat, Fedora, CentOS)
* Java 7 and Java 8
* Possibility to choose between 64 bit `arch=x64` (default) and 32 bit `arch=i586` architectures.
* Possibility to install JCE on JDK8

Installation
------

* Traditional
> Copy this project into your puppet modules path and rename it to "jdk_oracle"

* From Puppet Forge
> Install from Puppet Forge:
```
$ puppet module install schrepfler-jdk_oracle
```

* Puppet Librarian
> Put this in your Puppetfile:
```
    mod "schrepfler/jdk_oracle",
        :git => "git://github.com/schrepfler/puppet-jdk_oracle.git"
```

Usage
---

##### Traditional
```
include jdk_oracle
```
or
```
class { 'jdk_oracle': }
```


##### Hiera
config.json:
```
{
    classes":[
      "jdk_oracle"
    ]
}
```
OR
config.yaml:
```
classes:
- "jdk_oracle"
jdk_oracle::version: 7
```

site.pp:
```
hiera_include("classes", [])
```


Parameters:
----

**version** (*integer `7` | `8`*) - *Java version to install.*

**arch** (*enum `'x64'`|`'586'`*) - *parameter to provide support for other architectures, default `'x64'`.*

**install_dir** (*string*)
*- Java installation directory.*

**tmp_dir** (*string*)
*- Temp directory to download the installer, default `'/tmp'`.*

**use_cache** (*string*)
*- Optionally host the installer file locally instead of fetching it each time, for faster dev & test.*

**cache_source** (*string*)
*- The directory where the installer will be cached.*

**jce**  (*boolean*)
*- if true will install the Java Cryptographic Extensions (default `false`.)*

**default_java** (*boolean*)
*- if true the module will set the installed JDK to be the default system java (default `true`.)*

TODO:
---

* Automate installation of security policies  [security policies reference][]
* ~~Handle JCE installation~~
* Refactor tests to support some use cases of the tgz module
* ~~Add support for 32-bit JDK~~
* ~~Add build status icons~~
* Make it possible to uninstall the jdk package
* Automate a bit the release process (bump README, Contributors, changelog...)

[security policies reference]: https://docs.oracle.com/javase/7/docs/technotes/guides/security/PolicyFiles.html
