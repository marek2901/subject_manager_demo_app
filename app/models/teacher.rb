class Teacher < ActiveRecord::Base
  ACADEMIC_TITLES = ["Dr.", "Prof."]

  validates_presence_of :first_name, :last_name

  validates :title, inclusion: { in: ACADEMIC_TITLES,
    message: "%{value} is not a valid size" }

  has_many :subjects

end
