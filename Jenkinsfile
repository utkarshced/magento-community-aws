pipeline {
  agent {
    node {
      label 'magento-TEMPLATE'
    }
  }

  stages {
    stage('Setup') {
      steps {
        dir(path: '/var/www/html/magento-ci-cd/workspace/MagentoGithubIntegration') {
          sh 'sudo php bin/magento maintenance:enable'
          sh 'sudo composer install --ignore-platform-reqs'
            script {
            try {
                sh 'git apply --ignore-whitespace m2-hotfixes/*.patch'
            } catch (err) {
                
            }
          }
        }
      }
    }

    stage('Upgrade') {
      steps {
          dir(path: '/var/www/html/magento-ci-cd/workspace/MagentoGithubIntegration') {
          sh 'sudo php bin/magento setup:upgrade'
          sh 'sudo php bin/magento deploy:mode:set production'
          sh 'sudo php bin/magento cache:flush'
          sh 'sudo php bin/magento cache:clean'
          sh 'sudo chmod -R 777 var generated pub/static'
          sh 'sudo php bin/magento maintenance:disable'
        }
      }
    }
  }
}