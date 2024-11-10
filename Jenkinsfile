pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    stages {
        stage('Git Checkout') {
            steps {
                git url: "https://github.com/Parallel-Script/reactapp_spp/", branch: "main"
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build React App') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Login to Heroku') {
            environment {
                HEROKU_API_KEY = credentials('heroku-api-key')  // Make sure this is the correct credentials ID
            }
            steps {
                script {
                    // Make sure the API key is properly set
                    sh 'echo $HEROKU_API_KEY | heroku auth:token'
                }
            }
        }


        stage('Deploy to Heroku') {
            steps {
                script{
                
                    withCredentials([usernamePassword(credentialsId: 'heroku-email-password', usernameVariable: 'HEROKU_EMAIL', passwordVariable: 'HEROKU_PASSWORD')]) {
                    // These variables will now hold the Heroku email and password
                    // You can now use these variables in the next steps to authenticate with Heroku

                    // Add the Heroku Git remote using the app name
                    sh "git remote add heroku https://git.heroku.com/${HEROKU_APP_NAME}.git"
    
                    // Store credentials for Git usage
                    sh """
                    git config --global credential.helper 'store'
                    echo "https://${HEROKU_EMAIL}:${HEROKU_PASSWORD}@git.heroku.com" > ~/.git-credentials
                        """
    
                    // Push code to Heroku
                    sh 'git push heroku main'
                }


                }
                
            }
        }
    }
}
