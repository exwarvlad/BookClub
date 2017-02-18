class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable, :omniauthable


  has_many :books

  NAME_LENGTH = 30

  validates :name, presence: true, length: {maximum: NAME_LENGTH}

  # Для работы OmniAuth
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.password = Devise.friendly_token[0, 20]

      user.email = auth.info.email

      # если email не уникальный или его нету, то генерю случайный
      unless user.valid?
        count = 0
        while user.valid? == false || count != 42
          user.email = "#{rand(99999999999999)}@#{auth.provider}"
          count += 1
        end
      end
    end
  end
end
