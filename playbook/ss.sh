CSTATE=$(docker ps -qa)
if [ -z "$CSTATE" ]
then cd /usr/ansible-homework/playbook ;\
 docker run --name fedor -d pycontribs/fedora:latest sleep 6000000000 ; \
 sleep 5 ; \
 docker stop $(docker ps -qa) ; \
else docker stop $(docker ps -qa) ; docker rm $(docker ps -qa)
fi
