Feature: DataDriven test using scenario outline
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
|test|user|1|
|test2|user2|2|
|test3|test4|3|
|test5|test6|4|


