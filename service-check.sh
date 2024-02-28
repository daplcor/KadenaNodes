#!/usr/bin/env bash

# Define environment variables with default values if not already set
export CHAINWEB_NETWORK=${CHAINWEB_NETWORK:-mainnet01}
export CHAINWEB_PORT=${CHAINWEB_P2P_PORT:-2022}
SERVICE_NAME="kadena-node.service"
LOG_FILE="/var/log/chainweb/service.log"

# Function to log messages with timestamps
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Function to check the service status
check_service_status() {
    curl -fsLk --connect-timeout 10 "https://localhost:$CHAINWEB_PORT/chainweb/0.0/$CHAINWEB_NETWORK/cut"
}

# Function to restart the service and log the outcome
restart_service() {
    if systemctl restart "$SERVICE_NAME"; then
        log_message "Successfully restarted the Chainweb service."
    else
        log_message "Failed to restart the Chainweb service."
        exit 1  # Exit with an error status if the restart fails
    fi
}

# Main logic to check service status and potentially restart the service
if check_service_status; then
    log_message "Chainweb service is running."
else
    log_message "Chainweb service might be down. Attempting to restart..."
    restart_service
fi