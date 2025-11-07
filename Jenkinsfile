pipeline {
  agent {
    docker {
      image 'node:20-alpine'
      args '--privileged -v /var/run/docker.sock:/var/run/docker.sock -p 3000:3000'
    }
  }

  environment {
    GIT_CREDENTIALS = 'github-elio'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout([
          $class: 'GitSCM',
          branches: [[name: '*/main']],
          userRemoteConfigs: [[
            url: 'https://github.com/NeckerFree/creating-pipeline-blue-ocean.git',
            credentialsId: "${GIT_CREDENTIALS}"
          ]]
        ])
      }
    }

    stage('Install Dependencies') {
      steps {
        sh 'npm install'
      }
    }

    stage('Run React App') {
      steps {
        echo "Starting React app on port 3000..."
        sh 'npm start & sleep 600'
      }
    }
  }

  post {
    always {
      echo "Build finished for ${env.BRANCH_NAME}"
    }
  }
}
