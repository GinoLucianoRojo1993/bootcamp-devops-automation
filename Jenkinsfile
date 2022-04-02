pipeline  {
    agent {
        label {
            label "docker"
        }
    }
    environment {
        DOCKER_REGISTRY = 'roxsross12/automation'
        TARGET_AWS_ROLE ='aws-deploy-role',
        TARGET_REGION = 'us-east-1'
    }

    stages {
        stage('install-dependencies') {
            agent {
                docker {
                    label 'docker'
                    image 'node:erbium-alpine'
                    args '-u root:root'
                }
            }
            steps {
                sh 'npm i -ddd'
            }
        }

        stage('run-test'){
            agent {
                docker {
                    label 'docker'
                    image 'node:erbium-alpine'
                    args '-u root:root'
                }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh 'npm run test'
                }
            }
        }

        stage('docker-build'){
            steps{
               sh 'docker build -t aplicacion .'
            }
        }

        stage('docker-push'){
            steps{
                sh 'docker push aplicacion'
            }
        }

        stage('AWS-check-Beanstalk') {
            steps {
                sh 'docker version'
                sh 'aws elasticbeanstalk describe-applications --output table'
            }
        }

        stage('Deploy') {
            steps {
                   sh 'aws s3 cp Dockerrun.aws.json s3://${s3bucketname}/${s3key}/Dockerrun.aws.json'
                   sh 'aws elasticbeanstalk create-application-version --application-name ${eb_applicationname} --version-label JenkinJob-${eb_environmentname}-${BUILD_NUMBER} --description ${eb_environmentname} --source-bundle S3Bucket=${s3bucketname},S3Key=${s3key}/Dockerrun.aws.json --no-auto-create-application'
                   sh 'aws elasticbeanstalk update-environment --environment-id ${eb_environmentid} --environment-name ${eb_environmentname} --version-label JenkinJob-${eb_environmentname}'
            }
        }

    } //--end stages
}