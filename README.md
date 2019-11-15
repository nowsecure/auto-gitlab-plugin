# NowSecure AUTO GitLab Plugin

This plugin adds the ability to perform automatic mobile app security testing for Android and iOS mobile apps through the NowSecure AUTO test engine.

## Summary

Purpose-built for mobile app teams, NowSecure AUTO provides fully automated, mobile appsec testing coverage (static+dynamic+behavioral tests) optimized for the dev pipeline. Because NowSecure tests the mobile app binary post-build from CircleCI, it can test software developed in any language and provides complete results including newly developed code, 3rd party code, and compiler/operating system dependencies. With near zero false positives, NowSecure pinpoints real issues in minutes, with developer fix details, and routes tickets automatically into ticketing systems, such as Jira. NowSecure is frequently used to perform security testing in parallel with functional testing in the dev cycle. Requires a license for and connection to the NowSecure AUTO software.
 https://www.nowsecure.com

## Job Parameters

All of these can be and should be passed in as variables to GitLab CI jobs.

- `auto_token` **Required** - Authentication token for Auto API. Visit https://docs.nowsecure.com/auto/integration-services/jenkins-integration to generate token.
- `auto_url` (default: https://lab-api.nowsecure.com) **Optional** Auto API location
- `auto_group` **Required** 
- `max_wait` (default: 30) **Optional** Maximum wait in minutes until security test is completed. To skip the wait, set to 0.
- `min_score` (default: 50) **Optional** Minimum score the app must have otherwise the job will fail
- `auto_show_status_messages` (default: true) Specify flag to show status messages from automation testing. Set to false to hide status messages

## Sample Usage

You should pass `auto_token` in via CI/CI variable in GitLab Settings instead in the Job Definition for security reasons.

```yaml
nowsecure-auto:
  stage: test
  image: nowsecure/auto-gitlab-plugin:v1.1.0
  variables:
    auto_group: 00000000-0000-0000-0000-000000000000
    binary_file: /path/to/artifact/apk/or/ipa/file
  script:
    - bash run-tests
```

Note that you will generate mobile binary using gradle, Makefile, Fastlane or other tools instead of copying file but it shows how binary file will be created and then passed to the Auto CircleCI Orb for security analysis.

## Getting Started

### Access token

Generate token as described on https://docs.nowsecure.com/auto/integration-services/jenkins-integration. This token will be specified by environment variable AUTO_TOKEN in CircleCI context as bellow.

