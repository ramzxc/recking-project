const express = require("express");
const cors = require("cors");
const pool = require("./db/pool");
const activityRoutes = require("./routes/activities");
const userRoutes = require("./routes/users");
const favoriteRoutes = require("./routes/favorites");
const postRoutes = require("./routes/posts"); 

require("dotenv").config();

const app = express();
app.use(cors());
app.use(express.json());

app.use("/activities", activityRoutes);
app.use("/users", userRoutes);
app.use("/favorites", favoriteRoutes);
app.use("/posts", postRoutes); 

app.get("/", async (req, res) => {
  try {
    const result = await pool.query("SELECT NOW()");
    res.json(result.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server Error");
  }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
