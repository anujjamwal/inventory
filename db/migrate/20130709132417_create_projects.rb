class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_code

      t.timestamps
    end
  end
end
