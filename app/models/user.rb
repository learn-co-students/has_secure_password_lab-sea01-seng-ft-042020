class User < ActiveRecord::Base
    has_secure_password

    # Tests are setup that it does not require a name or password
    # validates(:name, :password, :password_confirmation, presence: true)
    validates(:name, uniqueness: true) 
    validates(:password, confirmation: true)
end