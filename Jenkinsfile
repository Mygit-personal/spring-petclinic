// pipeline {
//   agent {label "SPC"}
  
//   environment {
//     image_name = 'spc'
//     tag_name = '1.0'
//   }
  
//   triggers {
//     pollSCM("* * * * *")
//   }
//   stages {
//     stage ("git checkout") {
//       steps {
//         git url: "https://github.com/Mygit-personal/spring-petclinic.git",
//           branch: "main"
//       }
//     }

//     stage ("maven") {
//       steps {
//         sh "mvn package"
//       }
//     }

//     // stage ("sonar scan") {
//     //   steps{
//     //     withCredentials([string(credentialsId: 'SONAR_ID', variable:"SONAR_TOKEN")]){
//     //     withSonarQubeEnv("Sonar"){
//     //       sh """mvn package sonar:sonar \
//     //           -Dsonar.projectKey=Mygit-personal_spring-petclinic \
//     //           -Dsonar.organization=mygit-personal \
//     //           -Dsonar.host.url=https://sonarcloud.io/ \
//     //           -Dsonar.login=$SONAR_TOKEN
//     //       """
//     //     }}
//     //   }
//     // }

//     // stage("Quality Gate") {
//     //   steps {
//     //     timeout(time: 1, unit: 'MINUTES') {
//     //       script {
//     //         def qg = waitForQualityGate()
//     //         if (qg.status != 'OK') {
//     //           error "❌ Pipeline stopped: Quality Gate failed"
//     //         } else {
//     //           echo "✅ Quality Gate passed"
//     //         }
//     //       }
//     //     }
//     //   }
//     // }

//     // stage ("docker push to ECR") {
//     //   steps {
//     //     sh '''
//     //       docker pull nginx:1.29
//     //       aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 984912521466.dkr.ecr.ap-south-1.amazonaws.com          
//     //       docker tag nginx:1.29 984912521466.dkr.ecr.ap-south-1.amazonaws.com/prod/images:latest
//     //       docker push 984912521466.dkr.ecr.ap-south-1.amazonaws.com/prod/images:latest

//     //     '''
//     //   }
//     // }

//     stage ('docker image') {
//       steps {
//         sh 'docker image build -t ${image_name}:${tag_name} .'
//       }
//     }

//     // stage ('trivy report') {
//     //   steps {
//     //     sh '''
//     //       curl -sSL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/junit.tpl -o junit.tpl

//     //       trivy image \
//     //         --scanners vuln \
//     //         --severity UNKNOWN,LOW,MEDIUM,HIGH,CRITICAL \
//     //         --format template \
//     //         --template "@junit.tpl" \
//     //         -o trivy-report.xml \
//     //         ${image_name}:${tag_name}
//     //     '''
//     //   }
//     // }

    

//     stage ('image push to ECR') {
//       steps {
//         sh """aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 984912521466.dkr.ecr.ap-south-1.amazonaws.com && \
//             docker tag ${image_name}:${tag_name } 984912521466.dkr.ecr.ap-south-1.amazonaws.com/spc/image:latest && \
//             docker image ls && \
//             docker push 984912521466.dkr.ecr.ap-south-1.amazonaws.com/spc/image:latest"""
//       }
//     }

//     stage('Deploy K8S') {
//       steps {
//         withCredentials([file(credentialsId: 'myeks', variable: 'KUBECONFIG')]) {
//           sh "kubectl apply -f deploy-k8s/."
//         }
//       }
//     }
//   }  

//   // post {
//   // always {
//   //   archiveArtifacts artifacts: 'trivy-report.xml', fingerprint: true
//   //   junit allowEmptyResults: true, testResults: 'trivy-report.xml'
//   //   }
//   // }
// }



@Library('shared-library') _
pipeline{
  agent {label 'SPC'}
    stages{
      stage ('git checkout'){
        steps {
          git url: "https://github.com/Mygit-personal/spring-petclinic.git",
            branch: "main"

        }
      }
      stage ("build") {
        steps {
          script {
            def buildScript = load "my-shared-library/vars/build.groovy"
            buildScript()
          }
        }
      }
    }
}