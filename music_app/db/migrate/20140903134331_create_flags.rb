class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.boolean :value
      t.integer :comment_id
      t.integer :user_id
      t.timestamps
    end
  end
end
