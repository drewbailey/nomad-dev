#!/usr/bin/env bash
set -e

mkdir -p /tmp/nomad-dev-cluster/server{1,2,3} /tmp/nomad-dev-cluster/client{1,2}
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

NOMAD_CMD=nomad

# launch server 
( $NOMAD_CMD agent -config=server1.hcl  2>&1 | tee "/tmp/server1/log" ; echo "Exit code: $?" >> "/tmp/server1/log" ) &

( $NOMAD_CMD agent -config=server2.hcl  2>&1 | tee "/tmp/server2/log" ; echo "Exit code: $?" >> "/tmp/server2/log" ) &

( $NOMAD_CMD agent -config=server3.hcl   2>&1 | tee "/tmp/server3/log" ; echo "Exit code: $?" >> "/tmp/server3/log" ) &

# launch client 1
( $NOMAD_CMD agent -config=client1.hcl   2>&1 | tee "/tmp/client1/log" ; echo "Exit code: $?" >> "/tmp/client1/log" ) &

# launch client 2
( $NOMAD_CMD agent -config=client2.hcl   2>&1 | tee "/tmp/client2/log" ; echo "Exit code: $?" >> "/tmp/client2/log" ) &


trap 'kill -SIGTERM $(jobs -pr)' SIGINT SIGTERM

wait

# wait again to ensure process die
wait
