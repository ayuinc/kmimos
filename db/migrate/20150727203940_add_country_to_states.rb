class AddCountryToStates < ActiveRecord::Migration
  def change
    add_reference :states, :country, index: true, foreign_key: true
  end
end