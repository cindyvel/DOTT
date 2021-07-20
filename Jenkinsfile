properties([pipelineTriggers([githubPush()])])

node {
  stage('SCM') {
    git 'https://github.com/foo/bar.git'
  }
  stage('SonarQube analysis') {
    def scannerHome = tool 'SonarScanner 4.0';
    withSonarQubeEnv('My SonarQube Server') { // If you have configured more than one global server connection, you can specify its name
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
}

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
