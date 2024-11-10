pipeline {
    agent any

    environment {
        HEROKU_API_KEY = credentials('heroku-api-key')
        HEROKU_APP_NAME = 'reactapp-spp'
    }

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

        stage('Deploy to Heroku') {
            steps {
                script {
                    // Skip installation and directly use Heroku CLI commands
                    sh '''
                    echo "$HEROKU_API_KEY" | heroku auth:token
                    heroku git:remote -a $HEROKU_APP_NAME
                    git init
                    git add .
                    git commit -m "Deploy via Jenkins"
                    git push -f heroku `git rev-parse --abbrev-ref HEAD`:main
                    '''
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
