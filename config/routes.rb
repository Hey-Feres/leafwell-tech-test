require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do  
  mount Sidekiq::Web, at: '/sidekiq'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  namespace :onboarding do
    get '/user_info/form', to: 'user_info#form', as: :user_info_form
    get '/user_conditions/form', to: 'user_conditions#form', as: :user_conditions_form
    get '/user_symptoms/form', to: 'user_symptoms#form', as: :user_symptoms_form
    get '/conditions_related_questions_answers/form', to: 'conditions_related_questions_answers#form', as: :conditions_related_questions_answers_form
    get '/symptoms_related_questions_answers/form', to: 'symptoms_related_questions_answers#form', as: :symptoms_related_questions_answers_form

    post '/user_info/save', to: 'user_info#save', as: :user_info
    post '/user_conditions/save', to: 'user_conditions#save', as: :user_conditions
    post '/user_symptoms/save', to: 'user_symptoms#save', as: :user_symptoms
    post '/condition_related_questions_answers/save', to: 'conditions_related_questions_answers#save', as: :condition_related_questions_answers
    post '/symptoms_related_questions_answers/save', to: 'symptoms_related_questions_answers#save', as: :symptoms_related_questions_answers
  end

  get '/onboarding', to: 'onboarding#index'
  get '/onboarding_finished', to: 'onboarding#finished'

  get '/my_answers', to: 'related_question_answers#index'

  root 'home#index'
end
