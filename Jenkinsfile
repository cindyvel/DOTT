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
					sh 'echo "Sonar Qube and analysis"'
				}
			} 

			stage('Test') {
				steps {
					sh 'echo "Step Three and a half"'
				}
			}
		}
}
