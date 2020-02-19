FROM ubuntu:16.04
RUN apt-get update && apt-get install \
  -y --no-install-recommends python3-dev python3-virtualenv gcc gfortran musl-dev g++ default-jdk \
  libxml2 libxml2-dev libxslt1-dev libffi-dev musl-dev cmake

RUN python3 -m virtualenv --python=/usr/bin/python3 /opt/venv
#RUN /opt/venv/bin/pip --help
RUN /opt/venv/bin/pip install --upgrade cython
RUN /opt/venv/bin/pip install --upgrade awscli
RUN /opt/venv/bin/pip install --upgrade boto3
COPY . /app
WORKDIR /app
RUN /opt/venv/bin/pip install -e .

# AWS related arguments : Uncomment the below arguments to run it on Mac
#ARG AWS_ACCESS_KEY_ID
#ARG AWS_SECRET_ACCESS_KEY
#ARG AWS_SESSION_TOKEN
#ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
#ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
#ENV AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN

CMD [ "source", "/opt/venv/bin/activate" ]
ENTRYPOINT ["/opt/venv/bin/python", "./tune_in/Runner.py"]