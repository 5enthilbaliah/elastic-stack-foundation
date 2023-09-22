# elastic-stack-foundation

docker compose up -d

docker compose down

# Known issues
Going to run elastic and kibana on http. We will use nginx to secure it.

# Create users
```shell
curl -k -u "elastic:A$ur@-chUrn" -X GET "http://elastic-search-foundation:9200/_security/roles
```