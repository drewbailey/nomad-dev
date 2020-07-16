job "java_example" {
  datacenters = ["dc1"]
  type        = "service"

  group "java" {

    task "hello" {
      artifact {
        source      = "http://localhost:8000/Main.jar"
        destination = "local"
      }

      driver = "java"
      config {
        jar_path = "local/Main.jar"
      }
    }
  }
}
