pipeline {

        agent any
        
        // tools {
            
        //     maven "M2_HOME" 
        // }


        // stages {
        //     stage ("Preparing"){
        //         steps{
        //                 sh "docker start nexus "
        //             	sh "docker start mysqldb"
        //             	sh "docker start modest_mccarthy"
        //         }
        //     }
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

            /*stage("Sonar") {
                steps {
                    sh "mvn clean install sonar:sonar -Dsonar.host.url=http://192.168.1.7:9000 -Dsonar.login=637ae8cf918e994e82fd0b0cb0569df335814831"
                }
            }*/
            // stage("JUnit Tests") {
            //     steps {
                    
            //         sh "mvn clean test "
                    
            //     }
            // }
        
                
        //    stage("Deploy Artifact") {
        //         steps {
        //             //sh "mvn clean deploy -DskipTests"
        //         sh "mvn -e deploy -DskipTests"
        //               }
        //     }
            
            stage("Docker Image") {
                steps{
                script{
                    sh "docker build -t samibhh/builtspring:latest ."
                }
                }
            }
            
            stage('DockerHub Connecting') {
                steps {
                    sh 'echo dckr_pat_IJl6m1o3x6Nqn8Rwx6mHObbGocM | docker login -u amaalt --password-stdin'
                }
            }
            
        /* stage('Push Image') {
                steps {
                    sh 'docker push samibhh/builtspring:latest'
                }
            }*/
            
        stage('Run Project'){
            steps{
                sh 'docker run -p 8089:8089 --network mynetwork -d tpachat:latest'
                    //sh 'docker compose up -D'
            }
        }




    }
    
   
//           post {
// 		success{
// 		mail bcc: '', body: '''Build succeed Congratulations Boss! -Jenkins Team-''', cc: '', from: 'sami.belhajhassine@esprit.tn', replyTo: '', subject: 'Build Finished - Success', to: 'samibhh1998@gmail.com'
// 		}
		
// 		failure{
// mail bcc: '', body: '''Pipline wasn't able to work try again ! -Jenkins Team-''', cc: '', from: 'sami.belhajhassine@esprit.tn', replyTo: '', subject: 'Build Finished - Failure', to: 'samibhh1998@gmail.com'
// 		}

//         always {
// 		emailext attachLog: true, body: '', subject: 'Build finished',from: 'sami.belhajhassine@esprit.tn' , to: 'samibhh1998@gmail.com'
//             cleanWs()
//         }
    

