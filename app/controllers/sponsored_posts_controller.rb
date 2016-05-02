class SponsoredPostsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = SponsoredPost.new
  end

  def create
     @post = SponsoredPost.new
     @post.title = params[:sponsored_post][:title]
     @post.body = params[:sponsored_post][:body]
     @post.price = params[:sponsored_post][:price]
     @topic = Topic.find(params[:topic_id])

     @post.topic = @topic

     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to [@topic, @post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
   end

   def show
     @post = SponsoredPost.find(params[:id])
   end

end
