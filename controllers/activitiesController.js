const pool = require("../db/pool");

// GET all activities
exports.getAllActivities = async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM activities ORDER BY created_at DESC");
    res.json(result.rows);
  } catch (err) {
    console.error("Error fetching activities:", err);
    res.status(500).json({ error: "Server error" });
  }
};

// GET one activity by ID
exports.getActivityById = async (req, res) => {
  const id = req.params.id;
  try {
    const result = await pool.query("SELECT * FROM activities WHERE id = $1", [id]);
    if (result.rows.length === 0) return res.status(404).json({ error: "Activity not found" });
    res.json(result.rows[0]);
  } catch (err) {
    console.error("Error fetching activity:", err);
    res.status(500).json({ error: "Server error" });
  }
};

// CREATE new activity
exports.createActivity = async (req, res) => {
  const { title, description, latitude, longitude, address, created_by } = req.body;
  try {
    const result = await pool.query(
      `INSERT INTO activities (title, description, latitude, longitude, address, created_by)
       VALUES ($1, $2, $3, $4, $5, $6)
       RETURNING *`,
      [title, description, latitude, longitude, address, created_by]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error("Error creating activity:", err);
    res.status(500).json({ error: "Server error" });
  }
};

// UPDATE activity
exports.updateActivity = async (req, res) => {
  const id = req.params.id;
  const { title, description, latitude, longitude, address } = req.body;
  try {
    const result = await pool.query(
      `UPDATE activities
       SET title = $1, description = $2, latitude = $3, longitude = $4, address = $5, updated_at = NOW()
       WHERE id = $6 RETURNING *`,
      [title, description, latitude, longitude, address, id]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: "Activity not found" });
    res.json(result.rows[0]);
  } catch (err) {
    console.error("Error updating activity:", err);
    res.status(500).json({ error: "Server error" });
  }
};

// DELETE activity
exports.deleteActivity = async (req, res) => {
  const id = req.params.id;
  try {
    const result = await pool.query("DELETE FROM activities WHERE id = $1 RETURNING *", [id]);
    if (result.rows.length === 0) return res.status(404).json({ error: "Activity not found" });
    res.json({ success: true });
  } catch (err) {
    console.error("Error deleting activity:", err);
    res.status(500).json({ error: "Server error" });
  }
};
