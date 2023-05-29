class Phone {
    static _client;
    static _tableName;

    static async findAll () {
        return this._client.query(`SELECT *
                                   FROM ${this._tableName}`);
    }

    static async bulkCreate (phones) {
        const valueStr = phones.map(({
            brand,
            model,
            price,
            quantity,
            category
        }) => `('${brand}', '${model}', ${price}, ${quantity}, '${category}')`).join(',');
        return this._client.query(`INSERT INTO ${this._tableName} (brand, model, price, quantity, category) VALUES ${valueStr} RETURNING *`);


    }
}

module.exports = Phone;