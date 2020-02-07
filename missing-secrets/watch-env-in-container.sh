watch -n 0.1 'docker ps | grep nginx | awk "{print \$1}" | xargs -I_ docker exec _ env | grep UPSTREAM'
