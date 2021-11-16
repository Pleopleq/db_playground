const express = require("express");
const pool = require("./db");
const app = express();

app.get("/tables", async (req, res) => {
  try {
    const tables = await pool.query("SELECT * FROM usertest");
    pool.end();
    res.send(tables);
  } catch (error) {
    console.log(error);
  }
});

app.listen(3000, () => {
  console.log("Server running on port 3000");
});
