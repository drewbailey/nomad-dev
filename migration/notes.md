
→ nomad node drain -enable 6c2
Are you sure you want to enable drain mode for node "6c2f40cc-088b-994f-f955-9bf9245ee40a"? [y/N] y
2019-12-18T14:13:04-05:00: Ctrl-C to stop monitoring: will not cancel the node drain
2019-12-18T14:13:04-05:00: Node "6c2f40cc-088b-994f-f955-9bf9245ee40a" drain strategy set
2019-12-18T14:13:05-05:00: Alloc "3490baf1-62c9-cf62-97fb-565ea9cf0591" marked for migration
2019-12-18T14:13:06-05:00: Alloc "3490baf1-62c9-cf62-97fb-565ea9cf0591" draining
2019-12-18T14:13:07-05:00: Alloc "3490baf1-62c9-cf62-97fb-565ea9cf0591" status running -> complete
2019-12-18T14:15:39-05:00: Alloc "3d9c0d4d-700b-ef37-a3fe-90a1263026a7" marked for migration
2019-12-18T14:15:40-05:00: Alloc "3d9c0d4d-700b-ef37-a3fe-90a1263026a7" draining
2019-12-18T14:15:40-05:00: Drain complete for node 6c2f40cc-088b-994f-f955-9bf9245ee40a
2019-12-18T14:15:41-05:00: Alloc "3d9c0d4d-700b-ef37-a3fe-90a1263026a7" status running -> complete
2019-12-18T14:15:41-05:00: All allocations on node "6c2f40cc-088b-994f-f955-9bf9245ee40a" have stopped
