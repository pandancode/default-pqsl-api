class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        # ! You can have them below
        #  :recoverable, :rememberable, :validatable
        :jwt_authenticable,
        jwt_recovation_strategy: JwtDenylist

end
