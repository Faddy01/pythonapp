FROM python:3.9-slim

WORKDIR /pythonapp

COPY pythonapp.py .

CMD ["python", "pythonapp.py"]