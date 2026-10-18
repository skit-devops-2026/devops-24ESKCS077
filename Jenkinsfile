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
                bat 'echo Building Releaf-Book project...'
                bat 'if exist build rmdir /S /Q build'
                bat 'mkdir build'
                bat 'copy /Y index.html build\\'
                bat 'copy /Y home.html build\\'
                bat 'copy /Y login.html build\\'
                bat 'copy /Y register.html build\\'
                bat 'copy /Y listing.html build\\'
                bat 'copy /Y sell.html build\\'
                bat 'copy /Y bought.html build\\'
                bat 'copy /Y sold.html build\\'
                bat 'copy /Y wishlist.html build\\'
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