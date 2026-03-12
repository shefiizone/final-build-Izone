#!/bin/bash

# Hostinger Easy Deploy Script
echo "🚀 Starting Hostinger Deployment..."

# 1. Install dependencies
echo "📦 Installing dependencies..."
npm install --legacy-peer-deps

# 2. Build the application
echo "🏗️ Building frontend and backend..."
npm run build

# 3. Set environment variables (User should do this in Hostinger panel)
echo "📝 Note: Ensure you have set the following environment variables in your Hostinger panel:"
echo "   - NODE_ENV=production"
echo "   - JWT_SECRET"
echo "   - STRIPE_SECRET_KEY"
echo "   - VITE_STRIPE_PUBLISHABLE_KEY"
echo "   - APP_URL"

echo "✅ Deployment preparation complete!"
echo "👉 You can now start/restart the application using PM2:"
echo "   pm2 start dist-server/server.js --name 'izoneae'"
echo "   # OR if already running:"
echo "   pm2 restart izoneae"

