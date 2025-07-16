version: '3.8'
services:
  apify-mcp:
    build: .
    container_name: apify-mcp
    restart: unless-stopped
    
    environment:
      - NODE_ENV=production
      - APIFY_TOKEN=${APIFY_TOKEN}
      - PORT=8000
      - HOST=0.0.0.0
      
    ports:
      - "8000:8000"
      
    healthcheck:
      test: ["CMD", "wget", "-q", "--spider", "http://localhost:8000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
