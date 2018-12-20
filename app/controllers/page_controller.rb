class PageController < ApplicationController
	skip_before_action :verify_authenticity_token

	def show

		@pages = Page.where(book_id: params[:id])
		@book = Book.find(params[:id])

	end

	def viewpage

		@page = Page.find(params[:pageid])
		@pages = Page.where(book_id: params[:id]).order(created_at: :asc)

	end
   
	def new

		@page = Page.new

	end

	def page_params

    	params.permit(:id, :content, :image)

   	end
   
	def create

		bookinfo = Book.select(:total_pages).where("id = #{params[:id]}")

		if params[:image] || params[:content]

			Book.where(:id => params[:id]).update(:total_pages => bookinfo[0].total_pages+1)

			@page = Page.new({"book_id" => "#{params[:id]}", "pagenum" => bookinfo[0].total_pages+1, 
				"content" => params[:content]})

			if @page.save

				dir = "#{Rails.root}/app/assets/images/#{params[:id]}/#{@page.pagenum}"
				Dir.mkdir(dir) unless File.exists?(dir)

				if params[:image]

					imgpath = Rails.root.join('app', 'assets', 'images', params[:id], "#{@page.pagenum}", params[:image].original_filename)

					File.open(imgpath, 'wb') do |f| 
		    			f.write(params[:image].read)
		    		end

		    		@page.imgpath = imgpath
		    		@page.save
	    		end

	    		redirect_to :action => 'show', :id => params[:id]
	    	else
	    		render :action => 'new'
	    	end

	    else
	    	render :action => 'new'
	    end
	   	
	end
   
	def edit

		@page = Page.find(params[:pageid])

	end
   
	def update

		@page = Page.find(params[:pageid])

		origpath = nil

		if params[:page][:imgpath]

			img = true
			origpath = @page.imgpath

			image = params[:page][:imgpath]

			imgpath = Rails.root.join('app', 'assets', 'images', params[:id], "#{@page.pagenum}", image.original_filename)

			File.open(imgpath, 'wb') do |f| 
    			f.write(image.read)
    		end

		else
			img = false
		end
		
		if params[:page][:content] || params[:page][:imgpath]

			if @page.update_attributes(page_param)

				if img == true
					FileUtils.rm(origpath) unless origpath == nil
					Page.where(:id => params[:pageid]).update(:imgpath => imgpath)
				end

				redirect_to :action => 'viewpage', :id => params[:id], :pageid => params[:pageid]
		  	else

		  		redirect_to :action => 'edit', :id => params[:id], :pageid => params[:pageid]

		  	end

		else

			redirect_to :action => 'edit', :id => params[:id], :pageid => params[:pageid]

		end

	end

	def page_param

		params.require(:page).permit(:content, :imgpath)
	
	end
   
	def delete

		@page = Page.find(params[:pageid])

		dir = "#{Rails.root}/app/assets/images/#{params[:id]}/#{@page.pagenum}"
		FileUtils.rm_rf(dir) unless !File.exists?(dir)

		Page.where(:id => params[:pageid]).update(:imgpath => nil)

		@page.destroy

		bookinfo = Book.select(:total_pages).where("id = #{params[:id]}")
		Book.where(:id => params[:id]).update(:total_pages => bookinfo[0].total_pages-1)

	    redirect_to :action => 'show', :id => params[:id]

	end

	def rmvimg

		@page = Page.find(params[:pageid])
		origpath = @page.imgpath

		FileUtils.rm(origpath) unless origpath == nil

		Page.where(:id => params[:pageid]).update(:imgpath => nil)

		redirect_to :action => 'edit', :pageid => params[:pageid], :id => params[:id]

	end

end
