class UsersController < ApplicationController

  
def show
	@user = User.find(params[:id])
	
	@user_posts = @user.posts.where(:glowna => true)
	@user_posts_poczekalnia = @user.posts.where(:glowna => false)
	@user_comments=@user.comments
	@user_favorites=@user.favorite_posts
	@users_count = User.all.count

	
end




def ranking
	@users = User.all
end

def edit

end

def update
	 @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Zmiana statusu użytkownika!'
      redirect_to user_path
    else
      render 'edit'
    end
end


 def user_params
      params.require(:user).permit(:name, :avatar, :banned)
 end

end