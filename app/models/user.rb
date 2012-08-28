class User < ActiveRecord::Base
  attr_accessible :authorize_token, :email, :password, :token_time
  attr_protected :email, :password
  validates_uniqueness_of :email, :on => :create, :message => "must be unique"
end
