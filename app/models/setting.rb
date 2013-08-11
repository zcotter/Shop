
class Setting < ActiveRecord::Base
  attr_accessible :html_background, :page_background, :page_width, :products_per_row, :rows_per_page,
                  :well_color, :text_color, :navbar_background, :navbar_text_color


end
