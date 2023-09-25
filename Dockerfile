# Using an official lightweight Python image.
FROM python:3.7-slim
# Installing dependencies.
RUN pip install Flask requests gunicorn
# Copy local code to the container image.
WORKDIR /app
COPY . .
ENV PORT 8080
# To Run the web service on container startup. Here we use the gunicorn
CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 app:app
