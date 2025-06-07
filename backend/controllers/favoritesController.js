const pool = require("../db/pool");

// GET favorites for a user
exports.getFavoritesByUser = async (req, res) => {
  const userId = req.params.userId;
  try {
    const result = await pool.query(
      `SELECT a.*
       FROM favorites f
       JOIN activities a ON f.activity_id = a.id
       WHERE f.user_id = $1`,
      [userId]
    );
    res.json(result.rows);
  } catch (err) {
    console.error("Error fetching favorites:", err);
    res.status(500).json({ error: "Server error" });
  }
};

// POST - add favorite
exports.addFavorite = async (req, res) => {
  const { user_id, activity_id } = req.body;
  try {
    await pool.query(
      `INSERT INTO favorites (user_id, activity_id)
       VALUES ($1, $2) ON CONFLICT DO NOTHING`,
      [user_id, activity_id]
    );
    res.status(201).json({ success: true });
  } catch (err) {
    console.error("Error adding favorite:", err);
    res.status(500).json({ error: "Server error" });
  }
};

// DELETE - remove favorite
exports.removeFavorite = async (req, res) => {
  const { user_id, activity_id } = req.body;
  try {
    await pool.query(
      `DELETE FROM favorites WHERE user_id = $1 AND activity_id = $2`,
      [user_id, activity_id]
    );
    res.json({ success: true });
  } catch (err) {
    console.error("Error removing favorite:", err);
    res.status(500).json({ error: "Server error" });
  }
};
