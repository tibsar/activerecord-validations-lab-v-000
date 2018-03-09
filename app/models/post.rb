class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 } 
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
end

VALID_CLICKBAIT = [
  /Won't Believe/i,
  /Secret/i, 
  /Top [0-9]*/i, 
  /Guess/i
] 

def is_clickbait?
  VALID_CLICKBAIT.none?{ |pat| pat.match title } 

end 