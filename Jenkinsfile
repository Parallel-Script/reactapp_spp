pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    environment {
        HEROKU_USERNAME = 'veeruved186@gmail.com'  // Replace with your Heroku username
        HEROKU_API_KEY = ''   // Replace with your Heroku API key
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
                        sh 'git push heroku main'
                        
                    }
                }
            }
        }
    }
}
