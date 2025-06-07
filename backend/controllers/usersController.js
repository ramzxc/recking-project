const pool = require("../db/pool");

exports.getAllUsers = async (req, res) => {
  try {
    const result = await pool.query("SELECT id, email, username FROM users");
    res.json(result.rows);
  } catch (err) {
    console.error("Error fetching users:", err);
    res.status(500).json({ error: "Server error" });
  }
};

exports.getUserById = async (req, res) => {
  const id = req.params.id;
  try {
    const result = await pool.query("SELECT id, email, username FROM users WHERE id = $1", [id]);
    if (result.rows.length === 0) return res.status(404).json({ error: "User not found" });
    res.json(result.rows[0]);
  } catch (err) {
    console.error("Error fetching user:", err);
    res.status(500).json({ error: "Server error" });
  }
};

exports.createUser = async (req, res) => {
  const { email, username, password_hash } = req.body;
  try {
    const result = await pool.query(
      `INSERT INTO users (email, username, password_hash)
       VALUES ($1, $2, $3) RETURNING id, email, username`,
      [email, username, password_hash]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error("Error creating user:", err);
    res.status(500).json({ error: "Server error" });
  }
};

exports.updateUser = async (req, res) => {
  const id = req.params.id;
  const { email, username } = req.body;
  try {
    const result = await pool.query(
      `UPDATE users SET email = $1, username = $2, updated_at = NOW()
       WHERE id = $3 RETURNING id, email, username`,
      [email, username, id]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: "User not found" });
    res.json(result.rows[0]);
  } catch (err) {
    console.error("Error updating user:", err);
    res.status(500).json({ error: "Server error" });
  }
};

exports.deleteUser = async (req, res) => {
  const id = req.params.id;
  try {
    const result = await pool.query("DELETE FROM users WHERE id = $1 RETURNING *", [id]);
    if (result.rows.length === 0) return res.status(404).json({ error: "User not found" });
    res.json({ success: true });
  } catch (err) {
    console.error("Error deleting user:", err);
    res.status(500).json({ error: "Server error" });
  }
};

