class CreatePostToTagConnector < ActiveRecord::Migration
  def self.up
    create_table :post_to_tag_connectors do |t|
      t.timestamps
      t.integer(:post_id)
      t.integer(:tag_id)
    end
  end

  def self.down
    drop_table :post_to_tag_connectors
  end
end
