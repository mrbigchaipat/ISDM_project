class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :assign_role
  has_many :courses
  belongs_to :role

  def assign_role
    self.role = Role.find_by_name("Member") if self.role.nil?
  end

  def admin?
    self.role.name == "Admin" if !self.role.blank?
  end
  def member?
    self.role.name == "Member" if !self.role.blank?
  end
end
