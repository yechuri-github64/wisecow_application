#!/bin/bash

# Configuration
URL="http://localhost:4450"  # replace your application url.....
LOG_FILE="$HOME/application_uptime.log" # log file
EXPECTED_STATUS_CODE=200                # application is up

# current timestamp
timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

#log messages with a timestamp
log_message() {
  local message="$1"
  echo "$(timestamp) $message" | tee -a "$LOG_FILE"
}

#to check application status
check_application_status() {
  # Use curl to get the HTTP status code of the application
  http_status=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

  if [ "$http_status" -eq "$EXPECTED_STATUS_CODE" ]; then
    log_message "INFO: Application is UP. Status code: $http_status"
  else
    log_message "ALERT: Application is DOWN or not responding as expected. Status code: $http_status"
  fi
}

# Main function
main() {
  log_message "Checking application status for $URL..."
  check_application_status
  log_message "Application status check completed."
}

# Run the main function
main
