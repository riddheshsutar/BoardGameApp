pipeline {
  agent any
  environment {
    IMAGE_NAME = "boardgame-app"
    AWS_REGION = "ap-south-1" // set in Jenkins credentials or override in pipeline
    AWS_ACCOUNT_ID = credentials('aws-account-id') // or pass via env
    AWS_CREDENTIALS = 'aws-creds' // Jenkins credential id for AWS (access key/secret)
  }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Build') {
      steps {
        sh 'mvn -B -DskipTests=false clean package'
      }
    }

    stage('Dependency-Check') {
      steps {
        sh 'mvn org.owasp:dependency-check-maven:check || true'
      }
    }

    stage('Docker Build') {
      steps {
        script {
          dockerImage = docker.build("${IMAGE_NAME}:${env.BUILD_NUMBER}")
        }
      }
    }

    stage('Trivy Scan') {
      steps {
        // Jenkins node must have trivy installed or use docker image with trivy
        sh "trivy image --severity CRITICAL,HIGH ${IMAGE_NAME}:${env.BUILD_NUMBER} || true"
      }
    }

    stage('Push to ECR') {
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS}"]]) {
          sh '''
            aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
            REPO=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}
            docker tag ${IMAGE_NAME}:${BUILD_NUMBER} ${REPO}:${BUILD_NUMBER}
            docker tag ${IMAGE_NAME}:${BUILD_NUMBER} ${REPO}:latest
            docker push ${REPO}:${BUILD_NUMBER}
            docker push ${REPO}:latest
          '''
        }
      }
    }
  }
}
