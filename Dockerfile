FROM python:3.7
EXPOSE 5000
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
COPY . /app
COPY requirements.txt .
RUN python -m pip install -r requirements.txt
WORKDIR /app
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser
EXPOSE $PORT
CMD gunicorn python --workers=4 --bind 0.0.0.0:$PORT app:app ./app.py