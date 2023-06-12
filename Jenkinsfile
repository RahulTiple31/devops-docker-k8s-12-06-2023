pipeline
    agent any
    tools{
        maven 'maven_3_5_0'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/RahulTiple31/devops-docker-k8s-12-06-2023.git']]])
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
