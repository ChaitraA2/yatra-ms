pipeline {
    agent any

    stages {
        stage{
            echo "Code compile started"
            "sh mvn clean compile"
            echo "compilation completed"
        }
        stage{
            echo "code test started"
            "sh mvn clean test"
            eho "test completed"
        }
    }
}