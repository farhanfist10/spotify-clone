pipeline {
    agent any

    environment {
        IMAGE_NAME = 'spotify-clone'
        CONTAINER_NAME = 'spotify-clone-container'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url:'https://github.com/farhanfist10/spotify-clone.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Remove Old Container') {
            steps {
                script {
                    // Stop and remove existing container if it exists
                    sh """
                    docker rm -f ${CONTAINER_NAME} || true
                    """
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    sh """
                    docker run -d --name ${CONTAINER_NAME} -p 9050:80 ${IMAGE_NAME}
                    """
                }
            }
        }
    }

    post {
        success {
            echo "🎉 Deployment Successful! Your app should be running on port 9050."
        }
        failure {
            echo "❌ Deployment Failed! Please check the console output for errors."
        }
    }
}
