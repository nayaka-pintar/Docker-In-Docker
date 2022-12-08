pod(yaml: '''
              apiVersion: v1
              kind: Pod
              spec:
                containers:
                - name: docker
                  image: docker:19.03.1
                  command:
                  - sleep
                  args:
                  - 99d
                volumes:
                - name: docker-socket
                  emptyDir: {}
                  volumeMounts:
                  - name: docker-socket
                    mountPath: /var/run
                
''') {
  node(POD_LABEL) {
    writeFile file: 'Dockerfile', text: 'FROM scratch'
    container('docker') {
      sh 'docker version && DOCKER_BUILDKIT=1 docker build --progress plain -t testing .'
    }
  }
}
