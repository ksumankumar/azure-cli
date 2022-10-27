pipeline {
    agent { label 'JDK-11' }
    stages {
        stage('run script') {
            steps {
                sh 'chmod +x azure-cli.sh'
                sh './azure-cli.sh'
            }
        }

    }
}