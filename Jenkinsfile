pipeline {
    agent any
    tools {
        nodejs 'nodejs'  // Use the correct Node.js tool name as configured in Jenkins
    }
    environment {
        HEROKU_API_KEY = credentials('heroku-api-key')  // Use your Jenkins credentials ID for Heroku API key
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
                    // If you need to pull the latest code, make sure to run git commands in the project directory
                    dir('./reactapp_spp') {  // Ensure the directory is relative to the workspace
                        sh 'git pull origin main'  // Pull latest changes from GitHub (or your Git repository)
                    }
                }
            }
        }

        stage('Push to Heroku') {
            steps {
                script {
                    // Navigate to your project directory and push to Heroku
                    dir('./reactapp_spp') {  // Ensure the directory is relative to the workspace
                          // Add Heroku remote if not already added
                        sh 'git push heroku main'  // Push to Heroku's main branch
                    }
                }
            }
        }
    }
}
