# Super Simple Hostname Fixer

This is a simple script that will fix your dns record for your hostname in cloudflare, using the cloudflare api.

## Usage

List of required environment variables:

* `API_TOKEN` - Your cloudflare api key
* `ZONE_ID` - The zone id of the domain you want to update
* `RECORD_ID` - The record id of the record you want to update
* `HOST_NAME` - The name of the record you want to update
* `PROXIED` (optional) - If the record should be proxied or not (true/false) (default: true)

run:
``` bash
API_TOKEN=123 ZONE_ID=123 RECORD_ID=123 HOST_NAME=example.com ./hostfix.sh
```

## Example

Check our example folder for a Kubernetes CronJob example.
Once the container is executed with the required environment variables, it will update the record with the current public ip address.

## Where to find the zone id and record id

- The zone id can be found in cloudflare dashboard, in overview of the domain.
- The record id can be found in cloudflare api using the following url [API Documentation](https://api.cloudflare.com/#dns-records-for-a-zone-list-dns-records):

`https://api.cloudflare.com/client/v4/zones/{zone_id}/dns_records`


#### Example request
``` bash
curl -X GET "https://api.cloudflare.com/client/v4/zones/{zone_id}/dns_records?page=1&per_page=100&order=type&direction=desc&match=all" \
     -H "Authorization: Bearer {api_token}" \
     -H "Content-Type: application/json"
```


## Docker images

You can find the docker images on [Docker Hub](https://hub.docker.com/r/tmota900/ss-hostname-fixer).

### Docker Run Example

``` bash
docker pull tmota900/ss-hostname-fixer
docker run -e API_TOKEN=123 -e ZONE_ID=123 -e RECORD_ID=123 -e HOST_NAME=example.com tmota900/ss-hostname-fixer
```