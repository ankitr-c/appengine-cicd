pipeline {
    agent any

    parameters {
        // string(name: 'PROJECT_ID', defaultValue: 'your-project-id', description: 'Google Cloud project ID')
        // string(name: 'VERSION', defaultValue: 'your-version', description: 'Version to deploy')
        // string(name: 'SERVICE', defaultValue: 'default', description: 'Service name')
        // string(name: 'REGION', defaultValue: 'us-central1', description: 'Region for deployment')
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
                withCredentials([file(credentialsId: 'appengine-cicd', variable: 'cred')]) {
                    sh "gcloud auth activate-service-account --key-file=${cred}"
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Inside Deploy'
                // sh "gcloud app deploy app.yml --image-url=${params.IMAGE_URL} --version=${params.VERSION} --project=${params.PROJECT_ID} --region=${params.REGION} --service=${params.SERVICE} --quiet"
                sh "gcloud app deploy app.yml --image-url=${params.IMAGE_URL} --quiet"
            }
        }
    }
}
