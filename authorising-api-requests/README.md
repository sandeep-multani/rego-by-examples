# Authorising API Requests

This policy is for a car sale application to limits who can run each of the RESTful APIs. 

Below is the list of who is authorized to run which API.

| API                       | Allowed User     |
| ------------------------- | ---------------- |
| GET /cars                 | Anyone           |
| POST /cars                | Only Managers    |
| GET /cars/{carid}         | Any Employee     |
| PUT /cars/{carid}         | Only Managers    |
| DELETE /cars/{carid}      | Only Managers    |
| GET /cars/{carid}/status  | Any Employee     |
| POST /cars/{carid}/status | Any Employee     |

## Use Employee Data
Use JSON data that has information about the employees in the organization, who are the ones using this application.

```
users := {
	"alice": {"manager": "charlie", "title": "salesperson"},
	"bob": {"manager": "charlie", "title": "salesperson"},
	"charlie": {"manager": "dave", "title": "manager"},
	"dave": {"manager": null, "title": "ceo"},
}
```

## Policy Input
Example input passed into OPA has the fields method, path, and user, e.g.

```
{
  "method": "GET",
  "path": ["cars", "car17", "status"],
  "user": "alice"
}
users := {
	"alice": {"manager": "charlie", "title": "salesperson"},
	"bob": {"manager": "charlie", "title": "salesperson"},
	"charlie": {"manager": "dave", "title": "manager"},
	"dave": {"manager": null, "title": "ceo"},
}
```

## Unit Tests

There are some unit tests to cover different cases as mentoined above inside the policy.


