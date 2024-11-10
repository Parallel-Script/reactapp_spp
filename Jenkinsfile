pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    stages {
        stage('Git Checkout') {
            steps {
                git url: "https://github.com/Parallel-Script/reactapp_spp/", branch: "main"
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
                    // Navigate to the specified directory
                    dir('/var/lib/jenkins/workspace/spp10pipeline') {
                        // Run the git push to Heroku command
                        sh 'git push heroku master'
                    }
                }
            }
        }
    }
}
