#!/usr/bin/env bash
DIR_SCRIPT="$( cd "$( dirname "$0" )" && pwd )"
cd "$DIR_SCRIPT"

function test(){
  docker compose exec -it proxy ash -c "nginx -t"
}

function reload(){
  docker compose up -d --build
}

function restart(){
  docker compose down
  sleep 5
  docker compose up -d
}

function log(){
  docker compose logs -f
}

function cert_renew(){
  docker compose run --rm certbot ash -c "certbot renew" && bash $0 test && bash $0 reload
}

$1
