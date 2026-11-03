# Aalo invoice application

This repository is a copy of the Fav's Couture invoice generator.

## Setup

1. Install the Python packages in `requirements.txt`.
2. Add your Firebase service-account credentials as `firebase_key.json` (this file is ignored by git).
3. Run `python app.py`, or build and run the Docker image. PDF and JPEG exports require `wkhtmltopdf` and `wkhtmltoimage`.

The original logo image is not included in this copy; add it at `static/logo.png` to display it on invoices. The application will render without a logo if that file is absent.
