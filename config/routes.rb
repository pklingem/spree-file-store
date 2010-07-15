map.namespace :admin do |admin|
  admin.resources :uploaded_files, :only => [:index, :new, :create, :destroy], :member => { :download => :get }
end
