SELECT Users.id, Users.Email
FROM Orders
INNER JOIN Users ON Orders.user_id=Users.id;
