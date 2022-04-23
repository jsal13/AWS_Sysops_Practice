## Introduction
Watches metrics for various services.  EC2, etc.

- By default, every 5 minutes, and instance-level metrics.
- You can pay more to get 1 minute things.
- By default, custom metrics are 1 minute.

## Cloudwatch Logs
1. Centralized Logs.
2. View, Search, Filter.
	- Maybe search for error codes and messages.

**Log Events**
- Event message + time stamp.

**Log Stream**
- Sequence of Events.

**Log Group**
- Groups together Log Streams.

By default, retention is indefinite.  You can apply retention settings by yourself.

## Cloudwatch Security
- Needs HTTPS, needs IAM role with a cloudwatch service permission.  You need to run a bunch of commands to make the cloudwatch agent work --- lots of code, so look this up.