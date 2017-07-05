#!/bin/bash
docker push redmoo/sample-node:staging

ssh deploy@139.59.138.25 << EOF
docker pull redmoo/sample-node:staging
docker stop web || true
docker rm web || true
docker rmi redmoo/sample-node:current || true
docker tag redmoo/sample-node:staging redmoo/sample-node:current
docker run -d --net app --restart always --name web -p 3000:3000 redmoo/sample-node:current
EOF
