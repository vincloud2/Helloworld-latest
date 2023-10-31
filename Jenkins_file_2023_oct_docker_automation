pipeline {
    agent { label "slave1" }

    stages {
        stage('Stage1-cloning project') {
            steps {
                echo 'cloning project from git'
                git 'https://github.com/vincloud2/Helloworld-latest.git'
            }
        }
        stage('Stage2 -maven build') {
            steps {
                echo 'Maven build'
                sh 'yum install maven -y'
                sh 'mvn clean package'
            }
        }
        stage('Stage6-delete_old_container') {
            steps {
                 echo 'delete_old_container'
                sh 'docker stop mywebsite_container || true'
                sh 'docker rm mywebsite_container || true'
            }
        }        
        stage('Stage2.5-docker remove images') {
            steps {
                echo 'Stage2.5-remove images'
                sh 'docker rmi -f $( docker images -q)'
            }
        }        
        stage('Stage3-docker build') {
            steps {
                echo 'Stage3-docker build'
                sh 'docker build -t mywebsite_abc .'
            }
        }
        stage('Stage4-Tag image') {
            steps {
                echo 'Tag image with account vnom1985'
                sh 'docker tag mywebsite_abc vnom1985/mywebsite_abc'
            }
        }
        stage('Stage5-deploy to dockerhub') {
            steps {
                echo 'deploy to dockerhub'
                sh 'docker login -u vnom1985 -p abc@12345'
                sh 'docker push vnom1985/mywebsite_abc'
            }
        }
        stage('Stage7-run_my_dockerimage') {
            steps {
                echo 'Stage6-run_my_dockerimage'
                sh 'docker run --name mywebsite_container -d -p 8181:8080 vnom1985/mywebsite_abc'
            }
        }
         
    }
}
