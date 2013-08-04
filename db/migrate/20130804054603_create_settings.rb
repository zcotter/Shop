class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :rows_per_page
      t.integer :products_per_row
      t.integer :page_width
      t.string :html_background
      t.string :page_background

      t.timestamps
    end
  end
end
