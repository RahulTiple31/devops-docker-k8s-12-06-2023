pipeline
    agent any
    tools{
        maven 'maven_3_5_0'
    }
    stages{
        stage('Build Maven'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                sh 'docker build -t rahultipledocker/docker-k8s .'
            }
        }
        stage('docker push image to Hub'){
            steps{
                withCredentials([string(credentialsId: 'rahultipledocker', variable: 'docker-k8s')]) {
                sh 'docker login -u rahultipledocker -p ${docker-k8s}'
                }
                sh 'docker push rahultipledocker/docker-k8s'
            }
        }
    }
