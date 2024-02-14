pipeline {
    agent any

    parameters {
        string(name: 'PROJECT_ID', defaultValue: 'your-project-id', description: 'Google Cloud project ID')
        string(name: 'VERSION', defaultValue: 'your-version', description: 'Version to deploy')
        string(name: 'SERVICE', defaultValue: 'default', description: 'Service name')
        string(name: 'REGION', defaultValue: 'us-central1', description: 'Region for deployment')
        string(name: 'IMAGE_URL', defaultValue: 'gcr.io/your-project-id/your-image', description: 'URL of the Docker image to deploy')
    }

    stages {
        stage('Clone') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', credentialsId: 'your-github-credentials-id', url: 'https://github.com/your/repository.git'
            }
        }

        stage('Authenticate') {
            steps {
                echo 'Authenticating with Google Cloud...'
                withCredentials([googleServiceAccount(credentialsId: 'your-gcp-credentials-id', project: 'your-project-id')]) {
                    sh 'gcloud auth activate-service-account --key-file=${GOOGLE_APPLICATION_CREDENTIALS}'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying to Google App Engine...'
                sh "gcloud app deploy --image-url=${params.IMAGE_URL} --version=${params.VERSION} --project=${params.PROJECT_ID} --region=${params.REGION} --service=${params.SERVICE} --quiet"
            }
        }
    }
}
