class CreateRandomisationEntries < ActiveRecord::Migration
  def change
    create_table :randomisation_entries do |t|
      t.string :object
      t.string :action
      t.integer :randomisation_session_id

      t.timestamps
    end
  end
end
