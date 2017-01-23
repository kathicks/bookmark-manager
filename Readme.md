# Bookmark Manager



## User stories

```
User story 1

As a User
So I can go back to interesting websites and learn how to learn
I want to be able to see them as a list

```

```
User story 2

As a User
So that I can access website links later
I want to be able to add links to my account

```

```
User story 3

As a User
In order to organise my links
I want to be able to tag them

```

```
User story 4

As a User
In order to find links easier
I want to be able to filter them by tags
```
## Domain Model

User Story 1:

| Objects    |  Messages    |
|------------|--------------|
| User     |              |
| Links      | show         |
| Account    | add_links    |
| Links      | tag          |
| Links      | filter       |

```
USER                 WEB - APP              DATABASE
----------------------------------------------------------------

  request - show links
  |---------------------> request links
                         |---------------------->

                         <----------------------|
  <---------------------|


  request - Add link
  |---------------------> add link
                         |---------------------->


  request - Add a tag
  |--------------------->  add tag to link
                         |---------------------->


  request - filter links
  |--------------------->
  <---------------------|

```
