class UsersController < ApplicationController

  
def show
	@user = User.find(params[:id])
	
	@user_posts = @user.posts.where(:glowna => true)
	@user_posts_poczekalnia = @user.posts.where(:glowna => false)
	@user_comments=@user.comments
	@user_favorites=@user.favorite_posts
	@users_count = User.all.count
  @users = User.all

	
end

if Rails.env.production?

def ranking

select_clause = <<~SQL
  users.*,
  (
    DENSE_RANK() OVER(
      ORDER BY (
        SELECT SUM(cached_votes_score) FROM posts WHERE user_id = users.id
      ) DESC
    )
  ) as rank
SQL

@users = User.select( select_clause ).to_a # .order('rank').to_a if needed
@users.first.rank # 1

end

else

def ranking
 # @users= User.joins(:posts).order("sum(cached_votes_score) DESC").group("name").distinct
  @users= User.joins(:posts, :comments).order("sum(comments.cached_votes_score) DESC").group("name").distinct
	

end
end

def edit

end

def update
	 @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'Zmiana statusu użytkownika!'
      redirect_to user_path
    else
      render 'edit'
    end
end

  def follow
      @user = User.find(params[:id])
      current_user.follow(@user)
      redirect_to root_path
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to root_path
  end




 def user_params
      params.require(:user).permit(:name, :avatar, :banned)
 end

end