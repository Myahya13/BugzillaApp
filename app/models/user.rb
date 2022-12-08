class User < ApplicationRecord
  validates :role, presence: true
  has_many :bugs
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable,:confirmable, :rememberable, :validatable

         def manager?
          role == 'manager'
        end
      
        def qa?
          role == 'qa'
        end
        
        def developer?
          role == 'developer'
        end
end
