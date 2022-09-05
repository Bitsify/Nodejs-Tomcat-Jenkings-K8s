pipeline {
    environment {
        dockerimagename = "nikkihub/nodeapp"
        dockerImage = ""
    }
    agent any
    stages {
        stage ('Checkout Source') {
            steps {
                git 'https://github.com/Bitsify/Nodejs-Tomcat-Jenkings-K8s.git'
            }
        }
        stage('Build image') {
            steps{
                script {
                    dockerImage = docker.build dockerimagename
                }
            }
        }
        stage('Pushing Image') {
            environment {
                registryCredential = 'nikkihubdockerhublogin'
            }
            steps{
                script {
                    docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
                        dockerImage.push("latest")
                    }
                }
            }
        }
        stage('Deploying App to Kubernetes') {
            steps {
                script{
                    kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "nikkihubkubernetes")
                }
            }
        }
    }
}