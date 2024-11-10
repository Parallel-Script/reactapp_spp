pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    environment {
        HEROKU_USERNAME = 'veeruved186@gmail.com'  // Replace with your Heroku username
        HEROKU_API_KEY = 'HRKU-7f8a55e4-d16a-44b4-8bfc-5d6d3c95987b'   // Replace with your Heroku API key
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

        stage('Clone Repository') {
            steps {
                script {
                    dir('./reactapp_spp') {
                        sh 'git pull origin main'
                    }
                }
            }
        }

        stage('Push to Heroku') {
            steps {
                script {
                    dir('./reactapp_spp') {
                        // Add Heroku remote with username and API key as password for authentication
                        sh """
                        git remote add heroku https://$HEROKU_USERNAME:$HEROKU_API_KEY@git.heroku.com/reactapp-spp.git
                        git push heroku main
                        """
                    }
                }
            }
        }
    }
}
