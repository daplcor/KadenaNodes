
# Chainweb Node Monitoring Script README

This README provides instructions for setting up and using the Chainweb node monitoring script. The script is designed to check the status of a Chainweb node, automatically restarting it if it's found to be down, and logging the action. You can add things like discord or telegram hooks to alert you when actions are taken.

## Getting Started

Follow these instructions to set up the Chainweb node monitoring script on your system. This script is intended for systems running Chainweb nodes, aiming to ensure high availability and reliability of the node by monitoring its status and performing automatic restarts if necessary. Depending on your configuration,
you may have to adapt slightly.

### Prerequisites

Before you begin, ensure your system has the following:

- Bash shell
- `curl` for making HTTP requests
- `systemctl` for managing system services
- Permissions to execute scripts and restart services on your system

### Setup

1. **Download the Script**: Clone this repository or download the script directly to your desired directory.

2. **Make the Script Executable**:

    ```bash
    chmod +x check_chainweb_service.sh
    ```

3. **Configure Environment Variables**: The script uses two environment variables:
   - `CHAINWEB_NETWORK`: The Chainweb network your node connects to (default is `mainnet01`).
   - `CHAINWEB_PORT`: The P2P port Chainweb node uses (default is `2022`).

    You can set these variables directly in your shell or within the script itself.

4. **Set the Service Name and Log File Path**: Ensure the `SERVICE_NAME` and `LOG_FILE` variables in the script match your system's configuration.

### Running the Script

To manually run the script:

```bash
./check_chainweb_service.sh
```

This will check the status of your Chainweb node and restart the service if it's not running.

## Scheduling Automatic Checks

To ensure your Chainweb node is always operational, you can schedule the script to run automatically at regular intervals using `cron`.

1. Open your crontab for editing:

    ```bash
    crontab -e
    ```

2. Add a line to run the script every 10 minutes:

    ```cron
    */10 * * * * /path/to/check_chainweb_service.sh
    ```

    Replace `/path/to/` with the actual directory path where your script is located.

## Logs

The script logs all actions to a file specified by the `LOG_FILE` variable. By default, this is `/var/log/chainweb/service.log`. Ensure the user running the script has write permissions to this file or adjust the path as needed.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.



