pipeline {
  agent {
    docker {
      image 'node:20-alpine'
      args '--privileged -v /var/run/docker.sock:/var/run/docker.sock -p 3001:3000'
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
          branches: [[name: '*/dev']],
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
        echo "Starting React app on port 3001..."
        // Map container's 3000 to host's 3001
        sh 'npm start & sleep 600'
      }
    }
  }

  post {
    always {
      echo "Build finished for ${env.BRANCH_NAME ?: 'dev'}"
    }
  }
}
