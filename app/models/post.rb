class Post < ApplicationRecord
  after_commit :create_hash_tags, on: :create
  belongs_to :user
  has_one_attached :image
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags

  validate :image_presence

  def extract_name_hash_tags
    description.to_s.scan(/#\w+/).map{|name| name.gsub("#","")}
    #scanで正規表現にマッチする配列を作成。その後mapメソッドを配列の各要素に適応し、gsubメソッドでは#を取り除いている
  end

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  def create_hash_tags
    #create hashtags of post
    extract_name_hash_tags.each do |name|
      hash_tags.create(name: name)
    end
  end
end
