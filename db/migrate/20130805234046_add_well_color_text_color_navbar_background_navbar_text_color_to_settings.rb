class AddWellColorTextColorNavbarBackgroundNavbarTextColorToSettings < ActiveRecord::Migration
  def up
    add_column :settings, :well_color, :string
    add_column :settings, :text_color, :string
    add_column :settings, :navbar_background, :string
    add_column :settings, :navbar_text_color, :string
  end
  def down
    remove_column :settings, :well_color
    remove_column :settings, :text_color
    remove_column :settings, :navbar_background
    remove_column :settings, :navbar_text_color
  end
end
