pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                bat '"D:\\Git\\bin\\bash.exe" scripts/test.sh'
            }
        }

        stage('Build') {
            steps {
                bat 'if exist build rmdir /S /Q build'
                bat 'mkdir build'
                bat 'xcopy /E /I /Y *.html build\\'
                bat 'xcopy /E /I /Y css build\\css\\'
                bat 'xcopy /E /I /Y js build\\js\\'
                bat 'xcopy /E /I /Y images build\\images\\'
            }
        }
    }

    post {
        success {
            echo 'Jenkins pipeline completed successfully.'
        }

        failure {
            echo 'Jenkins pipeline failed.'
        }
    }
}