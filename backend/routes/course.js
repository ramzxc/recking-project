// routes/course.js
const express = require('express');
const router = express.Router();

const courseDetails = {
  '1': [
    {
      name: '서울숲',
      address: '서울 성동구 뚝섬로 273',
      lat: 37.5430701468405,
      lng: 127.041799099222,
    },
    {
      name: '베이크모굴',
      address: '서울 성동구 서울숲2길 17',
      lat: 37.547258592253,
      lng: 127.040591973409,
    },
    {
      name: '낫저스트북스',
      address: '서울 성동구 서울숲길 44 3층',
      lat: 37.5479160673506,
      lng: 127.042341587571,
    },
    {
      name: '라라바스켓',
      address: '서울 성동구 서울숲길 55 1층',
      lat: 37.5481977888203,
      lng: 127.043636211495,
    },
  ],
};

// GET /course/:id
router.get('/:id', (req, res) => {
  const courseId = req.params.id;
  const data = courseDetails[courseId];

  if (data) {
    // 응답을 Flutter 모델에 맞춰 가공
    const formatted = data.map(place => ({
      title: place.name,
      address: place.address,
      lat: place.lat,
      lng: place.lng,
      image: '', // 이미지 없을 경우 빈 문자열로 전달
    }));
    res.json(formatted);
  } else {
    res.status(404).json({ error: 'Course not found' });
  }
});

module.exports = router;
