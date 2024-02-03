pipeline {
    agent any


    stages {
      

        stage('Build and Push Docker Image') {
            steps {
                // Build Docker image
                script {
                  sh 'chmod +x build.sh'
                  sh './build.sh'  
                }

       
            }
        }

        stage('Deploy') {
            steps {
                // Run your Docker container or deploy to your environment
                script {
                    sh 'chmod +x deploy.sh'
                    sh './deploy.sh'
                }
            }
        }
  
    
    }
}
