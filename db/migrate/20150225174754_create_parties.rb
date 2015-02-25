class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.date :expiration
      t.float :lat
      t.float :long
      t.belongs_to :user, index: true
    end
    add_foreign_key :parties, :users
  end
end
