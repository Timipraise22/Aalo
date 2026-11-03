# 1. Switch to Ubuntu 22.04 (which has stable, unbroken servers)
FROM ubuntu:22.04

# 2. Stop the installation from pausing to ask for a timezone
ENV DEBIAN_FRONTEND=noninteractive

# 3. Install Python, pip, and wkhtmltopdf from Ubuntu's reliable servers
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip wkhtmltopdf && \
    apt-get clean

# 4. Set the working directory
WORKDIR /app

# 5. Copy and install your requirements
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# 6. Copy the rest of the application
COPY . .

# 7. Start the server
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:10000"]
