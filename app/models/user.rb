class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable,authentication_keys: [:login]
         
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :clikes, dependent: :destroy

  has_many_attached :images, dependent: :destroy
  has_one_attached :image, dependent: :destroy


  def update_with_password(params, *options)
   current_password = params.delete(:current_password)

   if params[:password].blank?
     params.delete(:password)
     params.delete(:password_confirmation) if params[:password_confirmation].blank?
   end

   result = if params[:password].blank? || valid_password?(current_password)
     update(params, *options)
   else
     self.assign_attributes(params, *options)
     self.valid?
     self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
     false
   end

   clean_up_passwords
   result
  end

  attr_writer :login

  def login
    @login || self.user_name || self.email
  end  

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:user_name) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end 

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:normaluser) if self.roles.blank?
  end

end
