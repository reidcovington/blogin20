class Post < ActiveRecord::Base
  has_may :comments

  validates_presence_of :title
  validates_presence_of :body
end
