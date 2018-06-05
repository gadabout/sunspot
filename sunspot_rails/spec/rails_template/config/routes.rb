if Rails::VERSION::MAJOR == 2
  ActionController::Routing::Routes.draw do |map|
    map.resources :posts, :only => :create
  end
else
  Rails.application.routes.draw do
    resources :posts, :only => :create
  end
end
