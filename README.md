# Drone Plugin for Pronto

[Pronto](https://github.com/prontolabs/pronto) is a tool for "quick automated code review of your changes" allowing to comment linter warnings on commits or pull requests in Github, Gitlab or Bitbucket.
This drone plugin makes it as simple as

    lint:
      when:
        event: [pull_request]
      image: 7mind/drone-pronto
      formatters: [bitbucket_pr text]    
      runner: [scss slim]

to automate your review. 

Supported runners included as of now:

- [pronto-slim](https://github.com/nysthee/pronto-slim)
- [pronto-scss](https://github.com/prontolabs/pronto-scss)
- [pronto-credo](https://github.com/carakan/pronto-credo)

Note: Additional parameters such as BITBUCKET_USERNAME should be specified using a .pronto.yml configuration file.

## Parameter Reference

```formatters```
list, available items: github, github_status, github_pr, github_pr_review, gitlab, bitbucket, bitbucket_pr, bitbucket_server_pr, json, checkstyle, text

```runner```
list, any pronto runner name (leaving out the *pronto-* prefix)

```commit```
Commit for the diff, Default: master

```args```
Any additonal args to be passed to prone