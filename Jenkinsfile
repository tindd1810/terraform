pipeline{
    agent any
    tools {
        terraform "my-terraform"
    }
    stages{
        stage("Terraform checking"){
            steps{
                echo "========Start checking terraform========"
                sh 'terraform --version' 
            }
        }
    }
}
