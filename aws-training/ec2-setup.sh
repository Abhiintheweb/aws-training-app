#!/bin/bash

# Install Python and Git
sudo yum update -y
sudo yum install python3 git -y

# Install Poetry
curl -sSL https://install.python-poetry.org | python3 -

# Clone your Django project repository
git clone https://github.com/Abhiintheweb/aws-training-app.git

# Navigate to the project directory
cd aws-training-app/aws-training

# Install project dependencies using Poetry
poetry install

# Activate virtual environment
poetry shell

# Run Django migrations and start the development server
python manage.py migrate
python manage.py runserver 0.0.0.0:8000
