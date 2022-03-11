Rails.application.routes.draw do

  post 'login_student', to: "authentication#authenticate"
  post 'student_logout', to: "authentication#logout"

  post 'login_teacher', to: "authenticate_teacher#authenticate"
  post 'teacher_logout', to: "authenticate_teacher#logout"

  resource :students
  resource :teachers
  resource :lessons 
  resource :schedules
  resource :bookes


  get 'lessons/index', to: 'lessons#index'
  get 'lessons/show/:id', to: 'lessons#show'
 
  get 'timelines/index', to: 'timelines#index'
  get 'timelines/show/:id', to: 'timelines#show'


  get 'schedules/index', to: 'schedules#index'
  get 'schedules/show/:id', to: 'schedules#show'


  get 'bookes/index', to: 'bookes#index'
  get 'bookes/show/:id', to: 'bookes#show'

  # resource :timelines, only: [:create, :index]
  # get 'timelines/:id', 'timelines#show'   
  # get 'timelines/index', 'timelines#index' 

  # post "/login", to: "students#login"
  # get "/auto_login", to: "students#auto_login"
end
