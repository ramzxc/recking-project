# 🏠 Recking Project - 백엔드

**테크노경영 - 유희왕 앱의 백엔드 서버입니다.**

이 서버는 Node.js, Express, PostgreSQL 기반으로 구성되어 있습니다.

---

## 🛠 로컬 개발 환경 설정 방법

### 1️⃣ PostgreSQL 설치 및 DB 생성 
- PostgreSQL을 설치합니다.
- 아래 명령어로 새 데이터베이스를 생성합니다:

```bash
createdb recking
```
### 2️⃣ .env 파일 만들기
루트 디렉토리에 .env 파일을 만들고 아래 내용을 복붙붙
```env
DATABASE_URL=postgres://your_user:your_password@localhost:5432/recking
PORT=5000
```

### 3️⃣ 의존성 설치 및 서버 실행
```bash
npm install
node index.js
```

### 4️⃣ 데이터베이스 테이블 생성
```bash
psql -U postgres -d recking -f setup/schema.sql
```

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

