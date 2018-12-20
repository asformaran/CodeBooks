class BookController < ApplicationController
	skip_before_action :verify_authenticity_token

	def home

	end

	def list

		@books = Book.all.order(id: :asc)

	end
   
	# def show

	# 	@book = Book.find(params[:id])

	# end
   
	def new

		@book = Book.new

	end

	def book_params

    	params.require(:books).permit(:title, :proglang, :description)
    	
   	end
   
	def create

		@book = Book.new(book_params)
		@book.total_pages = 0

		if @book.save

			dir = "#{Rails.root}/app/assets/images/#{@book.id}"
			Dir.mkdir(dir) unless File.exists?(dir)

	    	redirect_to :action => 'list'
	   	else
	        render :action => 'new'
	    end

	end
   
	def edit

		@book = Book.find(params[:id])

	end
   
	def update

		@book = Book.find(params[:id])
		
		if @book.update_attributes(book_param)
			redirect_to :action => 'list'#, :id => @book
	  	else
	  		render :action => 'edit'
	  	end

	end

	def book_param

   		params.require(:book).permit(:title, :proglang, :description)
	
	end
   
	def delete

		Book.find(params[:id]).destroy

		dir = "#{Rails.root}/app/assets/images/#{params[:id]}"
		FileUtils.rm_rf(dir) unless !File.exists?(dir)

	    redirect_to :action => 'list'

	end

	def open

		@book = Book.find(params[:id])
		redirect_to :controller => 'page', :action => 'show', :id => @book

	end	

end
