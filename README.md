# Amazon Polly example
Simple example demonstrating how [Amazon Polly](https://aws.amazon.com/polly/details/) works.

## Build
[![Build Status](https://travis-ci.org/kyhau/aws-polly-simple.svg?branch=master)](https://travis-ci.org/kyhau/aws-polly-simple)

## Create audio file and deploy to S3 static website

### Set up AWS resources

1. Create CloudFormation stack with `Polly-GroupAndPolicy-StaticWebsite.template`.
1. Create IAM User with Access Key and add the User to the Group created in previous step.
1. Install [awscli](http://docs.aws.amazon.com/cli/latest/userguide/installing.html).

### Set up environment

```
$ export AWS_ACCESS_KEY_ID=[secure]
$ export AWS_SECRET_ACCESS_KEY=[secure]
$ export S3_BUCKET=[secure]
```
### Run deploy script

```
$ ./deployToS3.sh
```

## S3 static website url: 

Open this url in a new tab of the Chrome browser.

http://your_bucket.s3-website-ap-southeast-2.amazonaws.com
