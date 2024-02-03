pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'your-docker-username/your-image-name'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code from your version control system
                checkout scm
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                // Build Docker image
                script {
                    dockerImage = docker.build env.DOCKER_IMAGE
                }

                // Push Docker image to Docker Hub
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                // Run your Docker container or deploy to your environment
                script {
                    docker.image(env.DOCKER_IMAGE).run('-p 8080:80 --name your-container-name -d')
                }
            }
        }
    }

    post {
        always {
          
            script {
                docker.image(env.DOCKER_IMAGE).remove()
            }
        }
    }
}
