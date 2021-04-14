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

                sh 'docker build -t deanj08/bombshell:2.1 .'
            } 

        }         
           

       
       stage('Trivy Container Image Scan') {   
            steps {
   
                 sh 'trivy --light deanj08/bombshell:2.1'
                   
                 }
              }
            
        stage('container image approval request') {
     
           steps {
             script {
               def userInput = input(id: 'confirm', message: 'Do you Approve to use this container image?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Approve Code to Proceed', name: 'approve'] ])
              }
            }
          }
        
        stage('Deploy to Docker Image') { 

            steps { 
                 
                 script {
                    docker.withRegistry( "" , 'git' ) { 
                       
                        sh 'docker push deanj08/bombshell:2.1'

                      }
                   }
                } 

          }
        
  } 
}
