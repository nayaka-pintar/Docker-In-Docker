podTemplate(yaml: '''
              apiVersion: v1
              kind: Pod
              spec:
                volumes:
                - name: docker-socket
                  emptyDir: {}
                containers:
                - name: docker
                  image: docker:18.09
                  command:
                  - sleep
                  args:
                  - 99d
                  volumeMounts:
                  - name: docker-socket
                    mountPath: /var/run
                - name: docker-daemon
                  image: docker:18.09-dind
                  securityContext:
                    privileged: true
                  volumeMounts:
                  - name: docker-socket
                    mountPath: /var/run
''') {
  node(POD_LABEL) {
    writeFile file: 'Dockerfile', text: 'FROM scratch'
    container('docker') {
      sh 'DOCKER_BUILDKIT=1 docker build --progress plain -t testingdocker:latest . && docker ps'
      sh 'docker pull nayakasbl/php-httpd:latest'
      sh 'docker run -p 98:80 nayakasbl/php-httpd'
    }
  }
}
