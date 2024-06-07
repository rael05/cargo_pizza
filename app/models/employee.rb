class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders

  TYPE_PERMISSION = {
    N: :normal,
    B: :boss
  }

  def role_validator
    if TYPE_PERMISSION[role.to_sym].nil?
      errors.add(:role, I18n.translate(:type_permission_error))
    end
  end

  def full_name
    [first_name, last_name].join(" ")
  end

  def isNormal?
    TYPE_PERMISSION[role.to_sym] == :normal
  end

  def isBoss?
    TYPE_PERMISSION[role.to_sym] == :boss
  end
end
