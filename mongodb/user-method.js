// https://www.mongodb.com/docs/manual/reference/method/js-user-management/

roles = [
    { role: "root", db: "admin" },
    { role: "readWrite", db: "test" },
    { role: "backup", db: "test" },
    { role: "restore", db: "test" },
];

db.createUser({
    user: "backupUser",
    pwd: passwordPrompt(),
    roles: [{ role: "backup", db: "test" }],
});

db.dropUser("exampleUser", { w: "majority", wtimeout: 5000 });

db.changeUserPassword("username", passwordPrompt());

db.getUsers({});
db.getUser("username");
