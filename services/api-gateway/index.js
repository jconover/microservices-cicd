const express = require('express');
const { createProxyMiddleware } = require('http-proxy-middleware');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');

const app = express();
const PORT = process.env.PORT || 8080;

// Middleware
app.use(helmet());
app.use(cors());
app.use(morgan('combined'));

// Health check
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', service: 'api-gateway' });
});

// Service routes
const services = [
  { route: '/auth', target: process.env.AUTH_SERVICE_URL || 'http://auth-service:8000' },
  { route: '/users', target: process.env.USER_SERVICE_URL || 'http://user-service:8000' },
  { route: '/payments', target: process.env.PAYMENT_SERVICE_URL || 'http://payment-service:8000' },
  { route: '/notifications', target: process.env.NOTIFICATION_SERVICE_URL || 'http://notification-service:8000' },
];

services.forEach(({ route, target }) => {
  app.use(route, createProxyMiddleware({
    target,
    changeOrigin: true,
    pathRewrite: { [`^${route}`]: '' },
  }));
});

app.listen(PORT, () => {
  console.log(`API Gateway running on port ${PORT}`);
});
