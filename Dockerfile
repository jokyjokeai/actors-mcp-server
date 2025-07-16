FROM node:18-alpine

WORKDIR /app

# Install the server globally
RUN npm install -g @apify/actors-mcp-server

# Create a simple wrapper script
RUN echo '#!/bin/sh' > /app/start.sh && \
    echo 'exec node /usr/local/lib/node_modules/@apify/actors-mcp-server/dist/http.js' >> /app/start.sh && \
    chmod +x /app/start.sh

EXPOSE 8000

CMD ["/app/start.sh"]
