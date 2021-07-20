properties([pipelineTriggers([githubPush()])])

node {
	
			stage('One') {
				steps {
					sh 'echo "Step One and a half. asjd"'
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
