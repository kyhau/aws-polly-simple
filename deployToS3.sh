#!/bin/bash

# Require
#export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
#export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
#export S3_BUCKET=${S3_BUCKET}
MESSAGE="Testing one, two, three"
VOICE="Nicole"
HTML_REFRESH_INTERVAL="60"

export AWS_DEFAULT_REGION=ap-southeast-2

echo "################################################################################"
echo "Creating audio file for the message ..."

aws polly synthesize-speech --output-format mp3 --voice-id ${VOICE} --text "${MESSAGE}" target.mp3 --region ${AWS_DEFAULT_REGION}

echo "################################################################################"
echo "Adding the voice message from the s3 static website page ..."

cat >index.html <<EOL
<!DOCTYPE html>
<html>
<head><meta http-equiv="refresh" content="${HTML_REFRESH_INTERVAL}"></head>
<body>
<audio controls autoplay><source src="target.mp3" type="audio/mpeg">Your browser does not support the audio element.</audio>
</body>
</html>
EOL

aws s3 sync . s3://${S3_BUCKET}/ --acl public-read --exclude "*" --include "index.html" --include "target.mp3"
