gl_conf_file="/etc/graylog/server/server.conf"


private_ip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
public_ip=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
mongo_ip="172.31.7.164"
es_ip="172.31.15.217"

sed -i s/MONGO_IP_SED/$mongo_ip/g "$gl_conf_file"
sed -i s/PUBLIC_IP_SED/$public_ip/g "$gl_conf_file"
sed -i s/PRIVATE_IP_SED/$private_ip/g "$gl_conf_file"
sed -i s/ES_UNICAST_IP_SED/$es_ip/g "$gl_conf_file"

sleep 3

runuser -l graylog /opt/graylog/graylog-2.0.3/bin/graylogctl start
