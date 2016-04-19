class CreateSponsoredPosts < ActiveRecord::Migration
  def change
    create_table :sponsored_posts do |t|
      t.belongs_to :topic, index: true, foreign_key: true
      t.integer :price, null: false, default: 0
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
