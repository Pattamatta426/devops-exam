pipeline {
    agent any
    environment {
        AWS_REGION = "ap-south-1"  
        FUNCTION_NAME = "devops-exam-lambda"
    }  
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
        stage('Invoke Lambda') {
            steps {
                script {
                    def lambda_output = sh(script: "aws lambda invoke --function-name ${FUNCTION_NAME} --log-type Tail lambda_response.json | jq -r '.LogResult' | base64 --decode", returnStdout: true).trim()
                    echo "Lambda Output: ${lambda_output}"
                }
            }
        }
    }
}
