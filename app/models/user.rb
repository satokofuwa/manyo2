class User < ApplicationRecord
  before_validation { email.downcase }
  validates :name, presence: true, length: { maximum: 30 }
  validates :password, length: { minimum: 6 }
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }


  has_many :tasks, dependent: :destroy
  has_secure_password
  enum admin:{"管理者": true, "ユーザー": false}

  private

  def admin_update_check
    throw(:abort) if User.where(admin: true).count == 1 && !admin 
  end
  
  def admin_delete_check
    if User.where(admin: true).count <= 1 && admin
      throw(:abort)
      flash[notice] = '管理者一人の為削除は削除できません'
    end
  end
end

