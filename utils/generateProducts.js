const _ = require('lodash');

const PHONES_BRANDS = [
    'Samsung',
    'Iphone',
    'Nokia',
    'Siemens',
    'Sony',
    'Alcatel',
    'Xiaomi',
    'Realme'
];

const getPhone = key => ({
    brand: PHONES_BRANDS[_.random(0, PHONES_BRANDS.length-1, false)],
    model: `model ${key}`,
    quantity: _.random(10, 1500, false),
    price: _.random(200, 15000, false),
    category: 'phones',
})

module.exports.generatePhones = (length = 50) => new Array(length).fill(null).map((el, i) => getPhone(i));
