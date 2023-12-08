pipeline {
    agent { label "projecta" }
    
    triggers {
        pollSCM('* * * * *')
    }    

    stages {
        stage('clone_project_A') {
            steps {
                echo 'clone project A'
                git 'https://github.com/vincloud2/Helloworld-latest.git'
            }
        }
        stage('build_project_A') {
            steps {
                echo 'build_projectA'
                sh 'yum install maven -y'
                sh 'mvn -Dmaven.test.failure.ignore=true install'
            }
        } 
        stage('Docker_build') {
            steps {
                echo 'Docker build_projectd'
                sh 'docker build -t project_vinod .' 
            }
        }
        stage('login to dockerhub') {
            steps {
                echo 'login to dockerhub'
                sh 'docker login -u vnom1985 -p abc@12345'
            }
        } 
        stage('Tag the Image') {
            steps {
                echo 'Tag the Image'
                sh 'docker tag  project_vinod vnom1985/project_vinod'
            }
        } 
        stage('Deploy to docker hub') {
            steps {
                echo 'Deploy to docker hub'
                sh 'docker push vnom1985/project_vinod'
            }
        }
        stage('Remove Docker conatiner') {
            steps {
                echo 'Remove Docker conatiner'
                sh 'docker stop project_vinod_conatiner || true'
                sh 'docker rm project_vinod_conatiner || true'
            }
        }        
        stage('Run docker image') {
            steps {
                echo 'Deploy to docker hub'
                sh 'docker run --name project_vinod_conatiner -d -p 8181:8080 vnom1985/project_vinod'
            }
        }
        stage('added one more stage') {
            steps {
                echo 'added one more stage'                
            }
        }        
    }
}
