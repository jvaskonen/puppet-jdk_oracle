Provision Build environment
========

I've used more/less the approach in [this article](https://oglok.github.io/2017-01-27-Test-puppet-spec-in-a-docker/) to setup a Docker environment.
```shell
docker build -t centos_puppet .
```

Enter Build environement
========
```shell
docker run -v $(pwd):/src -t -i centos_puppet /bin/bash
```

Build steps
=======

```shell
rm -rf /src/pkg
cd /src
puppet module build .
cd /src/pkg
puppet module install schrepfler-jdk_oracle-*.tar.gz
puppet apply --modulepath /etc/puppetlabs/code/environments/production/modules /src/test/manifests/site.pp
java -version
```

- Make modifications to module (if bump to java, change default values and bump tests as well.)
- Make modifications to _metadata.json_
- Make modifications to README.md.
- Make modifications to CHANGELOG.md.
- Make modifications to CONTRIBUTORS.md.
- Commit, push, wait for tests available https://travis-ci.org/schrepfler/puppet-jdk_oracle
- Tag

Upload module to pupetforge
======
1. Go to https://forge.puppet.com/ and login
2. Open https://forge.puppet.com/upload
3. Upload artifact
