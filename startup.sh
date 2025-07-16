#!/bin/sh
set -e

echo "Starting Apify MCP Server..."
echo "Transport: ${TRANSPORT:-http}"
echo "Port: ${PORT:-8000}"

# Check for Apify token
if [ -z "$APIFY_TOKEN" ]; then
  echo "ERROR: APIFY_TOKEN not set!"
  echo "Please set APIFY_TOKEN environment variable"
  exit 1
fi

# Start server with HTTP transport
exec npx @apify/actors-mcp-server \
  --transport ${TRANSPORT:-http} \
  --host 0.0.0.0 \
  --port ${PORT:-8000}
