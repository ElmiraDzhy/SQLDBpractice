const {mapUsers} = require("../utils/mapUser");

class User {
    static _client;
    static _tableName;

    static findAll () {
        return this._client.query(`SELECT *
                                   FROM ${this._tableName}`);
    }

    static bulkCreate (users) {
        return this._client.query(`INSERT INTO users (first_name, last_name, email, birthday, is_subscribe, gender)
        VALUES
        ${mapUsers(users)}`);
    }
}

module.exports = User;