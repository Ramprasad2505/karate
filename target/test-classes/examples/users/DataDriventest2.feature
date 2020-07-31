@Functional
Feature: DataDriventest2
  # read request data from a csv file
  Background:
    * url 'https://jsonplaceholder.typicode.com/posts'

Scenario Outline: Read the request from a CSV file and post
* header Content-Type = 'application/json'

Given request {<title>,"body":<body>,"userid":<userid>}
When method post
Then status 201
Then print response

  Examples:
  | read('TestData.csv') |