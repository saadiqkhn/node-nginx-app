pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "saadiqkhn/node-nginx-app"
        DOCKER_CREDENTIALS = "docker-hub-credentials"
    }

    stages { 

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/saadiqkhn/node-nginx-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: "docker-hub-password", variable: 'DOCKER_PAT')]) {
                    sh 'echo $DOCKER_PAT | docker login -u saadiqkhn --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE'
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker stop node-nginx-app || true
                docker rm node-nginx-app || true
                docker run -d -p 80:80 --name node-nginx-app $DOCKER_IMAGE
                '''
            }
        }
    }  
}


