FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir \
    fastapi==0.104.1 \
    uvicorn[standard]==0.24.0 \
    pydantic==2.5.0 \
    starlette==0.27.0

# Copy the API files
COPY perfect-api.py /app/
COPY openapi.json /app/

# Expose port
EXPOSE 8000

# Default command
CMD ["uvicorn", "perfect-api:app", "--host", "0.0.0.0", "--port", "8000"]
