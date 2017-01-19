#!/bin/bash

# Require
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# S3_BUCKET
MESSAGE="Testing one, two, three"
VOICE="Nicole"
HTML_REFRESH_INTERVAL="30"
MESSAGE_LIFETIME="30"

export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
export AWS_DEFAULT_REGION=us-east-2

echo "################################################################################"
echo "Creating audio file for the message ..."

aws polly synthesize-speech --output-format mp3 --voice-id ${VOICE} --text "${MESSAGE}" target.mp3 --region us-east-2

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

echo "################################################################################"
echo "Sleeping for ${MESSAGE_LIFETIME} seconds before removing the voice message..."

sleep ${MESSAGE_LIFETIME}

echo "################################################################################"
echo "Removing the voice message from the s3 static website page ..."

cat >index.html <<EOL
<!DOCTYPE html>
<html>
<head><meta http-equiv="refresh" content="${HTML_REFRESH_INTERVAL}"></head>
<body><p>Refresh interval: ${HTML_REFRESH_INTERVAL} seconds</p></body>
</html>
EOL

aws s3 sync . s3://${S3_BUCKET}/ --acl public-read --exclude "*" --include "index.html"
