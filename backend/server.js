// backend/server.js
const express = require('express');
const mysql = require('mysql');
const dotenv = require('dotenv');
const cors = require('cors')

// Env config 
dotenv.config();
const port = process.env.PORT || 3001;

const app = express(); 
app.use(express.json())

// CORS config 
app.use(
  cors({
    origin: `*`,
    methods: ['GET', 'POST'], 
  })
)

// Home route 
app.get("/", async(req, res) => {
  res.status(200).json({
    message: `Server started at: ${process.env.PORT}`
  })
})

// Other routes 
// app.use("/product", productRoutes)

// Database config 
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

// Database connection check and starting the sevrer 
db.connect((err) => {
  if(err) {
    console.error(`Error connecting to MySQL: ${err}`);
    process.exit(1);
  } else {
    console.log("MySQL is connected!!");
    app.listen(port, async() => {
      console.log(`Server is running on port: ${port}`);
    })
  }
}); 
