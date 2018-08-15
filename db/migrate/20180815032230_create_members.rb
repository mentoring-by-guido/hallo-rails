class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :email
      t.string :name
      t.string :surname
      t.string :external_id
      t.timestamps
    end
  end
end
