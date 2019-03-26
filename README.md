# Tado to CloudWatch
Fetches zone metrics from the Tado API and pushes them to CloudWatch.

# Metrics
For each zone:
* Set-point
* Temperature
* Demand %
* Humidity %

# Notes
* Hot Water zone reports only demand
* Hot Water zone assumed to have the ID of 0

# References
Thanks to Terence Eden and Stephen C Philips for their efforts to decode the Tado REST API: 
* https://shkspr.mobi/blog/2019/02/tado-api-guide-updated-for-2019/
