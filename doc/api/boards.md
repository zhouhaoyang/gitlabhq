# Boards

Every API call to boards must be authenticated.

If a user is not a member of a project and the project is private, a `GET`
request on that project will result to a `404` status code.

## Project Board

Lists Issue Boards in the given project.

```
GET /projects/:id/boards
```

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id`   | integer  | yes    | The ID of a project |

```bash
curl --header "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" https://gitlab.example.com/api/v4/projects/:id/boards
```

Example response:

```json
[
  {
    "id" : 1,
    "lists" : [
      {
        "id" : 1,
        "label" : {
          "name" : "Testing",
          "color" : "#F0AD4E",
          "description" : null
        },
        "position" : 1
      },
      {
        "id" : 2,
        "label" : {
          "name" : "Ready",
          "color" : "#FF0000",
          "description" : null
        },
        "position" : 2
      },
      {
        "id" : 3,
        "label" : {
          "name" : "Production",
          "color" : "#FF5F00",
          "description" : null
        },
        "position" : 3
      }
    ]
  }
]
```

## List board lists

Get a list of the board's lists.
Does not include `backlog` and `closed` lists

```
GET /projects/:id/boards/:board_id/lists
```

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id`   | integer  | yes    | The ID of a project |
| `board_id`   | integer  | yes    | The ID of a board |

```bash
curl --header "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" https://gitlab.example.com/api/v4/projects/5/boards/1/lists
```

Example response:

```json
[
  {
    "id" : 1,
    "label" : {
      "name" : "Testing",
      "color" : "#F0AD4E",
      "description" : null
    },
    "position" : 1
  },
  {
    "id" : 2,
    "label" : {
      "name" : "Ready",
      "color" : "#FF0000",
      "description" : null
    },
    "position" : 2
  },
  {
    "id" : 3,
    "label" : {
      "name" : "Production",
      "color" : "#FF5F00",
      "description" : null
    },
    "position" : 3
  }
]
```

## Single board list

Get a single board list.

```
GET /projects/:id/boards/:board_id/lists/:list_id
```

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id`      | integer | yes   | The ID of a project |
| `board_id`   | integer  | yes    | The ID of a board |
| `list_id`| integer | yes   | The ID of a board's list |

```bash
curl --header "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" https://gitlab.example.com/api/v4/projects/5/boards/1/lists/1
```

Example response:

```json
{
  "id" : 1,
  "label" : {
    "name" : "Testing",
    "color" : "#F0AD4E",
    "description" : null
  },
  "position" : 1
}
```

## New board list

Creates a new Issue Board list.

```
POST /projects/:id/boards/:board_id/lists
```

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id`            | integer | yes | The ID of a project |
| `board_id`   | integer  | yes    | The ID of a board |
| `label_id`         | integer  | yes | The ID of a label |

```bash
curl --request POST --header "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" https://gitlab.example.com/api/v4/projects/5/boards/1/lists?label_id=5
```

Example response:

```json
{
  "id" : 1,
  "label" : {
    "name" : "Testing",
    "color" : "#F0AD4E",
    "description" : null
  },
  "position" : 1
}
```

## Edit board list

Updates an existing Issue Board list. This call is used to change list position.

```
PUT /projects/:id/boards/:board_id/lists/:list_id
```

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id`            | integer | yes | The ID of a project |
| `board_id`   | integer  | yes    | The ID of a board |
| `list_id`      | integer | yes | The ID of a board's list |
| `position`         | integer  | yes  | The position of the list |

```bash
curl --request PUT --header "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" https://gitlab.example.com/api/v4/projects/5/boards/1/lists/1?position=2
```

Example response:

```json
{
  "id" : 1,
  "label" : {
    "name" : "Testing",
    "color" : "#F0AD4E",
    "description" : null
  },
  "position" : 1
}
```

## Delete a board list

Only for admins and project owners. Soft deletes the board list in question.

```
DELETE /projects/:id/boards/:board_id/lists/:list_id
```

| Attribute | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id`            | integer | yes | The ID of a project |
| `board_id`   | integer  | yes    | The ID of a board |
| `list_id`      | integer | yes | The ID of a board's list |

```bash
curl --request DELETE --header "PRIVATE-TOKEN: 9koXpg98eAheJpvBs5tK" https://gitlab.example.com/api/v4/projects/5/boards/1/lists/1
```
