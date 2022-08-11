class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        # ! You can have them below
        #  :recoverable, :rememberable, :validatable
        :jwt_authenticatable,
        jwt_revocation_strategy: JwtDenylist
end
