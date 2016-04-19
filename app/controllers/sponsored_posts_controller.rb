class SponsoredPostsController < ApplicationController
  def new
    @sponsored_post = SponsoredPost.new
  end
end
