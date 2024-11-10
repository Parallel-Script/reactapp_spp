pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    environment {
        HEROKU_API_KEY = credentials('heroku-api-key') // Use your Jenkins credentials ID for Heroku API key
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


        stages {
        stage('Clone Repository') {
            steps {
                script {
                    // If you need to pull the latest code, make sure to run git commands in the project directory
                    dir('/react_app/reactapp_spp') {
                        sh 'git pull origin main'  // Pull latest changes from GitHub (or your Git repository)
                    }
                }
            }
        }

        stage('Push to Heroku') {
            steps {
                script {
                    // Navigate to your project directory and push to Heroku
                    dir('/react_app/reactapp_spp') {
                        sh 'git remote add heroku https://git.heroku.com/reactapp-spp.git'  // Add Heroku remote if not already added
                        sh 'git push heroku main'  // Push to Heroku's main branch
                    }
                }
            }
        }
        }
    }
}
