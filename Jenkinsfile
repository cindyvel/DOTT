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
            -Dsonar.projectKey=ProjectDOTT \
            -Dsonar.exclusions=**/README.md \
            -Dsonar.sources=./cidr_convert_api \
            -Dsonar.host.url=http://ec2-18-224-51-57.us-east-2.compute.amazonaws.com:9000/ \
            -Dsonar.login=3484f1d43b8059683990f0d76ffe6efc3489be6f """
    }
    }
    stage('Quality Gate') 
    {
        waitForQualityGate abortPipeline: true
    }
    //stage('Test')
    //{
      //  sh "echo '${workspace}'"
       // docker.image('ruby:3.0.2').withRun('-v ${workspace}/cidr_convert_api/:/app') { c ->
        //sh "ruby --version"
        //sh 'ruby /app/tests.rb'
   // }
    //}
    stage('Build')
    {
        sh "docker image build . -t cindyvel/ruby"
    }
  //  stage('Remove previous container')
    //{
      // sh """docker container stop ruby 
       //     docker container rm ruby"""
   // }
     stage('Deploy new container')
    {
        sh "docker run -d --name ruby -p 80:8081 cindyvel/ruby"
    }
}
