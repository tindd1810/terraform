pipeline{
    agent {
        label 'slave02-aws'
    }
    tools {
        terraform "my-terraform"
    }
    stages{
        stage("Terraform checking"){
            steps{
                echo "========Start checking terraform========"             
                withCredentials([aws(credentialsId: 'aws-credentials')]) { 
                    sh 'terraform --version'
                    sh '''
                        terraform init
                        terraform plan
                    '''
                } 

            }
        }
    }
}
