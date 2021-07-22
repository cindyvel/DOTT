properties([pipelineTriggers([githubPush()])])


node {
    stage('Checkout SCM') 
    {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/cindyvel/DOTT.git']]])
    }
    stage('Code Analysis')
    {
        sh "ls -la"
        def scannerhome = tool 'Sonar-Scanner';
        withSonarQubeEnv ('sonarqubeserver'){
            sh """${scannerhome}/bin/sonar-scanner \
            -Dsonar.projectKey=Prueba \
            -Dsonar.exclusions=**/README.md \
            -Dsonar.sources=./cidr_convert_api \
            -Dsonar.host.url=http://ec2-18-220-157-116.us-east-2.compute.amazonaws.com:9000 \
            -Dsonar.login=5adb59f64cfae00be204b82410e09674489d1fab """
            }
    stage('Quality Gate') {
        // waitForQualityGate abortPipeline: true
        sh "echo 'idjfoadfgdew djfvsfhbj'"
    }
    stage('Build')
    {
        sh "docker image build . -t cindyvel/ruby"
    }
    stage('Remove previous container')
    {
        sh """docker container stop ruby 
              docker container rm ruby"""
    }
     stage('Deploy new container')
    {
        sh "docker run -d --name ruby -p 80:8081 cindyvel/ruby"
    }
    }
}
