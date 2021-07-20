properties([pipelineTriggers([githubPush()])])


node{
	stage('SCM Checkout'){
		git 'https://github.com/cindyvel/DOTT'
	}
	stage('Compile-Package'){
		//Get maven home path
		def mvnHome = tool name: 'maven-3', type: 'maven'
		sh "${mvhHome}/bin/mvn package"
	}
	stage('SonarQube Analysis') {
		def mvnHome = tool name: 'maven-3', type: 'maven'
		withSonarQubeEnv('sonarqube-1') {
			sh "${mvnHome}/bin/mvn sonar:sonar"
		}
	}
	stage('Prueba esto') {
		steps {
			sh 'echo "step one"'
		}
	}
}
