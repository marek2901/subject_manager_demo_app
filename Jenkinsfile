pipeline {
    agent { docker 'ruby:2.2.3' }
    stages {
        stage('build') {
            steps {
                sh 'bundle'
            }
        }
        stage('test') {
            steps {
                sh 'rspec spec/'
            }
        }
    }
}
