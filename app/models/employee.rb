class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  TYPE_PERMISSION = {
    N: :normal,
    B: :boss
  }

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
