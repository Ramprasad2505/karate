Feature: Users

  Background:
    * url perfUrl
    * configure ssl = true

  Scenario: get all users
  #and then get the first user by id
    Given path 'users'
    When method get
    Then status 200