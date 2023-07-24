pipeline {
  agent any
  
  stages {
    stage('Checkout') {
      steps {
      //  git 'https://github.com/anilkumartechtiera/terraform-demo.git'
        checkout scm: [$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[credentialsId: 'f11ceaaf-d9b8-498c-b24c-feef888cb0fa', url: 'https://github.com/anilkumartechtiera/terraform-demo.git']]] 
      }
    }
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Terraform Plan') {
      steps {
        script {
          def changeSet = sh(returnStdout: true, script: 'terraform plan -out=tfplan -input=false -var-file=variables.tf -var="region=us-west-2"')  
          // Store the Terraform plan output in a variable for later use
          env.CHANGESET = changeSet.trim()
        }
      }
    }
   stage('Email Approval') {
      steps {
        script {
          // Customize the email template as per your needs
          def emailBody = '''
          <h2>Infrastructure Deployment Approval</h2>
          <p>Dear ${env.APPROVER},</p>
          <p>Please review and approve the Terraform plan for creating AWS infrastructure.</p>
          <p>Plan details:</p>
          <pre>${env.CHANGESET}</pre>
          <p>Click the link below to approve or reject the plan.</p>
          <p>${env.BUILD_URL}input/Infrastructure-Approval</p>
          '''
          
          emailext body: emailBody,
                   mimeType: 'text/html',
                   subject: 'Infrastructure Deployment Approval',
                   to: 'anil.pandey@verinon.com',
                   replyTo: 'anil.pandey@verinon.com',
                   attachLog: true
        }
      }
    }
    
    stage('Wait for Approval') {
      steps {
        timeout(time: 2, unit: 'DAYS') {
          input 'Infrastructure-Approval'
        }
      }
    }
   stage('Terraform Apply') {
      steps {
        sh 'terraform apply -input=false tfplan'
      }
    }
  }
}
