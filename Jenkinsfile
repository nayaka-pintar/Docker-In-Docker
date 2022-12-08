pipeline {
    agent {
            Docker {
                yaml """
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
                """

            }
    }
}
