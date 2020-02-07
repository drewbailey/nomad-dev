docker ps | grep postgres | awk '{print $1}' | xargs docker kill
