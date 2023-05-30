const {mapUsers} = require("../utils/mapUser");
const _ = require('lodash');
const {getRandomHeight} = require('../utils/randomHeight');


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

    static async updateHeight(){
        // const {rows: usersID} = this._client.query(`SELECT id FROM users`);

        await this._client.query(`UPDATE ${this._tableName} SET height = ${getRandomHeight()} WHERE gender = 'male'`);
    }
}

module.exports = User;