# node-app
# $ curl 127.0.0.1:3000/
# Hello, World!
#----------------------
sudo apt update
sudo apt install gnupg2
sudo apt install apt-transport-https
sudo apt install ca-certificates
sudo apt install wget
sudo apt install curl
sudo apt install software-properties-common

# grafana guery
{job="containerlogs"} | json

#--------------------------
sudo apt install -y netcat
nc -zv 44.202.222.124 3100
#--------------------------
curl http://localhost:3100/ready

ansible-playbook setup_docker.yml -i inventory.ini --limit monitoring,app

# docker build -t node-app:1.0 .
# docker run -d -p 3000:3000 my-node:1.0
# docker tag node-app:1.0 chesnokov70/node-app:1.0
# docker login
# docker push chesnokov70/node-app:1.0
# docker compose up -d --build
# docker compose down
# docker exec -it node-app-nginx sh
# cat /etc/timezone
# America/New_York
#-----------------------------
# docker exec -it jenkins bash
# rm -rf /var/jenkins_home/jobs/*/builds
# scp /var/lib/jenkins/workspace/My_Lessons_Folder/node-app/docker-compose.tmpl root@${HOST}:/opt
# scp /var/lib/jenkins/workspace/My_Lessons_Folder/node-app/promtail-config.yaml root@${HOST}:/opt 
# rsync /var/lib/jenkins/workspace/My_Lessons_Folder/node-app/ root@${HOST}:/node-app