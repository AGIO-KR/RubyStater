# Seed sample Todos
Todo.find_or_create_by!(title: "Rails 8 앱에 TailwindCSS 적용하기") do |t|
  t.content = "tailwindcss-rails 젬을 이용하여 다크 모드 미니멀 UI를 완성했습니다."
  t.completed = true
  t.priority = :high
  t.due_date = Date.today
end

Todo.find_or_create_by!(title: "Hotwire Turbo를 활용한 실시간 할 일 기능 개발") do |t|
  t.content = "페이지 전체 새로고침 없이 완료 체크박스와 통계 카드가 즉시 반영되는 기능 구현."
  t.completed = false
  t.priority = :high
  t.due_date = Date.tomorrow
end

Todo.find_or_create_by!(title: "주간 일정 및 목표 검토") do |t|
  t.content = "이번 주 달성할 할 일 목록을 작성하고 진행률을 점검하세요."
  t.completed = false
  t.priority = :medium
  t.due_date = Date.today + 3.days
end

Todo.find_or_create_by!(title: "팀원들과 코드 리뷰 진행") do |t|
  t.content = "새롭게 업데이트된 할 일 모듈의 디자인 시스템과 콤포넌트 리뷰"
  t.completed = false
  t.priority = :low
  t.due_date = Date.today + 5.days
end
