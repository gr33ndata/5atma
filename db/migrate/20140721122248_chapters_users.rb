class ChaptersUsers < ActiveRecord::Migration
  def change
    create_table 'chapters_users', :id => false do |t|
        t.column :chapter_id, :integer
        t.column :user_id, :integer
    end
  end
end
