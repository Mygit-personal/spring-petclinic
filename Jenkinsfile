pipeline {
  agent {label "spc"}
  triggers {
    pollSCM("* * * * *")
  }
  stages {
    stage ("git checkout") {
      steps {
        git url: "https://github.com/Mygit-personal/spring-petclinic.git",
          branch: "main"
      }
    }

    stage ("maven") {
      steps {
        sh "mvn package"
      }
    }

    stage ("sonar scan") {
      steps{
        withCredentials([string(credentialsId: 'sonar_id', variable:"SONAR_TOKEN")]){
        withSonarQubeEnv("Sonar"){
          sh """mvn package sonar:sonar \
              -Dsonar.projectKey=Mygit-personal_spring-petclinic \
              -Dsonar.organization=mygit-personal \
              -Dsonar.host.url=https://sonarcloud.io/ \
              -Dsonar.login=$SONAR_TOKEN
          """
        }}
      }
    }

    stage ("docker push to ECR") {
      steps {
        sh '''
          docker pull nginx:1.29
          
          aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 984912521466.dkr.ecr.ap-south-1.amazonaws.com

          docker tag nginx:1.29 984912521466.dkr.ecr.ap-south-1.amazonaws.com/prod/images:latest

          docker push 984912521466.dkr.ecr.ap-south-1.amazonaws.com/prod/images:latest

        '''
      }
    }
  }  
}