pipeline {
    agent any
    stages {
        stage('Terraform Init') {
            steps {
                sh 'yes yes | terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
