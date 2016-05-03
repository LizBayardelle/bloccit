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

   def update
      @post = SponsoredPost.find(params[:id])
      @post.title = params[:sponsored_post][:title]
      @post.body = params[:sponsored_post][:body]

      if @post.save
        flash[:notice] = "Sponsored post was updated."
        redirect_to [@post.topic, @post]
      else
        flash.now[:alert] = "There was an error saving the sponsored post. Please try again."
        render :edit
      end
    end

    def destroy
     @post = SponsoredPost.find(params[:id])

     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to @post.topic
     else
       flash.now[:alert] = "There was an error deleting the sponsored post."
       render :show
     end
   end
end
