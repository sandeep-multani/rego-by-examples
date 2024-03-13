package rules_test

# unit tests
anyone_can_get_cars {
	in = {
		"method": "GET",
		"path": ["cars"],
		"user": "guest",
	}
	allow == true with input as in
}

employee_can_get_cars {
	in = {
		"method": "GET",
		"path": ["cars"],
		"user": "alice",
	}
	allow == true with input as in
}

managers_can_create_cars {
	in = {
		"method": "POST",
		"path": ["cars"],
		"user": "charlie",
	}
	allow == true with input as in
}

salesperson_cannot_create_cars {
	in = {
		"method": "POST",
		"path": ["cars"],
		"user": "alice",
	}
	allow == false with input as in
}

any_employee_can_get_car_by_id {
	in = {
		"method": "GET",
		"path": ["cars", 123],
		"user": "alice",
	}
	allow == true with input as in
}

public_user_cannot_get_car_by_id {
	in = {
		"method": "GET",
		"path": ["cars", 123],
		"user": "guest",
	}
	allow == false with input as in
}

managers_can_update_cars {
	in = {
		"method": "PUT",
		"path": ["cars", 123],
		"user": "charlie",
	}
	allow == true with input as in
}

salesperson_cannot_update_cars {
	in = {
		"method": "PUT",
		"path": ["cars", 123],
		"user": "alice",
	}
	allow == false with input as in
}

managers_can_delete_cars {
	in = {
		"method": "DELETE",
		"path": ["cars", 123],
		"user": "charlie",
	}
	allow == true with input as in
}

salesperson_cannot_delete_cars {
	in = {
		"method": "DELETE",
		"path": ["cars", 123],
		"user": "alice",
	}
	allow == false with input as in
}

any_employee_can_get_car_status {
	in = {
		"method": "GET",
		"path": ["cars", 123, "status"],
		"user": "alice",
	}
	allow == true with input as in
}

public_user_cannot_get_car_status {
	in = {
		"method": "GET",
		"path": ["cars", 123, "status"],
		"user": "guest",
	}
	allow == false with input as in
}

any_employee_can_add_car_status {
	in = {
		"method": "POST",
		"path": ["cars", 123, "status"],
		"user": "alice",
	}
	allow == true with input as in
}

public_user_cannot_add_car_status {
	in = {
		"method": "POST",
		"path": ["cars", 123, "status"],
		"user": "guest",
	}
	allow == false with input as in
}
