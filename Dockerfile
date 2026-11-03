# Start with a lightweight Python environment
FROM python:3.10-bullseye

# Install the wkhtmltopdf engine
RUN apt-get update -y && apt-get install -y --fix-missing wkhtmltopdf 

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

CMD exec gunicorn --bind 0.0.0.0:$PORT app:app
