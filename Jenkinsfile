pipeline {
    agent any

    

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Parallel-Script/reactapp_spp.git'
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

        stage('Heroku Login and Push') {
            steps {
                script {
                    // Run the script to log in and push to Heroku
                    sh '/var/lib/jenkins/workspace/spp10pipeline/heroku_login_push.sh'
                }
            }
        }
        
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
