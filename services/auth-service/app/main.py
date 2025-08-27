from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from prometheus_client import make_asgi_app
import logging

app = FastAPI(title="auth-service", version="1.0.0")

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Add Prometheus metrics
metrics_app = make_asgi_app()
app.mount("/metrics", metrics_app)

@app.get("/health")
async def health_check():
    return {"status": "healthy", "service": "auth-service"}

@app.get("/ready")
async def readiness_check():
    # Add actual readiness checks here
    return {"status": "ready", "service": "auth-service"}

@app.get("/")
async def root():
    return {"message": "Welcome to auth-service", "version": "1.0.0"}
