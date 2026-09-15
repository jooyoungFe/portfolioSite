Rails.application.routes.draw do
  root "pages#home"

  get "/profile", to: "pages#profile", as: :profile
  get "/career", to: "pages#career", as: :career
  get "/skills", to: "pages#skills", as: :skills

  resource :admin_session, only: %i[create destroy]
  resources :projects, only: %i[index create destroy]
end
