class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :khatma_id 

      t.timestamps
    end
  end
end
