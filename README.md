# Amazon Polly example
Simple example demonstrating how [Amazon Polly](https://aws.amazon.com/blogs/aws/polly-text-to-speech-in-47-voices-and-24-languages/) works.

## Build
[![Build Status](https://travis-ci.org/kyhau/aws-polly-simple.svg?branch=master)](https://travis-ci.org/kyhau/aws-polly-simple)

## Create audio file and deploy to S3 static website

### Install awscli

See [Install awscli](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)

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
