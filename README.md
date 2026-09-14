# Career Portfolio - Ruby on Rails

학생 진로 포트폴리오용 Rails 소스입니다.

## 구성

- 홈
- 인적사항: 나의 소개, 강점, 흥미·가치관
- 진로활동: 관심 분야, 관심 직업·학과, 진로 탐색 기록
- 주요활동 및 스킬: 동아리 활동, 사용 가능 기술
- 프로젝트: 프로젝트 설명 + 여러 파일 직접 업로드/다운로드/삭제
- 스타일: SCSS(Dart Sass)
- 파일 저장: Rails Active Storage, 개발 환경 Local Disk

## 기준 버전

- Ruby 3.2 이상
- Rails 8.1.3.1
- SQLite

## 새 프로젝트에 적용

먼저 Rails 앱을 생성합니다.

```bash
gem install bundler
gem install rails -v 8.1.3.1
rails _8.1.3.1_ new career_portfolio -d sqlite3
cd career_portfolio
```

SCSS와 Active Storage를 설치합니다.

```bash
bundle add dartsass-rails
bin/rails dartsass:install
bin/rails active_storage:install
```

그 다음 이 압축 파일의 `app`, `config`, `db/migrate`, `Procfile.dev` 내용을 생성한 Rails 프로젝트에 덮어씁니다.
`Gemfile`은 전체 예시이므로 그대로 사용하거나 현재 Gemfile에 `dartsass-rails`만 추가해도 됩니다.

DB를 생성합니다.

```bash
bin/rails db:create
bin/rails db:migrate
```

실행합니다.

```bash
bin/dev
```

`bin/dev`가 없는 환경이면 두 터미널에서 각각 실행할 수 있습니다.

```bash
bin/rails server
bin/rails dartsass:watch
```

접속 주소는 기본적으로 `http://localhost:3000` 입니다.

## 수정할 부분

아래 파일의 대괄호 내용을 본인 정보로 바꾸면 됩니다.

- `app/views/pages/home.html.erb`
- `app/views/pages/profile.html.erb`
- `app/views/pages/career.html.erb`
- `app/views/pages/skills.html.erb`

## 업로드 동작

`Project` 모델이 `has_many_attached :files`를 사용합니다.
한 프로젝트에 최대 5개, 파일당 최대 20MB로 제한했습니다.
개발 환경 파일은 Rails의 `storage/` 아래에 저장됩니다.

공개 서버에 배포할 경우에는 로그인/관리자 인증을 추가하는 편이 안전합니다. 현재 구조는 포트폴리오 과제 및 로컬 데모를 기준으로 해서 누구나 프로젝트 등록과 삭제를 할 수 있습니다.
