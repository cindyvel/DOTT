properties([pipelineTriggers([githubPush()])])

pipeline {
	agent any
		stages {
			stage('build & SonarQube analysis') {
				steps {
					withSonarQubeEnv('My SonarQube Server') {
					sh 'mvn clean package sonar:sonar'
					}
				}
			}
			stage('Quality Gate') {
				steps {
					timeout(time: 1, unit: 'HOURS') {
						waitForQualityGate abortPipeline: true
				}
			}
			stage('Test') {
				steps {
					sh 'echo "Step Three and a half"'
				}
			}
		}
}
