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
                // Use the Heroku API key if needed for CLI authentication
                HEROKU_API_KEY = credentials('heroku-api-key')
            }
            steps {
                // Run the deployment using SSH and ensure the build folder is pushed if necessary
                sh '''
                # Ensure the Heroku CLI is authenticated if using API key
                if [ -n "$HEROKU_API_KEY" ]; then
                    echo "$HEROKU_API_KEY" | heroku auth:token --stdin
                fi
                
                # Push to Heroku using SSH
                git push heroku main
                '''
            }
        }
       
        
    }
}
