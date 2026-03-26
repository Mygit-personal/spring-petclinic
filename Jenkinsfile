// pipeline {
//   agent {label 'SPC-Jenkins'}
//     triggers {
//       pollSCM("* * * * *")
//     }
//     stages {
//       stage ("git checkout") {
//         steps {
//           git url: "https://github.com/Mygit-personal/spring-petclinic.git", branch: 'main'
//         }
//         post {
//           success {
//             echo "🎉 checkout stage SUCCESS"
//           }
//           failure {
//             echo "❌ checkout stage FAILED"
//           }
//         }
//       }
//     }

// }


pipeline {
  agent { label 'SPC-Jenkins' }

  stages {
    stage("git checkout") {
      steps {
        ansiColor('xterm') {
          echo "\u001B[32m✔ Git checkout started...\u001B[0m"

          git url: "https://github.com/Mygit-personal/spring-petclinic.git" branch: 'main'

          echo "\u001B[34mℹ Fetch completed...\u001B[0m"
        }
      }

      post {
        success {
          ansiColor('xterm') {
            echo "\u001B[32m🎉 SUCCESS: Checkout completed\u001B[0m"
          }
        }
        failure {
          ansiColor('xterm') {
            echo "\u001B[31m❌ FAILURE: Checkout failed\u001B[0m"
          }
        }
      }
    }
  }

}