class PostsController < ApplicationController
   


  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :poczekalnia, :top, :losowy]
  before_action :correct_user, only: [:edit, :update, :destroy, :upvote, :downvote]


  # GET /posts
  # GET /posts.json
  def index

    if params[:tag]

    @posts = Post.where(:glowna => true).order("created_at DESC").paginate(:page => params[:page], :per_page => 10).tagged_with(params[:tag])

    else

    @posts = Post.where(:glowna => true).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

    end
  end


  def correct_user
    @posts = current_user.posts.find_by(id: params[:id])
    # redirect_to posts_path, notice: "nie jesteś uprawniony do edycji tego posta" if @posts.nil?
  end

  def poczekalnia

    if params[:tag]

    @posts = Post.where(:glowna => false).order("created_at DESC").paginate(:page => params[:page], :per_page => 10).tagged_with(params[:tag])

    else 

    @posts = Post.where(:glowna => false).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

    end
  end

  def top
    if params[:tag]
    @posts = Post.where(:glowna => true).order(:cached_votes_up => :desc).limit(10)

    else

    @posts = Post.where(:glowna => true).order(:cached_votes_up => :desc).limit(10)
    end
  end

  # GET /posts/1
  # GET /posts/1.json

  def losowy
    @post           = Post.where(:glowna => true).offset(rand(Post.where(:glowna => true).count)).first
   
    if user_signed_in? 
     @new_comment    = Comment.build_from(@post, current_user.id, "")
    end
  end

  def show
    @post           = Post.find(params[:id])
    
     
      
    if user_signed_in?
      @new_comment    = Comment.build_from(@post, current_user.id, "")
    end
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    @post.assign_attributes({:glowna => false})

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post został utworzony pomyślnie.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post został zaaktualizowany pomyślnie.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post został usunięty pomyślnie.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.liked_by current_user
    redirect_to posts_path
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_from current_user
    redirect_to posts_path
  end

   # Add and remove favorite recipes
  # for current_user
  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @post
      redirect_to :back, notice: 'You favorited #{@post.name}'

    elsif type == "unfavorite"
      current_user.favorites.delete(@post)
      redirect_to :back, notice: 'Unfavorited #{@post.name}'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :title, :content, :image, :glowna, :tag_list)
    end
end
