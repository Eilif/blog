class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string(:creatoralias)
      t.string(:creatoremail)
      t.text(:commenttext)
      t.integer(:post_id)
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
