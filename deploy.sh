#!/bin/bash
docker push redmoo/sample-node

ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /home/sam/.ssh/circleci deploy@138.68.68.192 << EOF
docker pull redmoo/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi redmoo/sample-node:current || true
docker tag redmoo/sample-node:latest redmoo/sample-node:current
docker run -d --net app --restart always --name web -p 3000:3000 redmoo/sample-node:current
EOF
