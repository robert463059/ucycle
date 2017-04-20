class PostingsController < ApplicationController

  def index
    @posting = Posting.all
  end

  def new
    @posting = Posting.new
    @user = current_user
  end

  def create
    @user = current_user
    @posting = @user.postings.new(posting_params)
    if @posting.save
      respond_to do |format|
        format.html {redirect_to @posting, notice: "Posting was successfully created"}
        format.json
        format.js
      end
    else
      format.html (render template: "users/new")
      format.json 
      format.js
    end
  end

  def edit
     @posting = Posting.find(params[:id])
  end

  def update
    @posting = Posting.find(params[:id])
    @user = current_user
    @posting.update(posting_params)
    redirect_to @posting
  end

  def show 
    @posting = Posting.find(params[:id])
    @user = @posting.user
  end  

  def destroy
    @posting = Posting.find(params[:id])
    @posting.destroy
    redirect_to postings_path
    
  end   

  private
  def posting_params
    params.require(:posting).permit(:user_id, :item_title, :item_description, {images:[]})
  end
end
