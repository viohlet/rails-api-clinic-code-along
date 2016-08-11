class AddDoctorToPatients < ActiveRecord::Migration
  def change
    add_reference :patients, :doctor, index: true, foreign_key: true
  end
end
