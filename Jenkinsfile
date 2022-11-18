pipeline {

            agent any

            stage ('GIT') {
                steps {
                echo "Getting Project from Git"; 
                    git branch: "main", 
                        url: "https://github.com/AmalTlili/DevOps.git";
                }
            }
            stage("Build") {
                steps {
                    sh "mvn -version"
                    sh "mvn clean package -DskipTests"
                }
            }
            stage("Docker Image") {
                steps{
                    script{
                        sh "docker build -t tpachat:latest ."
                    }
                }
            }
              stage('DockerHub Connecting') {
                steps {
                    sh 'echo dckr_pat_IJl6m1o3x6Nqn8Rwx6mHObbGocM | docker login -u amaalt --password-stdin'
                }
            }     
            stage('Run Project'){
                steps{
                    sh 'docker run -p 8089:8089 --network mynetwork -d tpachat:latest'
                    
                }
            }
        }
    
    
