class RandomisationEntry < ActiveRecord::Base

  belongs_to :randomisation_session

  def get_random_object

    next_entry = RandomisationEntry.where("internal_order = ?",self.internal_order+1).first
    next_entry= self.randomisation_session.randomisation_entries.order(:internal_order).first unless next_entry
    next_entry.object
  end

  def get_random_action

    prev_entry = RandomisationEntry.where("internal_order = ?",self.internal_order-1).first
    prev_entry= self.randomisation_session.randomisation_entries.order(:internal_order).last unless prev_entry
    prev_entry.action
  end
end
