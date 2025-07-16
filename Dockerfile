# Apify MCP Server - Optimized for Elestio
FROM node:18-alpine

# Create app user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S -u 1001 -G nodejs nodejs

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --no-audit --no-fund

# Copy source code
COPY . .

# Create config directory
RUN mkdir -p /app/config && \
    chown -R nodejs:nodejs /app

# Switch to non-root user
USER nodejs

# Expose port for HTTP mode
EXPOSE 8000

# Use startup script
COPY startup.sh /app/
RUN chmod +x /app/startup.sh

CMD ["/app/startup.sh"]
