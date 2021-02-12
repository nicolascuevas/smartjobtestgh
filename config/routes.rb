Rails.application.routes.draw do

  resources :applicant_tests
  resources :applicants
  get "applicant_info/:token", to: 'applicants#show_by_token', as: "show_applicant_by_token"
  get "applicant_info/:token/quiz/:applicant_test_id", to: 'applicant_tests#show_test_by_applicant_token', as: "show_test_by_applicant_token"


  resources :quizzes do
  	resources :quiz_pages do
  		resources :questions
  	end
  end
  devise_for :users, :controllers => { registrations: 'users/registrations',sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'examples#index'

  resources :examples, only: :index do
    get :buttons, :cards, :utilities_color, :utilities_border,
        :utilities_animation, :utilities_other, :login, :register,
        :forgot_password, :page_404, :blank, :charts, :tables,
        on: :collection
  end
end
