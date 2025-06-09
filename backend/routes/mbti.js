// routes/mbti.js
const express = require('express');
const router = express.Router();

// 예시 데이터 (MBTI별 추천 장소)
const mbtiPlaces = {
  ENFP: [
    {
      title: '서울 시립 미술관',
      image: 'http://localhost:5000/images/seoul_museum.png',
      address: '서울 중구 덕수궁길 61'
    },
    {
      title: '텅플래닛',
      image: 'http://localhost:5000/images/tongueplanet.png',
      address: '서울 마포구 연남동 227-4'
    }
  ],
  INFP: [
    {
      title: '서점 리스본',
      image: 'http://localhost:5000/images/bookstore.png',
      address: '서울 마포구 성미산로 191'
    },
    {
      title: '정동길',
      image: 'http://localhost:5000/images/jungdonggil.png',
      address: '서울 중구 정동'
    }
  ],
  // ...다른 MBTI도 추가 가능
};

router.get('/', (req, res) => {
  const { type } = req.query;
  const upperType = type?.toUpperCase();

  if (!upperType || !mbtiPlaces[upperType]) {
    return res.status(400).json({ error: 'Invalid or missing MBTI type' });
  }

  return res.json(mbtiPlaces[upperType]);
});

module.exports = router;
