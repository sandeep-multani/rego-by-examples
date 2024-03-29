package auth_api

# unit tests
test_anyone_can_get_cars {
	in = {
		"method": "GET",
		"path": ["cars"],
		"user": "guest"
	}
	allow with input as in
}

test_employee_can_get_cars {
	in = {
		"method": "GET",
		"path": ["cars"],
		"user": "alice"
	}
	allow with input as in
}

test_managers_can_create_cars {
	in = {
		"method": "POST",
		"path": ["cars"],
		"user": "charlie",
	}
	allow with input as in
}

test_salesperson_cannot_create_cars {
	in = {
		"method": "POST",
		"path": ["cars"],
		"user": "alice"
	}
	not allow with input as in
}

test_any_employee_can_get_car_by_id {
	in = {
		"method": "GET",
		"path": ["cars", 123],
		"user": "alice"
	}
	allow with input as in
}

test_public_user_cannot_get_car_by_id {
	in = {
		"method": "GET",
		"path": ["cars", 123],
		"user": "guest"
	}
	not allow with input as in
}

test_managers_can_update_cars {
	in = {
		"method": "PUT",
		"path": ["cars", 123],
		"user": "charlie"
	}
	allow with input as in
}

test_salesperson_cannot_update_cars {
	in = {
		"method": "PUT",
		"path": ["cars", 123],
		"user": "alice"
	}
	not allow with input as in
}

test_managers_can_delete_cars {
	in = {
		"method": "DELETE",
		"path": ["cars", 123],
		"user": "charlie"
	}
	allow with input as in
}

test_salesperson_cannot_delete_cars {
	in = {
		"method": "DELETE",
		"path": ["cars", 123],
		"user": "alice"
	}
	not allow with input as in
}

test_any_employee_can_get_car_status {
	in = {
		"method": "GET",
		"path": ["cars", 123, "status"],
		"user": "alice"
	}
	allow with input as in
}

test_public_user_cannot_get_car_status {
	in = {
		"method": "GET",
		"path": ["cars", 123, "status"],
		"user": "guest"
	}
	not allow with input as in
}

test_any_employee_can_add_car_status {
	in = {
		"method": "POST",
		"path": ["cars", 123, "status"],
		"user": "alice"
	}
	allow with input as in
}

test_public_user_cannot_add_car_status {
	in = {
		"method": "POST",
		"path": ["cars", 123, "status"],
		"user": "guest"
	}
	not allow with input as in
}
