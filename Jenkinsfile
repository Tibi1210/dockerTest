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
                sh 'echo "$PWD"'
            }
        }

        stage('TERRAFORM INIT'){
            steps{
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }
        stage('TERRAFORM DESTROY'){
            steps{
                dir('terraform') {
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
        stage('TERRAFORM PLAN'){
            steps{
                dir('terraform') {
                    sh 'terraform plan'
                }
            }
        }
        stage('TERRAFORM APPLY'){
            steps{
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}