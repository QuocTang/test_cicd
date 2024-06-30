pipeline {
	agent any
	stages {
		stage('Clone stage') {
			steps {
				git 'https://github.com/QuocTang/test_cicd.git'
			}
		}
		stage('Build stage') {
			steps {
				withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
					sh 'docker build -t test_cicd_image .'
					sh 'docker push test_cicd_image'
				}
			}
		}
	}
}
