class UsersController < Clearance::UsersController
  before_action :find_users, only: [:show, :edit, :update]

  def index
  end

  def new
  	@user = User.new
  end
  
  def create
  	@user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_to user_path(@user) 
    else
      render template: "users/new"
    end
  end

  def show
      @user = User.find(params[:id])
      @posting = Posting.new
  end	

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end  

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    sign_out
    redirect_to root_path
  end 

  private
    def user_params
    	params.require(:user).permit(:forenames, :surname, :email, :username, :password, 
    		:address, :city, :county, :postal_code, :image)
    end

    def find_users
      @user = User.find(params[:id])
    end  

end

