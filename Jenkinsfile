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
					sh 'echo "Step Two"'
				}
			} 

			stage('Test') {
				steps {
					sh 'echo "Step Three and a half"'
				}
			}
		}
}
