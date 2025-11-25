class AddIndexToPatients < ActiveRecord::Migration[7.0]
  def change
    add_index :patients, :pesel, unique: true
  end
end
