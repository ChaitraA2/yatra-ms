pipeline {
    agent any

    stages {
        stage("Compile") {
            echo "Code compile started"
            "sh mvn clean compile"
            echo "compilation completed"
        }
        stage("Test") {
            echo "code test started"
            "sh mvn clean test"
            eho "test completed"
        }
    }
}