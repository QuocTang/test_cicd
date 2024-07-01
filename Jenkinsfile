pipeline {
	agent any

	environment {
        REMOTE_USER = 'ec2-user'
        REMOTE_HOST = 'ec2-54-206-101-146.ap-southeast-2.compute.amazonaws.com'
    }

	stages {
		stage('Clone stage') {
			steps {
				git 'https://github.com/QuocTang/test_cicd.git'
			}
		}
		stage('Build stage') {
			steps {
				// withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
				// 	sh 'docker build -t quoctang/test_cicd_image:v1.0.1 .'
				// 	sh 'docker push quoctang/test_cicd_image:v1.0.1'
				// }
				echo 'Build images done nice'
			}
		}
		stage('AWS stage') {
			steps {
				sshagent(['ssh-remote']) {
					sh 'ssh -o StrictHostKeyChecking=no -l root ${REMOTE_HOST} "touch jenkins_test.txt"'
				}
			}
		}
	}
}
