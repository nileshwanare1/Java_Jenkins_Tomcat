pipeline {
    agent any

    tools {
        maven 'Maven'
    }

    environment {
        SONAR_TOKEN = credentials('sonar-taken')
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/nileshwanare1/Java_Jenkins_Tomcat.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh """
                    mvn sonar:sonar \
                    -Dsonar.projectKey=java-app \
                    -Dsonar.host.url=http://13.235.128.74:9000/ \
                    -Dsonar.login=$SONAR_TOKEN
                    """
                }
            }
        }
    }
}
