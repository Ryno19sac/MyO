class User < ApplicationRecord
    has_secure_password
    has_many :todos
    has_many :quotes
    has_many :rituals
end
