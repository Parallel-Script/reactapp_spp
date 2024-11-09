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

        stage('Deploy to Heroku') {
            environment {
                HEROKU_API_KEY = credentials('heroku-api-key')
            }
            steps {
                sh 'git remote add heroku https://git.heroku.com/reactapp-spp.git'
                sh 'git push heroku main'
            }
        }
       
        
    }
}
