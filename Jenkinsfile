pipeline{
    agent any
    
    environment {
        GITHUB_REPO = 'https://github.com/Tibi1210/dockerTest.git'
        BRANCH = 'main'
    }
    
    stages{
        stage('Terrform check'){
            steps{
                sh 'terraform --version'
            }
        }
        stage('Docker check'){
            steps{
                sh 'docker --version'
            }
        }
        stage('Checkout repo') {
            steps {
                git branch: env.BRANCH, url: env.GITHUB_REPO
                sh 'ls -l'
            }
        }
        stage('TERRAFORM FOLDER'){
            steps{
                sh 'cd terraform'
            }
        }
        stage('TERRAFORM DESTROY'){
            steps{
                sh 'terraform destroy -auto-approve'
            }
        }
        stage('TERRAFORM INIT'){
            steps{
                sh 'terraform init'
            }
        }
        stage('TERRAFORM PLAN'){
            steps{
                sh 'terraform plan'
            }
        }
        stage('TERRAFORM APPLY'){
            steps{
                sh 'terraform apply -auto-approve'
            }
        }
    }
}