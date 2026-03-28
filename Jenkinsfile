pipeline {
  agent {label "SPC"}
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
  }
}