pipeline {
    agent any
    tools{
        maven ('M2_HOME')
    }
    environment {
    registry = '823008317281.dkr.ecr.us-east-1.amazonaws.com/devops_repo'
    registryCredential = 'Jenkins-ecr'
    dockerimage = ''
  }
   stages {
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/nyfane/helloworld_jan_22.git'
            }
        }
        stage('Code build') {
            steps {
                sh 'mvn clean'
                sh 'mvn install'
                sh 'mvn package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build Image') {
            steps {
                script{
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                } 
            }
        }
     stage('Deployment image') {
            steps{
                script{ 
                    docker.withRegistry("https://"+registry,"ecr:us-east-1:"+registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }  
    }
}

