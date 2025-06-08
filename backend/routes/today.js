const express = require('express');
const router = express.Router();

// 임시 todayList 데이터
const todayList = [
  {
    image: "http://localhost:5000/images/dior.jpg",
    title: "크리스챤 디올 성수",
    subtitle: "성동구",
    rating: "4.5"
  },
  {
    image: "http://localhost:5000/images/DR.jpg",
    title: "대림창고 갤러리",
    subtitle: "성동구",
    rating: "4.1"
  },
  {
    image: "http://localhost:5000/images/onion.jpeg",
    title: "어니언 성수",
    subtitle: "성동구",
    rating: "4.3"
  }
];

// GET /today
router.get('/', (req, res) => {
  res.json(todayList);
});

module.exports = router;
