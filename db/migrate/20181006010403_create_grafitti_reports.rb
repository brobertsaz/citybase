class CreateGrafittiReports < ActiveRecord::Migration[5.1]
  def change
    create_table :grafitti_reports do |t|
      t.string :alderman_name
      t.integer :ward
      t.string :location
      t.string :surface_type

      t.timestamps
    end
  end
end
