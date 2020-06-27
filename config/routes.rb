Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :employers, only: [:index, :show, :create, :update]
      resources :caregivers, only: [:index, :show, :create, :update]
      resources :jobs 
      resources :caregiver_favorites, only: [:index, :show]
      resources :employer_favorites, only: [:index, :show]
      resources :caregiver_reviews
      resources :employer_reviews

      post '/employers/login', to: 'employers_sessions#create'
      post '/caregivers/login', to: 'caregivers_sessions#create'
      post '/employers/get_info', to: 'employers#get_info'
      post '/caregivers/get_info', to: 'caregivers#get_info'

      namespace :caregivers do 
        resources :job_opportunities
      end
    end
  end
end
