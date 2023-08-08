pipeline {
    agent any
    triggers {
        githubPush()
    }
    options {
        timestamps()
    }
    stages {
        stage('Github Clone & Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Jun914/dockerfile-example.git'
                    // credentialsId: 'docker-example'
            }
        }
        stage('Docker Build - httpd') {
            steps {
                script {
                    // Docker hub 에 로그인 하기 위해 사용
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
                        // Dockerfile 로 이미지 생성
                        docker.build('jun914/httpd', '--no-cache ./ubuntu_apache2')
                    }
                }
            }
        }
        stage('Docker Build - nginx') {
            steps {
                script {
                    // Docker hub 에 로그인 하기 위해 사용
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
                        // Dockerfile 로 이미지 생성
                        docker.build('jun914/nginx', '--no-cache ./ubuntu_nginx')
                    }
                }
            }
        }
        stage('Docker Build - loadbalancer') {
            steps {
                script {
                    // Docker hub 에 로그인 하기 위해 사용
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
                        // Dockerfile 로 이미지 생성
                        docker.build('jun914/loadbalancer', '--no-cache ./ubuntu_nginx_loadbalancer')
                    }
                }
            }
        }
        stage('Docker Image Push') {
            steps {
                script {
                    // Docker hub 에 로그인 하기 위해 사용
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
                        def httpd_img = docker.image('jun914/httpd')
                        def nginx_img = docker.image('jun914/nginx')
                        def loadbalancer_img = docker.image('jun914/loadbalancer')
                        
                        httpd_img.push('latest')
                        nginx_img.push('latest')
                        loadbalancer_img.push('latest')
                        
                        httpd_img.push('2.5')
                        nginx_img.push('2.5')
                        loadbalancer_img.push('2.5')
                    }
                }
            }
        }
    }
    post {
        cleanup {
            emailext subject: '$DEFAULT_SUBJECT',
                     to: 'abhyuni@gmail.com',
                     body: '$DEFAULT_CONTENT'
            cleanWs() // 작업영역 삭제
        }
    }
}
