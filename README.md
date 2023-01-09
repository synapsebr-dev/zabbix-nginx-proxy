# Proxy Reverso com Nginx

# Dependência

Este proxy depende dos serviços Zabbix Server e Grafana

- https://github.com/vanelos/zabbix-server
- https://github.com/vanelos/zabbix-grafana

<br>

# Implantação

Realizar clone do projeto
```
git clone git@github.com:synapsebr-dev/zabbix-nginx-proxy.git
```
<br>

# Configuração

Baseado nos arquivos "modelos", realizar as configurações:
- docker-compose.yml
- conf/nginx/conf.d/<domínio>.conf

<br>

# Certificado Digital

Criando certificado via webroot, exemplo:
```
docker compose run --rm certbot ash -c "certbot certonly --webroot -w /etc/nginx/html --email infraestrutura@vanelos.com.br -d dominio"
```

Criando certificado via DNS API no Cloudflare
```
docker compose run --rm -it certbot ash -c "certbot certonly --dns-cloudflare --dns-cloudflare-credentials /opt/letsencrypt/cloudflare.token --email infraestrutura@vanelos.com.br -d dominio"
```

Renovar certificado
```
docker compose run --rm certbot ash -c "certbot renew"
```

Visualizar os certificados
```
docker compose run --rm certbot ash -c "certbot certificates"
```
