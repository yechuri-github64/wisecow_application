#!/bin/bash

# setting up threshods values
CPU_THRESHOLD=80       # Alert if CPU usage exceeds 80%
MEMORY_THRESHOLD=80    # Alert if Memory usage exceeds 80%
DISK_THRESHOLD=80      # Alert if Disk usage exceeds 80%
PROCESS_THRESHOLD=100  # Alert if more than 100 processes are running

# Path to the log file
LOG_FILE="$HOME/system_health.log"

# Create the log file if it doesn't exist and set the correct permissions
if [ ! -f "$LOG_FILE" ]; then
  touch "$LOG_FILE"
  chmod 644 "$LOG_FILE"
fi

# function for current timestamp
timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

# Function for log a message with a timestamp
log_message() {
  local message="$1"
  echo "$(timestamp) $message" | tee -a "$LOG_FILE"
}

# Function to check CPU usage
check_cpu() {
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
  cpu_usage_int=${cpu_usage%.*}

  if [ "$cpu_usage_int" -gt "$CPU_THRESHOLD" ]; then
    log_message "ALERT: High CPU usage detected: ${cpu_usage}%!"
  else
    log_message "INFO: CPU usage is normal: ${cpu_usage}%."
  fi
}

# Function to check memory usage
check_memory() {
  memory_usage=$(free | grep Mem | awk '{printf "%.2f", $3/$2 * 100.0}')
  memory_usage_int=${memory_usage%.*}

  if [ "$memory_usage_int" -gt "$MEMORY_THRESHOLD" ]; then
    log_message "ALERT: High memory usage detected: ${memory_usage}%!"
  else
    log_message "INFO: Memory usage is normal: ${memory_usage}%."
  fi
}

# Function to check disk usage
check_disk() {
  disk_usage=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

  if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
    log_message "ALERT: High disk usage detected: ${disk_usage}%!"
  else
    log_message "INFO: Disk usage is normal: ${disk_usage}%."
  fi
}

# Function to check the number of running processes
check_processes() {
  process_count=$(ps -e --no-headers | wc -l)

  if [ "$process_count" -gt "$PROCESS_THRESHOLD" ]; then
    log_message "ALERT: High number of processes running: ${process_count}!"
  else
    log_message "INFO: Number of running processes is normal: ${process_count}."
  fi
}

# Main function to perform the system health check
main() {
  log_message "initializing health check up.../"
  check_cpu
  check_memory
  check_disk
  check_processes
  log_message "hooray! system health check completed."
}

main
