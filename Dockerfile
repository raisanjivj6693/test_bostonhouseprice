FROM python:3.7

# Set working directory and copy application code
WORKDIR /app
COPY . /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos "" appuser
USER appuser

# Expose port and run the application
EXPOSE 5000
CMD ["python", "./app.py"]
