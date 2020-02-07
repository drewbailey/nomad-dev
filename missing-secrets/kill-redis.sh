docker ps | grep redis | awk '{print $1}' | xargs docker kill
