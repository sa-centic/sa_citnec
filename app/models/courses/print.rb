module Courses

class Print < ApplicationRecord

  belongs_to :course

  has_rich_text :content



  end

end