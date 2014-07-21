class CreateKhatmas < ActiveRecord::Migration
  def change
    create_table :khatmas do |t|

      # Owner of this Khatma
      t.string :user_id  
      t.text :description
      t.timestamps
    end
  end
end
