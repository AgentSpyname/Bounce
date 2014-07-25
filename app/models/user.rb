class User < ActiveRecord::Base
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true,
                           uniqueness: true

  validates :first_name, presence: true

  validates :last_name, presence: true

         

    has_many :friendships
    has_many :friends, :through => :friendships 
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"  
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user  
  
   def name
  	first_name + " " + last_name
  end

  has_many :statuses
  has_many :comments


  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)

    "http://gravatar.com/avatar/#{hash}?d=identicon"
  end

def to_param
  username
end


def self.search(search)
  if search
    where('first_name LIKE ?', "%#{search}%")
  else
    scoped
  end
end



  end

