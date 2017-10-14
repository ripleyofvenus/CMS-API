# CMS-API
This application is an Express.js API for storing blog posts and web pages for
users.  Users can create, update, and delete posts and pages. Visitors can view
blog posts and web pages that belong to a user without logging in.

[Click Here for demo](https://d0minators.github.io/CMS/)

API URL:  https://sserpdrow-api.herokuapp.com

# Technologies Used
- JavaScript
- Express.js
- Node.js
- MongoDB
- Mongoose

# Our Planning process
Please see the front-end component of this project for more information about
our planning process, etc.: https://github.com/D0Minators/CMS

# Entity Relationship Diagram

![CMS ERD](/cms-erd.JPG)

# Our development process and problem-solving strategy
We began this full-stack project by implementing the back-end. All four of us
(Dahnaya, Ripley, Stephanie, Susan) worked together to unzip the template,
make the updates necessary to set up the project, create the git repo, push
the initial commit to git, and deploy to heroku.
Once the basic project was set up, we created the Contents resource to store
the information about Web Pages and Blog Posts.  We also created curl scripts
to test the routes (CRUD). Once the CRUD operations were tested and we knew
the API was working as expected, we merged our code and deployed it to
heroku again.  We pretty much finished all of that on the first day.
Later Stephanie and Susan worked on getting a user document by email address
so that we could allow visitors to enter an email address of a user that had
created contents and view that content without logging in.


## A Message for my colleagues

![Obligatory Puppy photo](/boston_terrier.jpg)

## API

### Contents
| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/contents`             | `contents#index`   |
| GET    | `/contents/:id`         | `contents#show`    |
| POST   | `/contents`             | `contents#create`  |
| PATCH  | `/contents/:id`         | `contents#update`  |
| DELETE | `/contents/:id`         | `contents#delete`  |

#### GET /contents
```sh
API="http://localhost:4741"
URL_PATH="/contents"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \

```
```sh
sh scripts/contents/index.sh
```

Response:

```md
HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 5588
ETag: W/"15d4-3EDtRurcDO3ss0q2pRrCuWwX0GI"
Date: Sat, 14 Oct 2017 14:17:42 GMT
Connection: keep-alive

{
	"contents": [{
		"_id": "59de652194adabcebbffff96",
		"updatedAt": "2017-10-11T18:38:25.828Z",
		"createdAt": "2017-10-11T18:38:25.828Z",
		"title": "First Blog Post",
		"date": "2017-10-11T00:00:00.000Z",
		"type": "blog",
		"text": "puppies are awesome",
		"_owner": "59de621813035dcc5dd43790",
		"__v": 0,
		"id": "59de652194adabcebbffff96",
		"editable": false
	}, {
		"_id": "59df886243397eed7cdbaced",
		"updatedAt": "2017-10-12T15:21:06.559Z",
		"createdAt": "2017-10-12T15:21:06.559Z",
		"title": "My First Blog Post",
		"date": "2017-10-12T00:00:00.000Z",
		"text": "This is my first blog post",
		"type": "post",
		"_owner": "59df737643397eed7cdbaceb",
		"__v": 0,
		"id": "59df886243397eed7cdbaced",
		"editable": false
	}, {
		"_id": "59e0d097ecaad20d94e489ec",
		"updatedAt": "2017-10-13T14:41:27.536Z",
		"createdAt": "2017-10-13T14:41:27.536Z",
		"title": "Test Content",
		"date": "2017-10-13T00:00:00.000Z",
		"text": "This is my first blog post",
		"type": "post",
		"_owner": "59de621813035dcc5dd43790",
		"__v": 0,
		"id": "59e0d097ecaad20d94e489ec",
		"editable": false
	}]
```
#### GET /contents/1
```sh
API="http://localhost:4741"
URL_PATH="/contents"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \

```
```sh
ID=59de652194adabcebbffff96 sh scripts/contents/show.sh
```

Response:

```md
HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 320
ETag: W/"140-W9U7DZ4/AeG42b8HWdJuKVnRn+E"
Date: Sat, 14 Oct 2017 14:23:47 GMT
Connection: keep-alive
{
	"content": {
		"_id": "59de652194adabcebbffff96",
		"updatedAt": "2017-10-11T18:38:25.828Z",
		"createdAt": "2017-10-11T18:38:25.828Z",
		"title": "First Blog Post",
		"date": "2017-10-11T00:00:00.000Z",
		"type": "blog",
		"text": "puppies are awesome",
		"_owner": "59de621813035dcc5dd43790",
		"__v": 0,
		"id": "59de652194adabcebbffff96",
		"editable": false
	}
}
```
#### POST /contents/
```sh
API="http://localhost:4741"

URL_PATH="/contents"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "content": {
      "title": "'"${TITLE}"'",
      "date": "'"${DATE}"'",
      "type": "'"${BLOG}"'",
      "text": "'"${TEXT}"'"
    }
  }'
```
```sh
TOKEN=s07WgQ+oj8t89G6/yXPw17PI+TB/ktiYLabYhcpokCM=--6/HQxlRuC+GqFE7T769BF37//sl3NukvfMD/4R+YuZ4= TITLE="Test Blog Post" DATE='2017-10-14' TYPE=post TEXT="My test blog post" sh scripts/contents/create.sh
```

Response:

```md
HTTP/1.1 201 Created
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
Content-Type: application/json; charset=utf-8
Content-Length: 318
ETag: W/"13e-XVUSVYmGTS+aUt0u3P0ng1Z1NwU"
Date: Sat, 14 Oct 2017 15:07:55 GMT
Connection: keep-alive

{
	"content": {
		"__v": 0,
		"updatedAt": "2017-10-14T15:07:55.449Z",
		"createdAt": "2017-10-14T15:07:55.449Z",
		"title": "Test Blog Post",
		"date": "2011-10-11T00:00:00.000Z",
		"type": "blog",
		"text": "puppies are awesome",
		"_owner": "59de621813035dcc5dd43790",
		"_id": "59e2284b748200459f15d143",
		"id": "59e2284b748200459f15d143",
		"editable": true
	}
}
```
#### PATCH /contents/
```sh
API="http://localhost:4741"

URL_PATH="/contents"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "content": {
      "title": "'"${TITLE}"'",
      "date": "'"${DATE}"'",
      "type": "'"${BLOG}"'",
      "text": "'"${TEXT}"'"
    }
  }'
```
```sh
TOKEN=s07WgQ+oj8t89G6/yXPw17PI+TB/ktiYLabYhcpokCM=--6/HQxlRuC+GqFE7T769BF37//sl3NukvfMD/4R+YuZ4= ID=59e2284b748200459f15d143 TITLE="Update Blog Post" DATE='2017-10-14' TYPE=post TEXT="My updated test blog post" sh scripts/contents/update.sh
```

Response:

```md
HTTP/1.1 204 No Content
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
ETag: W/"a-bAsFyilMr4Ra1hIU5PyoyFRunpI"
Date: Sat, 14 Oct 2017 15:17:24 GMT
Connection: keep-alive
```
#### DESTROY /contents/1
```sh
API="http://localhost:4741"

URL_PATH="/contents"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

```
```sh
TOKEN=s07WgQ+oj8t89G6/yXPw17PI+TB/ktiYLabYhcpokCM=--6/HQxlRuC+GqFE7T769BF37//sl3NukvfMD/4R+YuZ4= ID=59e2284b748200459f15d143  sh scripts/contents/destroy.sh
```

Response:

```md
HTTP/1.1 204 No Content
X-Powered-By: Express
Access-Control-Allow-Origin: http://localhost:7165
Vary: Origin
ETag: W/"a-bAsFyilMr4Ra1hIU5PyoyFRunpI"
Date: Sat, 14 Oct 2017 15:21:55 GMT
Connection: keep-alive
```
