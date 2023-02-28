require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do  
  mount Sidekiq::Web, at: '/sidekiq'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  get '/onboarding', to: 'onboarding#index'
  get '/user_info', to: 'onboarding#user_info'
  get '/user_conditions', to: 'onboarding#user_conditions'
  get '/user_symptoms', to: 'onboarding#user_symptoms'
  get '/condition_related_questions_answers', to: 'onboarding#condition_related_questions_answers'
  get '/symptoms_related_questions_answers', to: 'onboarding#symptoms_related_questions_answers'
  get '/onboarding_finished', to: 'onboarding#finished'
  get '/related_question_answers', to: 'related_question_answers#index'

  post '/user_info', to: 'onboarding#save_user_info'
  post '/user_conditions', to: 'onboarding#save_user_conditions'
  post '/user_symptoms', to: 'onboarding#save_user_symptoms'
  post '/condition_related_questions_answers', to: 'onboarding#save_condition_related_questions_answers'
  post '/symptoms_related_questions_answers', to: 'onboarding#save_symptoms_related_questions_answers'

  root 'home#index'
end
