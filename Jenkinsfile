pipeline {

    agent any

    triggers {
        githubPush()
    }

    stages {

        stage('Clone') {
            steps {
                echo 'Cloning repository...'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t mywebapp:w1 .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop mywebapp_container || true'
                sh 'docker rm mywebapp:w1 || true'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker run -d \
                  --name mywebapp_container \
                  -p 5001:5000 \
                  -p 80:80 \
                  mywebapp:w1
                '''
            }
        }
    }
}