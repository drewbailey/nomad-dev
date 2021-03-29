#!/usr/bin/env bash
set -e

mkdir -p /tmp/nomad-dev-cluster/server{1,2,3} /tmp/nomad-dev-cluster/client{1,2}
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

prefix() {
  local prefix="$1"
  shift
  "$@" > >(sed "s/^/$prefix: /") 2> >(sed "s/^/$prefix (err): /" >&2)
}

NOMAD_CMD=nomad
# NOMAD_CMD=nomad-129-ent
# NOMAD_CMD=nomad-1.0.4
# NOMAD_CMD=nomad-1.0.3-ent

# launch server 
( prefix "s1" $NOMAD_CMD agent -config=server1.hcl  ) &

( prefix "s2" $NOMAD_CMD agent -config=server2.hcl  ) &

( prefix "s3" $NOMAD_CMD agent -config=server3.hcl  ) &

# launch client 1
( $prefix "c1:" NOMAD_CMD agent -config=client1.hcl  ) &

# # launch client 2
# ( $NOMAD_CMD agent -config=client2.hcl   2>&1 | tee "/tmp/client2/log" ; echo "Exit code: $?" >> "/tmp/client2/log" ) &


trap 'kill -SIGTERM $(jobs -pr)' SIGINT SIGTERM

wait

# wait again to ensure process die
wait
