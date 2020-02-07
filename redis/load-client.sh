#!/bin/zsh

for i in {0..3000}
do
  nomad job stop -detach -purge "redis-$i"
  # sed -i "s/job \"redis.*\"/job \"redis-$i\"/" example.nomad
  # nomad job run -detach example.nomad
done
