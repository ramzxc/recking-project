-- 1. users ���̺� 
INSERT INTO users (id, email, password_hash, username)
VALUES 
  (1, 'user1@example.com', 'hashed_pw_1', 'user1'),
  (2, 'user2@example.com', 'hashed_pw_2', 'user2');

-- 2.  posts ���̺�
INSERT INTO posts (user_id, content, location, images)
VALUES
  (1, '���� ���� ����ٰ� ���� ���� ������!', '������', ARRAY['https://picsum.photos/200', 'https://picsum.photos/300']),
  (2, '�����ư ��¥ ����� ����', '���� ������', ARRAY['https://picsum.photos/201']),
  (1, 'ī�� ���� �ϴٰ� ���� �� ã����!', '���� �߱�', ARRAY[]::text[]);