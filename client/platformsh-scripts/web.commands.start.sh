#!/usr/bin/env bash
########################################################################################################################
# NOTE:
# 
# This script runs the start commands for the Next.js frontend app, sourcing a .environment file generated by the 
#   backend Drupal app, building the frontend app, and starting a pm2 daemon that watches for changes to the build.
#
########################################################################################################################
# Build the site and start the pm2 process, watching for changes brought by post_deploy.
#   a. Source the relevant environment variables if available (after the first push).
# if [ -f "$GENERATED_VARS" ]; then
#     . $GENERATED_VARS
# fi
#   b. Build the frontend.
yarn build
#   c. Get the frontend app name, and start a daemon that watches for changes.
APP=$(cat package.json | jq -r '.name')
pm2 start npm --no-daemon --watch --name $APP -- start -- -p $PORT
