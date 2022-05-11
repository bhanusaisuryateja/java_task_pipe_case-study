node{
   stage('SCM Checkout'){
       git branch: 'pipeline', url: 'https://github.com/bhanusaisuryateja/java-task-pipe.git'
   }
   stage('Mvn Package'){
     sh "clean package"
   }
   stage('Build Docker Image'){
     sh 'docker build -t bhanusaisuryateja/pipeline-app:2.0.0 .'
   }
   stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
        sh "docker login -u bhanusaisuryateja -p ${dockerHubPwd}"
     }
     sh 'docker push bhanusaisuryateja/pipeline-app:2.0.0'
   }
   stage('Run Container on Dev Server'){
     def dockerRun = 'docker run -p 8080:8080 -d --name bhanusaisuryateja/pipeline-app:2.0.0'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.8.218 ${dockerRun}"
     }
   }
}
