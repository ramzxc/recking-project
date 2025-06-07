const express = require("express");
const router = express.Router();
const pool = require("../db/pool");

// GET /posts
router.get("/", async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT 
        posts.id,
        posts.content,
        posts.location,
        posts.images,
        posts.created_at,
        users.username
      FROM posts
      JOIN users ON posts.user_id = users.id
      ORDER BY posts.created_at DESC
    `);

    res.json(result.rows);
  } catch (err) {
    console.error("Error fetching posts:", err);
    res.status(500).json({ error: "Failed to fetch posts" });
  }
});

module.exports = router;
