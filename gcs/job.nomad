job "gcs" {
  datacenters = ["dc1"]

  group "group" {
    task "tasks" {
      driver = "raw_exec"

      artifact {
        source      = "gcs::https://www.googleapis.com/storage/v1/drew-hashicorp-testing/nomad_0.10.0_linux_amd64.zip"
        destination = "local/some-directory"
      }

      config {
        command = "sleep"

        args = [
          "500",
        ]
      }
    }
  }
}
