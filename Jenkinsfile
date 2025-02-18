pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = "docker-hub-credentials"
    }

    stages { 

        stage('Clone Repository') {
    steps {
        withCredentials([string(credentialsId: 'github-pat', variable: 'GITHUB_PAT')]) {
            sh 'git clone https://$GITHUB_PAT@github.com/saadiqkhn/node-nginx-app.git'
        }
    }
}

        stage('Build and Push Docker Images') {
            steps {
                sh '''
                docker-compose build
                docker-compose push
                '''
            }
        }

        stage('Deploy Application') {
            steps {
                sh '''
                docker-compose down
                docker-compose up -d
                '''
            }
        }
    }  
}
