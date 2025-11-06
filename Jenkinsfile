pipeline {
  agent {
    docker {
      image 'node:20-alpine'
      args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
    }

  }
  stages {
    stage('Checkout') {
      steps {
        checkout([
                                        $class: 'GitSCM',
                                        branches: [[name: '*/main']],
                                        doGenerateSubmoduleConfigurations: false,
                                        extensions: [],
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

        stage('Build') {
          steps {
            sh 'npm start'
          }
        }

      }
      environment {
        GIT_CREDENTIALS = 'github-elio'
      }
    }