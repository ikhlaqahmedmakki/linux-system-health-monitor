# Linux System Health Monitor

## Overview
A Bash script that monitors basic Linux system resources and
automatically records health reports using Cron.

## Metrics Monitored
- Disk usage
- Memory usage
- System load average
- Running process count

## Features
- Disk usage warning when usage exceeds 80%.
- Timestamped health reports.
- Appends reports to a log file.
- Supports a custom output file path.
- Automated execution every 5 minutes using Cron.

## Usage

Run manually:

./health.sh

Use a custom log file:

./health.sh /path/to/health.log

## Cron Configuration

*/5 * * * * /home/akhlaq/health-monitor/health.sh /home/akhlaq/health-monitor/logs/health.log

## Learning Outcomes
- Linux resource monitoring
- Bash scripting
- File permissions
- Log management
- Cron scheduling and verification
