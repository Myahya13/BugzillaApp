class Bug < ApplicationRecord
    has_many :comments
    belongs_to :user
    validates :title, :description, :priority, :Completiontime, presence: true

    default_scope ->{ order(created_at: :desc) }

    # attr_accessor :assign
end

