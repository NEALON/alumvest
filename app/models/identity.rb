class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :first_name, :name, :last_name, :email, :password, :password_confirmation, :description

  validates_presence_of :first_name
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :multiline => true

  belongs_to :user
end
