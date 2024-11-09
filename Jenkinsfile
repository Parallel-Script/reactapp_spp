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
       
        
    }
}
