pipeline {
    agent any

    parameters {
        string(name: 'IMAGE_URL', defaultValue: 'gcr.io/your-project-id/your-image', description: 'URL of the Docker image to deploy')
    }

    stages {
        stage('Clone') {
            steps {
                echo 'Inside Clone'
                git branch: 'main', url: 'https://github.com/ankitr-c/appengine-cicd.git'
            }
        }

        stage('Authenticate') {
            steps {
                echo 'Inside Authenticate'
                withCredentials([file(credentialsId: 'appengine-cicd2', variable: 'cred')]) {
                    sh "gcloud auth activate-service-account --key-file=${cred}"
                    sh 'gcloud config list'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Inside Deploy'
                sh "gcloud app deploy app.yaml --image-url=${params.IMAGE_URL} --quiet"
            }
        }
    }
}
