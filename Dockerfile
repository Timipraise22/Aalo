# 1. Use the full Python image to ensure all graphical libraries are present
FROM python:3.10-bullseye

# 2. Bypass Render's broken cache and install wkhtmltopdf safely
RUN apt-get clean && apt-get -o Acquire::http::No-Cache=True update -y && apt-get install -y --fix-missing wkhtmltopdf

# 3. Set the working directory for your application
WORKDIR /app

# 4. Copy over your requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your application code into the container
COPY . .

# 6. Start the application (assuming your main file is app.py)
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:10000"]
