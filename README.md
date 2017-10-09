# jenkins
docker service create \
--mount 'type=volume,src=JENKINS,dst=/var/jenkins_home,volume-driver=local,volume-opt=type=nfs,volume-opt=device=192.168.1.10:/JENKINS,"volume-opt=o=addr=192.168.1.10,vers=4,soft,timeo=180,bg,tcp,rw"' \
--name jenkins_service \
--publish 8080:8080 \
jenkins
