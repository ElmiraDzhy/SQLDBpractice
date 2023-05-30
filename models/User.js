const {mapUsers} = require("../utils/mapUser");

class User {
    static _client;
    static _tableName;

    static async findAll () {
        return  this._client.query(`SELECT *
                                   FROM ${this._tableName} WHERE id < 5`);
    }

    static async bulkCreate (users) {
        return  this._client.query(`INSERT INTO ${this._tableName} (first_name, last_name, email, birthday, is_subscribe, gender) VALUES
        ${mapUsers(users)}`);
    }
}

module.exports = User;