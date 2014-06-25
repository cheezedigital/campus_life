class User < ActiveRecord::Base

  has_many :assignments

  validates :first_name, :last_name, presence: true

  def self.by_first_name(first_name)
    where(first_name: first_name)
  end

  def name
    [first_name, last_name].join(' ')
  end

  def age
    Time.now.year - birthday.year
  end

  def inactive?
    not active
  end

end
