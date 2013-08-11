class Setting < ActiveRecord::Base
  attr_accessible :html_background, :page_background, :page_width, :products_per_row, :rows_per_page,
                  :well_color, :text_color, :navbar_background, :navbar_text_color
  validates :page_width,
            :numericality => {only_integer: true,
                              greater_than_or_equal_to: 30,
                              less_than_or_equal_to:  100},
            :presence => true
  validates :products_per_row,
            :presence => true,
            :numericality => {only_integer: true,
                              greater_than_or_equal_to: 1,
                              less_than_or_equal_to:  6}
  validates :rows_per_page,
            :presence => true,
            :numericality => {only_integer: true,
                              greater_than_or_equal_to: 1}

end
