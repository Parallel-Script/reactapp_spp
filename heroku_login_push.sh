#!/bin/bash

# Change to the Jenkins workspace directory
cd /var/lib/jenkins/workspace/spp10pipeline

# Login to Heroku using expect
/usr/bin/expect <<EOF
spawn heroku login -i
expect "Email:"
send "veeruved186@gmail.com\r"
expect "Password:"
send "HRKU-7f8a55e4-d16a-44b4-8bfc-5d6d3c95987b\r"
expect eof
EOF

# Push to Heroku
git push heroku

