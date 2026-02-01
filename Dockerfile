FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY app.py .
COPY requirements.txt .
RUN pip3 install --upgrade pip && \
    pip3 install flask==2.0.3 werkzeug==2.0.3
EXPOSE 8080
CMD ["python3", "app.py"]