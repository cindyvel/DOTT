properties([pipelineTriggers([githubPush()])])


pipeline {
	agent any
		stages {
			stage('One') {
				steps {
					sh 'echo "Step One do it"'
				}
			}


			stage('Two') {
				steps {
					sh 'echo "Step Two"'
				}
			} 

			stage('Three') {
				steps {
					sh 'echo "Step Three"'
				}
			}
		}
}

