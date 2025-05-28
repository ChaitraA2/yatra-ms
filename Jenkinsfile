pipeline {
    agent any

    stages {
        stage("Compile") {
            step {
                echo "Code compile started"
                "sh mvn clean compile"
                echo "compilation completed"
            }
        }
        stage("Test") {
            step {
                echo "code test started"
                "sh mvn clean test"
                eho "test completed"
            }
        }
    }
}