pipeline {
    agent any

    environment {
        BUILD_IMAGE = "chaitraa2/yatra-ms:yatra-ms-v1.${env.BUILD_NUMBER}"
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
    }
}
