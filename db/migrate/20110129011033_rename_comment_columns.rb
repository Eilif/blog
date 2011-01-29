class RenameCommentColumns < ActiveRecord::Migration
  def self.up
    rename_column :comments, :creatoralias, :creator_alias
    rename_column :comments, :creatoremail, :creator_email
    rename_column :comments, :commenttext, :comment_text
  end

  def self.down
    rename_column :comments, :comment_text, :commenttext
    rename_column :comments, :creator_email, :creatoremail
    rename_column :comments, :creator_alias, :creatoralias
  end
end
