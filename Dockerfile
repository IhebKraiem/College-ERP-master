# Base image
FROM python:3.8

# Setup environment variable
ENV DockerHOME /home/app/webapp

# Set work directory
RUN mkdir -p $DockerHOME
WORKDIR $DockerHOME

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip

# Copy whole project to your docker home directory
COPY . $DockerHOME

# Run this command to install all dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Port where the Django app runs
EXPOSE 8000

# Start server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
