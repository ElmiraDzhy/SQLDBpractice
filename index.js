const {getUsers} = require('./api/getUsers');
const {User, client, Phone, Order} = require('./models');
const {generatePhones} = require('./utils/generateProducts');


async function connection () {
    // make connection to db
    await client.connect();

    const userArray = await getUsers();
    const {rows: users} = await User.bulkCreate(userArray);
    const {rows: phones} = await Phone.bulkCreate(generatePhones());
    const {rows: orders} = await Order.bulkCreate(users, phones);
    // close connection
    await client.end();
}

connection();




