class CreateLabReports < ActiveRecord::Migration[6.1]
  def change
    create_table :lab_reports do |t|
      t.string :title
      t.text :description
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
