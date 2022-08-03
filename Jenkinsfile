pipeline{
    agent{
        label "node"
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
