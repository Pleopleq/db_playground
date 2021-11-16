const express = require("express");
const cors = require('cors');

const db = require("./db");
const Product = require('./Product.model')

const app = express();
const PORT = process.env.PORT || 3030;

app.use(express.urlencoded({ extended: false }))
app.use(express.json())
app.use(cors("*"));

//Database Connection
db.authenticate().then(() => {
    console.log('Database connected...');
}).catch(err => {
    console.log('Error: ' + err);
})


app.get("/products", (req,res) => {
  Product.findAll().
  then((data) => {
    res.send(data);
  })
  .catch((error) => {
    console.log(error);
  }); 
})

app.post("/products", (req,res) => {
  var newItem = new Product(req.body);
  newItem.save()
    .then((data) => {
      res.send(data)
    })
    .catch((error) => {
      console.log(error)
    })
})

db.sync().then(() => {
    app.listen(PORT, console.log(`Server started on port ${PORT}`));
}).catch(err => console.log("Error: " + err));

