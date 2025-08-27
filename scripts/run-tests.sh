#!/bin/bash
set -e

echo "Running tests for all microservices..."

for service in auth-service user-service payment-service notification-service; do
    echo "Testing $service..."
    cd services/$service
    python -m pytest tests/ -v --cov=app --cov-report=term
    cd ../..
done

echo "All tests completed!"
