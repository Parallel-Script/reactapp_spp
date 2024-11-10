pipeline {
    agent any
    tools {
        nodejs 'nodejs' // ensure nodejs is set up in Jenkins
    }
    environment {
        HEROKU_API_KEY = credentials('heroku-api-key') // Using the Heroku API key stored in Jenkins credentials
    }
    stages {
        stage('Git Checkout') {
            steps {
                git url: "https://github.com/Parallel-Script/reactapp_spp.git", branch: "main"
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

        stage('Set Heroku Remote') {
            steps {
                script {
                    // Remove any existing heroku remote and add a new one
                    sh 'git remote remove heroku || true' // to prevent error if remote does not exist
                    sh 'git remote add heroku https://git.heroku.com/reactapp-spp.git'
                }
            }
        }

        stage('Deploy to Heroku') {
            steps {
                withCredentials([string(credentialsId: 'heroku-api-key', variable: 'HEROKU_API_KEY')]) {
                    script {
                        // Use Heroku API Key to authenticate
                        sh 'git remote set-url heroku https://$HEROKU_API_KEY@git.heroku.com/reactapp-spp.git'
                        // Push to Heroku
                        sh 'git push heroku main'
                    }
                }
            }
        }
    }
}
