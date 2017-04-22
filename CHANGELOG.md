# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [1.0.8] - 2017-04-24
### Changed
- Updating default JDK8 to update 131

## [1.0.7] - 2017-01-20
### Changed
- BREAKING I've noticed this time the download url has changed, tried to hardcode the given path to this version, not sure if it will expire in the future.
- Updating default JDK8 to update 121

## [1.0.6] - 2016-10-26
### Enhancement
- If download of rpm fails, assure the resource is deleted so that puppet can retry.

## [1.0.5] - 2016-10-26
### Bugfix
- JDK8 was defaulting the previous build.

## [1.0.4] - 2016-10-24
### Changed
- Updating default JDK8 to update 111

## [1.0.3] - 2016-07-27
### Added
- This CHANGELOG file to hopefully serve as an evolving example of a standardized open source project CHANGELOG.
- More badges to get some bling @030

### Changed
- BREAKING The JDK version has been transformed from string to integer @030
- BREAKING Changed default lookup of arguments to not call hiera directly leaning on default puppet 4 behaviour. Not sure if puppet 3 users will be affected. Please report back and we'll try to revert this behaviour.
- Updating default JDK8 to update 101
