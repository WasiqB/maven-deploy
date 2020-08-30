# maven-deploy Orb 

[![CircleCI Build Status](https://circleci.com/gh/WasiqB/maven-deploy.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/WasiqB/maven-deploy)
[![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/wasiqb/maven-deploy)](https://circleci.com/orbs/registry/orb/wasiqb/maven-deploy)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

A reusable Maven deploy orb for CircleCI pipeline. Utilize this orb to easily deploy to Maven central from your CI/CD pipeline.

## Inspiration

Maven-deploy is inspired from [github-maven-deploy](https://circleci.com/orbs/registry/orb/github-maven-deploy/github-maven-deploy), 
but it differs with it in following ways,

- It supports parameterization of executor.
- It does not include build jobs.
- It supports the password protected GPG keys.
- It signs the release tags with GPG keys.

## Usage

Example use-cases are provided on the orb [registry page](https://circleci.com/orbs/registry/orb/wasiqb/maven-deploy#usage-examples). Source for these examples can be found within the `src/examples` directory.

## Resources

[CircleCI Orb Registry Page](https://circleci.com/orbs/registry/orb/wasiqb/maven-deploy) - The official registry page of this orb for all versions, executors, commands, and jobs described.  
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.  

### How To Contribute

We welcome [issues](https://github.com/WasiqB/maven-deploy/issues) to and [pull requests](https://github.com/WasiqB/maven-deploy/pulls) against this repository!

To publish a new production version:
* Create a PR to the `Alpha` branch with your changes. This will act as a "staging" branch.
* When ready to publish a new production version, create a PR from `Alpha` to `master`. The Git Subject should
 include `[semver:patch|minor|major|skip]` to indicate the type of release.
* On merge, the release will be published to the orb registry automatically.

For further questions/comments about this or other orbs, visit the Orb Category of [CircleCI Discuss](https://discuss.circleci.com/c/orbs).
