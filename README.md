# CI/CD Pipeline for Microservices

A comprehensive CI/CD pipeline for microservices using GitLab CI, Docker, and Kubernetes.

## 🚀 Quick Start

### Prerequisites
- Docker & Docker Compose
- GitLab account with CI/CD enabled
- Kubernetes cluster (for deployment)
- Helm 3.x

### Local Development

```bash
# Start all services
docker-compose up -d

# Run tests
./scripts/run-tests.sh

# View logs
docker-compose logs -f [service-name]

# Stop all services
docker-compose down
```

### Deployment

```bash
# Deploy to staging
./scripts/deploy.sh staging

# Deploy to production
./scripts/deploy.sh production
```

## 📁 Project Structure

```
.
├── .gitlab-ci.yml           # GitLab CI/CD configuration
├── docker-compose.yml        # Local development environment
├── services/                 # Microservices
│   ├── auth-service/
│   ├── user-service/
│   ├── payment-service/
│   └── notification-service/
├── charts/                   # Helm charts
│   └── microservices/
├── monitoring/              # Monitoring configurations
│   ├── prometheus/
│   └── grafana/
├── scripts/                 # Utility scripts
└── tests/                   # End-to-end tests
```

## 🔧 Services

- **Auth Service**: JWT authentication and authorization
- **User Service**: User management and profiles
- **Payment Service**: Payment processing with Stripe
- **Notification Service**: Email and SMS notifications

## 📊 Monitoring

- Prometheus: http://localhost:9090
- Grafana: http://localhost:3000
- RabbitMQ: http://localhost:15672
- Jaeger: http://localhost:16686

## 🛡️ Security

- Container scanning with Trivy
- SAST with Semgrep
- Dependency checking with Safety
- Secret management with GitLab CI variables

## 📝 License

MIT License
