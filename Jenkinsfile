pipeline {
    agent any
    stages {
        stage('Test Junit') {
            steps {
                sh 'mvn clean test'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker build -t hello-world-apache-tomcat .'
                sh 'docker run -d --rm -p 80:80 hello-world-apache-tomcat'
            }
        }
        stage('Test Integration') {
            steps {
                sh 'wget -m http://172.17.0.2'
            }
        }
    }
}