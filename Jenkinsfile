properties([pipelineTriggers([githubPush()])])

pipeline {
	agent any
		stages {
			stage('One') {
				steps {
					sh 'echo "Step One"'
				}
			}


			stage('Two') {
				steps {
					sh 'echo "Step Two: Sonarqube"'
				}
			} 

			stage('Three') {
				steps {
					sh 'echo "Step Three"'
				}
			}
		}
}
