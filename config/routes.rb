RedmineApp::Application.routes.draw do
  resources :wktime do
    collection do
      get :index, :new, :edit
      post :create, :update, :destroy, :submit, :approve, :reject, :export
    end
  end
  resources :wkexpense do
    collection do
      get :index, :new, :edit
      post :create, :update, :destroy, :submit, :approve, :reject, :export
    end
  end
end
