Rails.application.routes.draw do
  
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, 
                                   controllers: { sessions: 'sessions' }

  root to: 'tests#index'

  resources :tests, only: :index do

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
    resources :gists, only: :create
  end

  namespace :admin do
    resources :tests do 
      resources :questions, except: :index, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: %i[index destroy]
  end

end
