const {Client} = require('pg');
const {mapUsers} = require('./sandbox');
const config = {
    host: '127.0.0.1', port: '5432', password: '3101', database: 'test', user: 'postgres',
};
const client = new Client(config);

async function connection () {
    // make connection to db
    await client.connect();
    //

    const res = await client.query(`INSERT INTO users (first_name, last_name, email, birthday, is_subscribe)
    VALUES
    ${mapUsers(users)}`); // instance of Result // Result.rows - array with
    // all users
    console.log(res);
    //


    // close connection
    await client.end();
}

connection();

const users = [
    {
        firstName: 'Harry',
        lastName: 'Potter',
        email: 'potternew@gmail.com',
        birthday: '2007-08-08',
        isSubscribe: false,
    }, {
        firstName: 'Ron',
        lastName: 'Uizli',
        email: 'uizli@gmail.com',
        birthday: '2007-08-08',
        isSubscribe: false,
    }, {
        firstName: 'Germoina',
        lastName: 'Granger',
        email: 'granger@gmail.com',
        birthday: '2007-08-08',
        isSubscribe: false,
    }, {
        firstName: 'Drako',
        lastName: 'Malfoy',
        email: 'malfoy@gmail.com',
        birthday: '2007-08-08',
        isSubscribe: false,
    },

]


