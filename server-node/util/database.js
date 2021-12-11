const {Sequelize} = require('sequelize');

const sequelize = new Sequelize('hr', 'root', 'ma00amma', {
    host: 'localhost',
    dialect: 'mysql'
});

try {
    sequelize.authenticate().then(r => console.log('Connection has been established successfully.'));
} catch (error) {
    console.error('Unable to connect to the database:', error);
}

module.exports = sequelize;
