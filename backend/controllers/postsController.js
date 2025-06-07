const pool = require("../db");

// 전체 게시글 가져오기
exports.getAllPosts = async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM posts ORDER BY created_at DESC");
    res.json(result.rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("서버 에러");
  }
};

// 게시글 생성
exports.createPost = async (req, res) => {
  const { user_id, content, location, images } = req.body;

  try {
    const result = await pool.query(
      `INSERT INTO posts (user_id, content, location, images)
       VALUES ($1, $2, $3, $4) RETURNING *`,
      [user_id, content, location, images]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("게시글 생성 실패");
  }
};

// 게시글 상세 보기
exports.getPostById = async (req, res) => {
  const { id } = req.params;

  try {
    const result = await pool.query("SELECT * FROM posts WHERE id = $1", [id]);

    if (result.rows.length === 0) {
      return res.status(404).json({ message: "게시글을 찾을 수 없습니다." });
    }

    res.json(result.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("서버 에러");
  }
};

// 게시글 삭제
exports.deletePost = async (req, res) => {
  const { id } = req.params;

  try {
    await pool.query("DELETE FROM posts WHERE id = $1", [id]);
    res.json({ message: "삭제 완료" });
  } catch (err) {
    console.error(err.message);
    res.status(500).send("삭제 실패");
  }
};
