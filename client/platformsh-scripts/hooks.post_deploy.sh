#!/usr/bin/env bash
########################################################################################################################
# NOTE:
# 
# This script runs the post_deploy commands for the Next.js frontend, sourcing a .environment file generated by the 
#   backend Drupal app, running a connection verification test (that will contain debug information if it fails),
#   and re-building the frontend application.
#
########################################################################################################################
# Rebuild now that the backend is available.
#   a. Source the relevant environment variables.
# . $GENERATED_VARS
#   b. Verify the connection to the backend can be made with those variables.
cd platformsh-scripts/test/next-drupal-debug && yarn debug
#   c. Build the frontend.
cd $PLATFORM_APP_DIR && yarn build
