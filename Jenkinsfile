pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    // Runs the build process
                    sh 'echo "Build started"'
                    sh 'npm install' // Installs all project dependencies
                    sh 'npm run build' // Builds your React app and prepares it for deployment
                    sh 'echo "Build completed"'
                }
            }
        }
        stage('Deploy to Heroku') {
            environment {
                HEROKU_API_KEY = credentials(herokusshkey) // Loads Heroku API key as an environment variable
            }
            steps {
                script {
                    // Commands to deploy the app to Heroku
                    sh 'echo "Deploying to Heroku"'
                    sh '''
                    git init
                    git add -A
                    git commit -m "Deploy from Jenkins"
                    heroku git:remote -a reactapp-app
                    git push -f heroku main
                    '''
                }
            }
        }
    }
}
