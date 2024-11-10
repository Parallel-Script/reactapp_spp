pipeline {
    agent any

    environment {
        // Replace 'HEROKU_API_KEY' with the Jenkins credential ID for your Heroku API key
        HEROKU_API_KEY = credentials('heroku-api-key')
        HEROKU_APP_NAME = 'reactapp-spp'  // Replace with your Heroku app name
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Parallel-Script/reactapp_spp.git'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                script {
                    // Ensures Node.js and npm are installed
                    sh 'npm install'
                }
            }
        }
        
        stage('Build React App') {
            steps {
                script {
                    sh 'npm run build'
                }
            }
        }

        stage('Deploy to Heroku') {
            steps {
                script {
                    // Install Heroku CLI if not already installed
                    sh 'curl https://cli-assets.heroku.com/install.sh | sh'
                    
                    // Authenticate and deploy the app to Heroku
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
