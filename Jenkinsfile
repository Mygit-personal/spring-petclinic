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
  }
}