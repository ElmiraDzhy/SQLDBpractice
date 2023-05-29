const API_BASE = 'https://randomuser.me/api/';

module.exports.getUsers = async () => {
    const response = await fetch(`${API_BASE}?results=500&seed=name&page=2`);
    const {results} = await response.json();
    return results;
}