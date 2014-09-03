class CreateRandomisationSessions < ActiveRecord::Migration
  def change
    create_table :randomisation_sessions do |t|
      t.string :name

      t.timestamps
    end
  end
end
