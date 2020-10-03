pipeline {
    agent any
    stages {
        stage('Publish') {
            steps {
                sh 'docker run --privileged --rm tonistiigi/binfmt --install all'
                sh 'docker buildx version'
                sh 'docker buildx create --name builder --driver docker-container --use || exit 0'
                sh 'docker buildx inspect --bootstrap'
                sh 'echo "${DOCKER_PASS}" | docker login -u "${DOCKER_USER}" --password-stdin'
                sh 'make publish'
            }
        }
    }
}