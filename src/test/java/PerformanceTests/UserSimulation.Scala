package PerformanceTests

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._

class UserSimulation extends Simulation {


val getUsers = scenario("get all users").exec(karateFeature("classpath:PerformanceTests/GetUsers.feature"))


  setUp(
     getUsers.inject(nothingFor(5 seconds),atOnceUsers(5),rampUsers(users = 10).during(10 seconds)))
}