require 'random_data'
  Topic.destroy_all
  Post.destroy_all
  SponsoredPost.destroy_all
  Comment.destroy_all

  15.times do
    Topic.create!(
      name:         RandomData.random_sentence,
      description:  RandomData.random_paragraph
    )
  end
  topics = Topic.all

 50.times do
   Post.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 50.times do
   SponsoredPost.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     price:  RandomData.random_integer
   )
 end
 sponsored_posts = SponsoredPost.all

 100.times do
   Comment.create!(

     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{SponsoredPost.count} posts created"
 puts "#{Comment.count} comments created"
