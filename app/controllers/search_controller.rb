class SearchController < ApplicationController

	def index
		@posting = Posting.all
	end	

	def search
		@posting = Posting.where(item_title: params[:item_title])
		render 'search/index'
	end	
end
