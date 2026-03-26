pipeline {
  agent {label 'SPC-Jenkins'}
    triggers {
      pollSCM("* * * * *")
    }
    stages {
      stage ("git checkout") {
        steps {
          url: "https://github.com/Mygit-personal/spring-petclinic.git" 
            branch: 'main'
        }
      }
    }
    post {
      success {
        echo "🎉 checkout stage SUCCESS"
      }
      failure {
        echo "❌ checkout stage FAILED"
      }
    }
}