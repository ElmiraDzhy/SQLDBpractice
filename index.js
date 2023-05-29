const {getUsers} = require('./api/getUsers');
const {User, client} = require('./models');

async function connection () {
// make connection to db
    await client.connect();
    //
    const users = await getUsers();
    // all users
    const res = await User.bulkCreate(users);
    //
    // close connection
    await client.end();
}

connection();

// const users = [
//     {
//         firstName: 'Harry',
//         lastName: 'Potter',
//         email: 'potternew@gmail.com',
//         birthday: '2007-08-08',
//         isSubscribe: false,
//     }, {
//         firstName: 'Ron',
//         lastName: 'Uizli',
//         email: 'uizli@gmail.com',
//         birthday: '2007-08-08',
//         isSubscribe: false,
//     }, {
//         firstName: 'Germoina',
//         lastName: 'Granger',
//         email: 'granger@gmail.com',
//         birthday: '2007-08-08',
//         isSubscribe: false,
//     }, {
//         firstName: 'Drako',
//         lastName: 'Malfoy',
//         email: 'malfoy@gmail.com',
//         birthday: '2007-08-08',
//         isSubscribe: false,
//     },
//
// ]


