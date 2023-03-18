// https://www.mongodb.com/docs/manual/reference/method/js-user-management/

db.createUser({
    user: "readWriteUser",
    pwd: passwordPrompt(),
    roles: [{ role: "readWrite", db: "test" }],
});

db.createUser({
    user: "backupUser",
    pwd: passwordPrompt(),
    roles: [
        { role: "backup", db: "test" },
        { role: "restore", db: "test" },
    ],
});

db.dropUser("exampleUser", { w: "majority", wtimeout: 5000 });

db.changeUserPassword("username", passwordPrompt());

db.getUsers({});
