const express = require('express');
const router = express.Router();

// 임시 코스 추천 데이터
const courseList = [
  {
    image: "http://localhost:5000/images/inside.jpeg",
    title: "실내 놀거리"
  },
  {
    image: "http://localhost:5000/images/walk.jpeg",
    title: "성수 산책"
  },
  {
    image: "http://localhost:5000/images/cafe.jpg",
    title: "카페 투어"
  }
];

// GET /courses
router.get('/', (req, res) => {
  res.json(courseList);
});

module.exports = router;
