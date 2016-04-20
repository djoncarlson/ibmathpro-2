class AddTypesToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :hl, :boolean, default: false
    add_column :ideas, :sl, :boolean, default: false
    add_column :ideas, :st, :boolean, default: false
  end
end
