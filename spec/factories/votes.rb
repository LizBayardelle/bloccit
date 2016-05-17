FactoryGirl.define do
  factory :vote do
    value 1
    user nil
    post nil
    after(:build) { |vote| vote.class.skip_callback(:create, :after, :update_rank)}
  end
end
