FROM rundeck/rundeck:4.6.0

RUN sudo apt-get update && sudo apt-get install -y \
    git vim net-tools iputils-ping ca-certificates python3 python3-pip \
    && sudo rm -rf /var/lib/apt/lists/*
RUN sudo ln -s /usr/bin/python3 /usr/bin/python
RUN pip install --upgrade pip && pip install ansible==6.3.0 requests boto3 awscli
RUN /home/rundeck/.local/bin/ansible-galaxy collection install community.docker
ENV PATH="${PATH}:/home/rundeck/.local/bin"