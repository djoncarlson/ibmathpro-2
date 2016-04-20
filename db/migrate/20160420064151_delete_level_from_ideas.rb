class DeleteLevelFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :level, :string
  end
end
