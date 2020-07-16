# launch server 
( nomad-0-9-5 agent -config=server1.hcl 2>&1 | tee "/tmp/server1/log" ; echo "Exit code: $?" >> "/tmp/server1/log" ) &

( nomad-0-9-5 agent -config=server2.hcl 2>&1 | tee "/tmp/server2/log" ; echo "Exit code: $?" >> "/tmp/server2/log" ) &

( nomad-0-9-5 agent -config=server3.hcl 2>&1 | tee "/tmp/server3/log" ; echo "Exit code: $?" >> "/tmp/server3/log" ) &

# launch client 1
( nomad-0-9-5 agent -config=client1.hcl 2>&1 | tee "/tmp/client1/log" ; echo "Exit code: $?" >> "/tmp/client1/log" ) &

# launch client 2
( nomad-0-9-5 agent -config=client2.hcl 2>&1 | tee "/tmp/client2/log" ; echo "Exit code: $?" >> "/tmp/client2/log" ) &
