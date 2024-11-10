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
                HEROKU_API_KEY = credentials('heroku-api-key')  // Ensure this is stored as Jenkins credentials
            }
            steps {
                script {
                    // Use the API key to log in to Heroku
                    sh 'echo $HEROKU_API_KEY | heroku auth:token'
                }
            }
        }

        stage('Set Heroku Remote') {
            steps {
                sh 'git remote remove heroku || true'
                sh 'git remote add heroku https://git.heroku.com/reactapp-spp.git'
            }
        }

        stage('Deploy to Heroku') {
            steps {
                sh 'git push heroku main'
            }
        }
    }
}
