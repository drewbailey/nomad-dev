
job "java" {
  datacenters = ["dc1"]
  type        = "batch"
  group "java" {

    task "build" {
      lifecycle {
        hook    = "prestart"
        sidecar = false
      }
      driver = "raw_exec"
      config {
        command = "javac"
        args    = ["-d", "${NOMAD_ALLOC_DIR}", "local/Hello.java"]
      }
      template {
        destination = "local/Hello.java"
        data        = <<EOH
public class Hello {
    public static void main(String[] args) {
         try {
            // thread to sleep for 1000 milliseconds
            Thread.sleep(10000000);
            System.out.prinln("YOOOOOOOOOOOO");
         } catch (Exception e) {
            System.out.println(e);
         }}
}
EOH
      }
    }
    task "hello" {
      driver = "java"
      config {
        class_path = "${NOMAD_ALLOC_DIR}"
        class      = "Hello"
      }
    }
  }
}
