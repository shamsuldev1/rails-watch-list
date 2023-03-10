class List < ApplicationRecord
    has_many :bookmarks, dependent: :destroy
    has_many :movies, through: :bookmarks

    validates :name, presence: true
    validates :name, uniqueness: true

    validates :name, length: { minimum: 1 }, uniqueness: true, presence: true
end
