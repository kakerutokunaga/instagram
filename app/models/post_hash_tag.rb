class PostHashTag < ApplicationRecord
  belongs_to :post
  belongs_to :hash_tag #belongs_to側（一の側）は単数系標記＝一つ一つのハッシュタグに対応するから
end
