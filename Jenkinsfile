pipeline {
	agent any
	stages{
		stage("checkout"){
			steps{
			git "https://github.com/Ubaid004/Jenkins-Terrafrom.git"
			}
		}
		stage(" initialization"){
			steps{
			sh "terraform init"
			}
		}
		stage("validate"){
			steps{
			sh "terraform validate"
			}
		}
		stage("plan"){
			steps{
			sh "terraform plan"
			}
		}
		stages("apply"){
			steps{
			sh "terraform apply"
			}
		}
		stages("auto_approve"){
			steps{
			sh "terraform --auto-approve"
			}
		}
	}
}
}
