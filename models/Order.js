const _ = require('lodash');

class Order {
    static _client;

    static async bulkCreate (users, phones) {

        const orderValueStr = users.map(u =>
            new Array(_.random(1, 4, false))
                .fill(null)
                .map(() => `(${u.id})`)
                .join(','))
            .join(',');

        const {rows: orders} = await this._client.query(`INSERT INTO orders (customer_id)
                                                         VALUES ${orderValueStr} RETURNING id`);
        // const {rows: orders} = await this._client.query(`SELECT * FROM orders`);
        const phonesToOrdersValueStr = orders.map(
            o => {
                const arr = new Array(_.random(1, 4, false))
                    .fill(null)
                    .map(() => phones[_.random(0, phones.length - 1, false)]);
                return [...new Set(arr)]
                    .map(p => `(${p.id}, ${o.id}, ${_.random(1, 4, false)})`)
                    .join(',');
            }
        ).join(',');

        return this._client.query(`INSERT INTO products_to_orders (product_id, order_id, quantity)
                                   VALUES ${phonesToOrdersValueStr};`)

    }
}

module.exports = Order;