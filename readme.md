# Super Simple Hostname Fixer

This is a simple script that will fix your dns record for your hostname in cloudflare, using the cloudflare api.

## Usage

List of required environment variables:

* `API_TOKEN` - Your cloudflare api key
* `ZONE_ID` - The zone id of the domain you want to update
* `RECORD_ID` - The record id of the record you want to update
* `HOST_NAME` - The name of the record you want to update

## Example

Check our example folder for a Kubernetes CronJob example.
Once the container is executed with the required environment variables, it will update the record with the current public ip address.

## Docker images

You can find the docker images on [Docker Hub](https://hub.docker.com/r/tmota900/ss-hostname-fixer).