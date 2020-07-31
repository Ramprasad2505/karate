Feature: GetUsers
# Add asserts and assert entire payload
  Background:
    * url baseUrl
    * configure ssl = true
  @Functional
  Scenario: get users
  #and then get the first user by id

    Given path 'users'
    When method get
    Then status 200
    Then print response
    * def ExpectedPayload = read('UsersResults.json')
    And match response == ExpectedPayload
    And match $..id contains 1
    And match $[9]['address']['city'] == 'Austin'


  @Smoke
  Scenario Outline: Post a message
    * header Content-Type = 'application/json'

    Given url 'https://jsonplaceholder.typicode.com/posts'
    And request {<title>,"body":<body>,"userid":<userid>}
    When method post
    Then print response
    Then status 201

    Examples:
      |title|body|userid|
      | foo | bar|1|
      | bar | foo|2|
      | foo | foo|3|
      | bar | bar|4|
  @Regression
  Scenario: Delete an existing post and capture the response

    Given url 'https://jsonplaceholder.typicode.com/posts'
    And path 'posts'
    When method delete
    Then status 200
    Then print response

