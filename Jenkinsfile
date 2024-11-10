pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    stages {
        stage('git checkout') {
            steps {                
                git url:"https://github.com/Parallel-Script/reactapp_spp/",branch:"main"
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
                // Ensure SSH authentication is set up by adding the correct remote URL for Heroku
                sh '''
                git remote remove heroku || true
                git remote add heroku git@heroku.com:reactapp-spp.git
                '''
            }
        }
       stage('Deploy to Heroku') {
        environment {
            // Fetching Heroku API key from Jenkins credentials
            HEROKU_API_KEY = credentials('heroku-api-key')  
            }
        steps {
            script {
                // Setting Heroku remote URL with the API key for authentication
                sh 'git remote set-url heroku https://$HEROKU_API_KEY@git.heroku.com/reactapp-spp.git'
                // Pushing to Heroku
                sh 'git push heroku main'
                }
            }
        }
        
    }
}
