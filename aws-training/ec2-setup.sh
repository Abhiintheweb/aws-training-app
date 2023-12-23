#!/bin/bash

# Install Python and Git
sudo yum update -y
sudo yum install python3 git -y

# Install Nginx
sudo yum install nginx -y

# Create an Nginx configuration file
echo "server {
    listen 80;
    server_name your_domain_or_ip;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}" | sudo tee /etc/nginx/conf.d/your_project_name.conf

# Restart Nginx
sudo systemctl restart nginx

# Install Poetry
curl -sSL https://install.python-poetry.org | python3 -

# Clone your Django project repository
git clone https://github.com/Abhiintheweb/aws-training-app.git

# Navigate to the project directory
cd aws-training-app/aws-training

# Install project dependencies using Poetry
poetry install
cd api
# Activate virtual environment
poetry shell

# cd api

# Run Django migrations and start the development server
poetry run python manage.py migrate
nohup poetry run python manage.py runserver 0.0.0.0:8000 & 
