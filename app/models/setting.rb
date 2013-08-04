class Setting < ActiveRecord::Base
  attr_accessible :html_background, :page_background, :page_width, :products_per_row, :rows_per_page
end
