1. Run consul: consul agent -dev
1. Run nomad: nomad agent -config=nomad-config.hcl
1. Run postgres, redis and nginx jobs
1. Run the watch script to monitor the environment and rendered template in the nginx container
1. Run either the kill-postgres or kill-redis script to kill an upstream container
 1. The nginx allocation will restart without the killed upstream
 1. After the killed task is restarted, it should show up in the rendered template
 1. Expected behavior: the associated environment variable shows up in the container process env.
 1. Reproduced bug: the associated environment variable *does not* show upin the container process env.
