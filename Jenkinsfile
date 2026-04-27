pipeline {
    agent any

    tools {
        maven 'Maven'
    }

    stages {

        stage('Checkout Code') {
    steps {
        git branch: 'main',
            url: 'https://github.com/nileshwanare1/Java_Jenkins_Tomcat.git'
    }
}

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                deploy adapters: [
                    tomcat9(
                        credentialsId: 'tomcat-cred',
                        path: '',
                        url: 'http://13.206.81.70:8080/'
                    )
                ],
                contextPath: '',
                war: 'ROOT.war'
            }
        }
    }
}
