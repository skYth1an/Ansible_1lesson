pipeline {
agent any

  stages {
    stage ('Clean WS') {
     steps {
         cleanWs()
     }
    }

  stage('Get from Git') {
  steps {
    git branch: 'main', credentialsId: 'git', url: 'git@github.com:skYth1an/Ansible_1lesson.git'
  }
  }
  stage ('Test Role') {
      steps {
          dir('/opt/jenkins_agent/workspace/declar/old/playbook_new/playbook/roles/vector-role') {
    sh 'molecule test'
}
      }

}
}
}