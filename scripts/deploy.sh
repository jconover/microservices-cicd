#!/bin/bash
set -e

ENVIRONMENT=${1:-staging}
NAMESPACE=${2:-default}

echo "Deploying to $ENVIRONMENT environment in namespace $NAMESPACE..."

# Build and push Docker images
for service in auth-service user-service payment-service notification-service; do
    echo "Building $service..."
    docker build -t registry.example.com/$service:latest services/$service
    docker push registry.example.com/$service:latest
done

# Deploy with Helm
helm upgrade --install microservices charts/microservices \
    --namespace $NAMESPACE \
    --create-namespace \
    --values charts/microservices/values-$ENVIRONMENT.yaml \
    --wait

echo "Deployment completed!"
