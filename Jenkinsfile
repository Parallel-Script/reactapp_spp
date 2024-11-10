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

        stage('Navigate to Workspace') {
            steps {
                script {
                    sh 'cd /var/lib/jenkins/workspace/spp10pipeline'
                }
            }
        }
        stage('Login to Heroku') {
            steps {
                script {
                    sh '''
                    echo "Logging into Heroku"
                    echo "veeruved186@gmail.com" | heroku login
                    # Simulate password input (not secure, use environment variables for real cases)
                    expect << EOF
                    spawn heroku login
                    expect "Email:"
                    send "veeruved186@gmail.com\\r"
                    expect "Password:"
                    send "HRKU-7f8a55e4-d16a-44b4-8bfc-5d6d3c95987b\\r"
                    EOF
                    '''
                }
            }
        }
        stage('Push to Heroku') {
            steps {
                script {
                    sh 'git push heroku'
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
