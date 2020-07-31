package examples.users;

import com.intuit.karate.junit5.Karate;

public class TagRunner {
      @Karate.Test
    Karate testTags() {
      return Karate.run("GetUsers").tags ("@Functional,@Regression").relativeTo(getClass());
    }
}


