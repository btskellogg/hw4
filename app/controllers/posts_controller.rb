class PostsController < ApplicationController

  def show
    @post = Post.find_by({ "id" => params["id"] })
    @user = User.find_by({ "id" => @User["user_id"] })
    @posts = post.where({ "user_id" => @current_user["id"], "user_id" => session["user_id"] })
    @Post = Post.new
    @post["user_id"] = @user["id"]
  end

  def new
    if @current_user
    @post = Post.new
    @post.place_id = params["place_id"]
    end
  end

  def create
    @post = Post.new
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post.uploaded_image.attach(params["post"]["uploaded_image"])
    @post["place_id"] = params["post"]["place_id"]
    @post["user_id"] = @current_user["id"]
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end

end
