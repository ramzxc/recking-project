-- posts 더미 데이터
INSERT INTO posts (user_id, content, location, images)
VALUES
  (1, '오늘 성수 놀러갔다가 사진 많이 찍었어요!', '성수동', ARRAY['https://picsum.photos/200', 'https://picsum.photos/300']),
  (2, '레드버튼 진짜 재밌음 ㄹㅇ', '서울 성동구', ARRAY['https://picsum.photos/201']),
  (3, '카페 투어 하다가 좋은 데 찾았음!', '서울 중구', ARRAY[]::text[]);