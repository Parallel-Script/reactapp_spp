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
            script {
                withCredentials([usernamePassword(credentialsId: 'heroku-email-password')]) {
                    sh 'heroku login --token ${CREDENTIALS_API_KEY}'
                    sh 'git push heroku main'
                    }
                }
            }
        }
    }
}
