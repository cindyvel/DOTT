properties([pipelineTriggers([githubPush()])])

pipeline {
	agent any
		stages {
			stage('One') {
				steps {
					sh 'echo "Step One"'
				}
			}


			stage('Build') {
				steps {
					sh 'echo "Sonar Qube and code analysis"'
				}
			} 

			stage('Test') {
				steps {
					sh 'echo "Step Three and a half"'
				}
			}
		}
}
