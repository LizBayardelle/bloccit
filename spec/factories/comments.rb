FactoryGirl.define do
  factory :comment do
    body RandomData.random_sentence
    user
    post
    after(:build) { |comment| comment.class.skip_callback(:create, :after, :send_favorite_emails)}
  end
end
