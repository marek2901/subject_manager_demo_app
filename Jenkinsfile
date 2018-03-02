pipeline {
    agent { docker 'ruby:2.2.3' }
    stages {
        stage('build') {
            steps {
                sh 'bundle install'
            }
        }
        stage('test') {
            steps {
                sh 'rspec spec/'
            }
        }
    }
}
