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
					sh 'docker build -t quoctang/test_cicd_image:v1.0.0 .'
					sh 'docker push quoctang/test_cicd_image:v1.0.0'
				}
			}
		}
	}
}
