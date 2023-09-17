cd elastic-search/
docker compose up -d

cd ..

echo "Waiting for Elasticsearch availability";

until curl -s http://localhost:9200 | grep -q "missing authentication credentials"; do sleep 30; done;

http_code=$(curl --write-out %{http_code} --silent --output /dev/null -k -u "elastic:A$ur@-chUrn" http://localhost:9200/_security/user/kibana_login)


if [ $http_code == 404 ]; then
curl -k -u "elastic:A$ur@-chUrn" -X POST "http://localhost:9200/_security/user/kibana_login" -H 'Content-Type: application/json' -d'
{
  "password" : "D3v@-ChurN",
  "roles" : [ "kibana_system" ],
  "full_name" : "Kibana System",
  "email" : "kibana-system@amrita-local.com",
  "metadata" : {
    "intelligence" : 7
  }
}'
else
    echo 'found'
fi

http_code=$(curl --write-out %{http_code} --silent --output /dev/null -k -u "elastic:A$ur@-chUrn" http://localhost:9200/_security/user/kibana_admin)


if [ $http_code == 404 ]; then
curl -k -u "elastic:A$ur@-chUrn" -X POST "http://localhost:9200/_security/user/kibana_admin" -H 'Content-Type: application/json' -d'
{
  "password" : "D3v@-ChurN",
  "roles" : [ "kibana_admin" ],
  "full_name" : "Kibana Admin",
  "email" : "kibana-admin@amrita-local.com",
  "metadata" : {
    "intelligence" : 7
  }
}'
else
    echo 'found'
fi

cd kibana/
docker compose up -d