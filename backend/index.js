const express = require("express");
const cors = require("cors");
const path = require("path"); // ✅ 추가
const pool = require("./db/pool");
const activityRoutes = require("./routes/activities");
const userRoutes = require("./routes/users");
const favoriteRoutes = require("./routes/favorites");
const postRoutes = require("./routes/posts"); 
const todayRoutes = require("./routes/today");
const courseRoutes = require('./routes/courses'); 

require("dotenv").config();

const app = express();
app.use(cors());
app.use(express.json());

// ✅ 정적 이미지 경로 설정
app.use("/images", express.static(path.join(__dirname, "public/images")));

// 라우트 설정
app.use("/activities", activityRoutes);
app.use("/users", userRoutes);
app.use("/favorites", favoriteRoutes);
app.use("/posts", postRoutes); 
app.use("/today", todayRoutes); 
app.use('/courses', courseRoutes);  

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
