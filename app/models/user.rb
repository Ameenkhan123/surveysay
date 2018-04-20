class User < ApplicationRecord
	  has_many :surveys
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end