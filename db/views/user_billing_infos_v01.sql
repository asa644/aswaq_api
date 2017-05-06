SELECT Users.id, Users.email
FROM billing_infos
INNER JOIN Users ON billing_infos.user_id=Users.id;
