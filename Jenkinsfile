pipeline{
    agent {
        label 'slave02-aws'
    }
    tools {
        terraform "my-terraform"
    }
    parameters {
        choice choices: ['Apply', 'Delete'], name: 'ApplyOrDelete'
    }
    stages{
        stage("Apply"){
            when {
            expression { params.ApplyOrDelete == 'Apply'}
            }
            steps{
                echo "========Start checking terraform========"
                dir("services") {             
                    withCredentials([aws(credentialsId: 'aws-credentials')]) { 
                    sh 'terraform --version'
                    sh '''
                        terraform init -reconfigure
                        terraform init
                        terraform get -update
                        terraform plan -no-color
                    '''
                    input(message: 'Apply now?', ok: 'Yes')
                    sh 'terraform apply -no-color -auto-approve'
                    } 
                }

            }
        }
        stage("Delete"){
            when {
            expression { params.ApplyOrDelete == 'Delete'}
            }
            steps{
                echo "========Start checking terraform========"
                dir("services") {              
                    withCredentials([aws(credentialsId: 'aws-credentials')]) { 
                    sh '''
                        terraform get -update
                        terraform plan -no-color
                    '''
                    input(message: 'Destroy now?', ok: 'Yes')
                    sh 'terraform destroy -no-color -auto-approve'
                    }
                } 

            }
        }
    }
}
