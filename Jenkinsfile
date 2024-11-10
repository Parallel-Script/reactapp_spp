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
       }
        stage('heroku deploy gemini') {
            steps {
                script {
                    // Securely use Heroku API token
                    withCredentials([usernamePassword(credentialsId: 'heroku-email-password')]) {
                        sh 'heroku login --token ${CREDENTIALS_API_KEY}'
                        sh 'heroku container:login'
                        sh 'heroku container:push web'
                        sh 'heroku container:release web'
                    }
                }
            }
        }
        
    
}
