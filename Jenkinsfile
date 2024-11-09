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
       
        
    }
}
