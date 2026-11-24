#!/bin/bash

SOURCE="$HOME/project-19-s3-backup/logs/app.log"
BUCKET="prasun-project19-scheduled-backup-2026"

aws s3 cp "$SOURCE" "s3://$BUCKET/logs/app.log"
