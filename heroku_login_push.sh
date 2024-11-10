#!/bin/bash

# Change to the Jenkins workspace directory
cd /var/lib/jenkins/workspace/spp10pipeline

# Login to Heroku using expect
/usr/bin/expect <<EOF
spawn heroku login
expect "Email:"
send "veeruved186@gmail.com\r"
expect "Password:"
send "pass\r"
expect eof
EOF

# Push to Heroku
git push heroku

