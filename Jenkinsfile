pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				sh "./build-docker.sh ${env.BRANCH_NAME}-latest"
			}
		}
		stage('Deploy') {
      when { branch 'master'}
			steps {
				sh 'echo Deploying...'
			}
		}
		stage('Done') {
			steps {
				sh 'echo Slacking'
			}
		}
	}
	post {
		always {
	    deleteDir()
	  }
	}
}
