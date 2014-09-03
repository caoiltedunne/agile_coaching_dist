class AddInternalOrderToRandomisationEntry < ActiveRecord::Migration
  def change
    add_column :randomisation_entries, :internal_order, :integer
  end
end
