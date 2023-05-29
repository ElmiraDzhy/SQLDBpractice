function mapUsers (userArray) {
    return userArray.map(({
        gender,
        name: {first, last},
        email,
        dob: {date}
    }) => `('${first}', '${last}', '${email}', '${date}',${Math.random() > 0.5}, '${gender}')`).join(',');
}


module.exports.mapUsers = mapUsers;