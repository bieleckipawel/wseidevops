FROM python:3.14.0a3-alpine3.20

WORKDIR /app

COPY . .

RUN pip install flask

CMD ["python", "app.py"]
