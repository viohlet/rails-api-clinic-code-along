class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :given_name
      t.string :surname
      t.string :born_on
      t.string :gender

      t.timestamps null: false
    end
  end
end
