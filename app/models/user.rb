class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 100}, format: {with: /(?=.*[a-zA-Z ]).+/}
    validates :email, presence: true, length: {maximum: 100}, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}, uniqueness: {case_sensitive: false}

    has_secure_password
    validates :password, presence: true, length: {minimum: 7, maximum: 50}, format: {with: /(?=.*[A-Z])+(?=.*[a-z])+(?=.*[0-9]).+/}
end
