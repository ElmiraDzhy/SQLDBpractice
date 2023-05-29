const {Client} = require('pg');

const config = {
    host: '127.0.0.1',
    port: '5432',
    password: '3101',
    database: 'test',
    user: 'postgres',
};
const client = new Client(config);

async function connection () {
    // make connection to db
    await client.connect();
    //

    const res = await client.query(`INSERT INTO users (first_name, last_name, email, birthday, is_subscribe)
                                    VALUES ('${user.firstName}', '${user.lastName}', '${user.email}', '${user.birthday}',
                                            ${user.isSubscribe})`); // instance of Result // Result.rows - array with
                                                                    // all users
    console.log(res);
    //


    // close connection
    await client.end();
}

connection();

const user = {
    firstName: 'Harry',
    lastName: 'Potter',
    email: 'potter@gmail.com',
    birthday: '2007-08-08',
    isSubscribe: false
};


