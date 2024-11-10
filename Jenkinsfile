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

        stage('Test SSH to Heroku') {
            steps {
                script {
                    sshagent(['heroku-ssh-key']) {
                        sh 'ssh -T git@heroku.com'
                    }
                }
            }
        }

        stage('Deploy to Heroku') {
            steps {
                script {
                    sshagent(['heroku-ssh-key']) {
                        dir('/var/lib/jenkins/workspace/spp10pipeline') {
                            sh 'git remote set-url heroku git@heroku.com:YourHerokuAppName.git'
                            sh 'git push heroku main'
                        }
                    }
                }
            }
        }
    }
}
