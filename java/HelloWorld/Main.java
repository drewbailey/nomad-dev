package HelloWorld;

import Reader.BufferedReader;

public class Main {

    public static void main(String[] args) {

      System.out.println("contents of /proc/self/mountinfo:");
      BufferedReader br = new BufferedReader(new FileReader("/proc/self/mountinfo"));
      String line = null;
      while ((line = br.readLine()) != null) {
        System.out.println(line);
        Thread.sleep(4000);
      }
    }

}
