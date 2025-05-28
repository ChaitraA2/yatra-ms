pipeline {
    agent any

    stages {
        stage("Compile") {
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
    }
}