properties([pipelineTriggers([githubPush()])])


node {
    stage('Checkout SCM') 
    {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/cindyvel/DOTT.git']]])
    }
    stage('Code Analysis')
    {
     
    withCredentials([string(credentialsId: 'tokensonar', variable: 'Secret')]){ 
        def scannerhome = tool 'Sonar-Scanner';
        withSonarQubeEnv ('sonarqubeserver'){
            sh """${scannerhome}/bin/sonar-scanner \
            -Dsonar.projectKey=ProjectDOTT \
            -Dsonar.exclusions=**/README.md \
            -Dsonar.sources=./cidr_convert_api \
            -Dsonar.host.url=http://ec2-18-224-51-57.us-east-2.compute.amazonaws.com:9000/ \
            -Dsonar.login=${Secret} """
        }
    }
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
   // stage('Test')
    //{
   //     sh 'tests.rb'
    //}
}
