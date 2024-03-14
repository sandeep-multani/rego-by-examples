package auth_api

# Secnarios: The policy is for car store application limits who can run each of the RESTful APIs.
# Below is the list of who is authorized to run which API.
# GET /cars --> Anyone
# POST /cars --> Only Managers
# GET /cars/{carid} --> Any Employee
# PUT /cars/{carid} --> Only Managers
# DELETE /cars/{carid} --> Only Managers
# GET /cars/{carid}/status --> Any Employee
# POST /cars/{carid}/status --> Any Employee

# Hint: CEO is also a manager

# data
users := {
	"alice": {"manager": "charlie", "title": "salesperson"},
	"bob": {"manager": "charlie", "title": "salesperson"},
	"charlie": {"manager": "dave", "title": "manager"},
	"dave": {"manager": null, "title": "ceo"},
}

# helpers
user_is_employee {
	users[input.user]
}

user_is_manager {
	users[input.user]
	users[input.user].title != "salesperson"
}

# policy
default allow = false

# Anyone can GET /cars
allow {
	input.path == ["cars"]
	input.method == "GET"
}

# Only Managers can POST /cars
allow {
	input.path == ["cars"]
	input.method == "POST"
    user_is_manager
}

# Any Employee can GET /cars/{carid}
allow {
	input.path = ["cars", car_id]
	input.method == "GET"
    user_is_employee
}

# Only Managers can PUT /cars/{carid}
allow {
	input.path = ["cars", car_id]
	input.method == "PUT"
    user_is_manager
}

# Only Managers can DELETE /cars/{carid}
allow {
	input.path = ["cars", car_id]
	input.method == "DELETE"
    user_is_manager
}

# Any Employee can GET /cars/{carid}/status
allow {
	input.path = ["cars", car_id, "status"]
	input.method == "GET"
    user_is_employee
}

# Any Employee can POST /cars/{carid}/status
allow {
	input.path = ["cars", car_id, "status"]
	input.method == "POST"
    user_is_employee
}
