class Post < ApplicationRecord
    validates :title,{presence:true,length:{maximum:25}}
    validates :content,{presence:true}
    validates :user_id,{presence:true}
end
