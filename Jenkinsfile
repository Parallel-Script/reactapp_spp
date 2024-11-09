pipeline {
    agent any
    stages {
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
        stage('Deploy to Heroku') {
            environment {
                HEROKU_API_KEY = credentials('heroku-api-key') // Add API key in Jenkins credentials
            }
            steps {
                sh 'git remote add heroku https://git.heroku.com/reactapp-spp.git'
                sh 'git push heroku main'
            }
        }
    }
}
