Rails.application.routes.draw do

  root to: 'harbor#index'


  namespace :api do
    concern :index_deleteable do
      delete :index, on: :collection, action: :destroy
    end

    resources :search, only: [:index]

    resources :projects, only: [:index, :create] do
      resources :members, only: [:index, :show, :create, :update, :destroy]

      member do
        put :publicity
        scope "logs" do
          post :filter
        end
      end
    end

    resources :statistics, only: [:index]

    resources :users, only: [:index, :show, :create, :update, :destroy] do
      member do
        put :password
        put :sysadmin
      end
    end

    resources :repositories, only: [:index], concerns: :index_deleteable do
      collection do
        get :tags
        get :manifests
        get :top
      end
    end

    namespace :job do
      resources :replication, only: [:index, :destroy] do
        member do
          get :log
        end
      end
    end

    resources :replication_policies, only: [:index, :show, :create, :update], path: '/policies/replication' do
      member do
        put :enablement
      end
    end

    resources :targets, only: [:index, :create, :show, :update, :destroy] do
      member do
        get :policies
      end

      collection do
        post :ping
      end
    end

    resources :logs, only: [:index]
  end

  # translate the horrible harbor routes in this ugly way
  match ':action', via: :all, controller: :harbor
end
