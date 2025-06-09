# 🏠 Recking Project

**테크노경영 - 유희왕 앱 (Recking)의 백엔드 및 프론트엔드 프로젝트입니다.**

---

## 📁 프로젝트 구조

```
Recking/
├── backend/        # Node.js + Express 백엔드 서버
│   ├── routes/
│   ├── controllers/
│   ├── setup/schema.sql
│   ├── pool.js
│   ├── index.js
│   └── .env.example
├── frontend/       # Flutter 커뮤니티 앱 (웹)
│   ├── lib/
│   │   ├── models/post.dart
│   │   ├── services/api_service.dart
│   │   └── main.dart
│   └── pubspec.yaml
└── README.md
```

---

## 🛠 백엔드 설정 방법 (Node.js + PostgreSQL)

### 1️⃣ PostgreSQL 설치 및 DB 생성
```bash
createdb recking
```

### 2️⃣ `.env` 파일 만들기 (예시: `backend/.env`)
```env
DB_USER=postgres
DB_HOST=localhost
DB_NAME=recking
DB_PASSWORD=your_password
DB_PORT=5432
PORT=5000
```

### 3️⃣ 의존성 설치 및 서버 실행
```bash
cd backend
npm install
node index.js
```

### 4️⃣ 데이터베이스 테이블 생성
```bash
psql -U postgres -d recking -f setup/schema.sql
```
(선택) 더미 데이터 입력
```bash
psql -U postgres -d recking -f setup/seed.sql
```
schema.sql과 seed.sql은 같은 데이터베이스에 적용해야 합니다.

---

## 💬 프론트엔드 설정 방법 (Flutter Web)

### 1️⃣ Flutter SDK 설치  
- https://docs.flutter.dev/get-started/install 참고  
- Flutter 3.32.2 이상 권장

### 2️⃣ 의존성 설치
```bash
cd frontend
flutter pub get
```

### 3️⃣ 앱 실행 (웹)
```bash
flutter run -d chrome --web-port=5173
```

> ⚠️ 에러 발생 시 `flutter doctor`로 개발 환경 점검하세요.

---

## ✅ API 예시

| Method | Endpoint         | Description           |
|--------|------------------|-----------------------|
| GET    | `/posts`         | 커뮤니티 게시글 불러오기 |
| POST   | `/posts`         | 게시글 생성 (추후 구현) |

---

## 🧪 개발 시 유의사항

- 커밋 메시지는 `[백엔드]`, `[프론트엔드]` 접두사 사용
- Flutter 앱에서 API URL은 `localhost:5000`을 기준으로 설정되어 있습니다. 배포 시 수정 필요

---

## 🧾 참고자료

- [Flutter 공식 문서](https://docs.flutter.dev/)
- [PostgreSQL 공식 문서](https://www.postgresql.org/docs/)
- [Node.js Express 공식 문서](https://expressjs.com/)

# community_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

