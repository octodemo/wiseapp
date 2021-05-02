pipeline {
      agent any
  stages {
          
         stage('Clone Github repository') {
            
    
           steps {
              
             checkout scm
           
              }
  
          }

       stage('Building our image') { 

            steps { 

                sh 'docker build -t deanj08/bombshell:test .'
            } 

        }         
                

          }
        
        stage('Deploy to Docker Image') { 

            steps { 
                 
                 script {
                    docker.withRegistry( "" , 'git' ) { 
                       
                        sh 'docker push deanj08/bombshell:test'

                      }
                   }
                } 

          }
        
  } 
}
