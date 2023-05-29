const {Client} = require('pg');
const User = require('./User');
const {config} = require('../config');

const client = new Client(config);



User._client = client;
User._tableName = 'users';

module.exports = {
    client,
    User
}