const { Pool } = require('pg')

const pool = new Pool({
    user:"postgres",
    host: "localhost",
    database: "sql_playgroud",
    password:"password",
    port: 5432,
})

pool.query("CREATE TABLE user(id INT, name VARCHAR(10))", (err,res) => {
    console.log(err, res)
})

pool.query("CREATE TABLE product (id INT, name VARCHAR(20), description VARCHAR(255), code INT)", (err,res) => {
    console.log(err, res)
})


module.exports = pool