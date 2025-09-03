# TensorFlow Serving GPU Docker

TensorFlow Serving with GPU support for ESMM and embedding models.

## Quick Start

```bash
# Build image
docker build -t dongdong-tf-gpu .

# Run container
docker run -p 8500:8500 -p 8501:8501 -v $(pwd)/models:/models dongdong-tf-gpu
```

## API Endpoints

- gRPC: `localhost:8500`
- REST API: `localhost:8501`

## Models

- **ESMM**: Entire Space Multi-Task Model
- **Embedding**: Feature embedding model

## CI/CD

Automatically builds and pushes to Aliyun Container Registry on push to main branch.