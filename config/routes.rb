Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'book#home'

	get 'book/list'
	get 'book/new'
	post 'book/create'
	patch 'book/update'
	get 'book/show'
	get 'book/edit'
	get 'book/delete'
	get 'book/update'
	get 'book/open'

	get 'page/show'
	get 'page/new'
	post 'page/create'
	get 'page/edit'
	patch 'page/update'
	get 'page/delete'
	get 'page/rmvimg'
	get 'page/viewpage'
	get 'page/rmvimg'
	
end
