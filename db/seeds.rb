# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
auth_project = Project.find_or_initialize_by(title: "인증 시스템 웹")
auth_project.update!(
  description: <<~TEXT.strip,
    팀로그 웹 동아리에서 진행한 사용자 인증 시스템 프로젝트입니다.
    백엔드 개발자로 참여해 사용자 데이터 처리, 인증 흐름과 서버 기능을 구현했습니다.
  TEXT
  tech_stack: "Ruby, Ruby on Rails, SQLite, JavaScript"
)
