pipeline {
    agent any

    environment {
        AWS_ACCOUNT_ID = 462367991620
        REGION = "ap-south-1"
        ECR_URL = "${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com"
        BUILD_IMAGE = "chaitraa2/yatra-ms:yatra-ms-v1.${env.BUILD_NUMBER}"
        ECR_BUILD_IMAGE = "${ECR_URL}/yatra-ms:yatra-ms-v1.${env.BUILD_NUMBER}"
    }
    stages {
        stage('Compile') {
            steps {
                echo "Code compile started"
                sh "mvn clean compile"
                echo "compilation completed"
            }
        }
        stage("Test") {
            steps {
                echo "code test started"
//                 sh "mvn clean test"
                echo "test completed"
            }
        }
        stage("Code package") {
            steps {
                echo "code package started"
                sh "mvn clean package"
                echo "package completed"
            }
        }
        stage("Docker Image Build") {
            steps {
                echo "Image creation started"
                sh "docker build -t ${BUILD_IMAGE} ."
                echo "Image created successfully"
            }
        }
        stage("DockerHub Push") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB_CRED', usernameVariable:'DOCKER_USERNAME', passwordVariable:'DOCKER_PASSWORD')]) {
                    echo "Pushing Image to DockerHub started"
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                    sh "docker push ${BUILD_IMAGE}"
                    echo "Image pushed successfully"
                }
            }
        }
        stage("AWS ECR Push") { 
            steps {
                echo "Tagging the Docker image for ECR: ${env.ECR_BUILD_IMAGE}"
                sh "docker tag ${env.BUILD_IMAGE} ${env.ECR_BUILD_IMAGE}"
                echo "Docker Image Tagging Completed"
                withDockerRegistry([credentialsId: 'ecr:ap-south-1:ecr-credentials', url: "https://${env.ECR_URL}"]) {
                    echo "Pushing docker Image to ECR: ${env.ECR_IMAGE_NAME}"
                    sh "docker push ${env.ECR_BUILD_IMAGE}"
                    echo "Docker Image Push to ECR Completed"
                }
            }
        }
    }
}
