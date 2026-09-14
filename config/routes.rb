Rails.application.routes.draw do
  root "pages#home"

  get "/profile", to: "pages#profile", as: :profile
  get "/career", to: "pages#career", as: :career
  get "/skills", to: "pages#skills", as: :skills

  resources :projects, only: %i[index create destroy]
end
