FROM ubuntu

RUN /bin/bash -c 'echo nayaka salsabilla'
ENV myCustomEnvVar="This nayaka made." \
    otherEnvVar="This also nayaka made."
