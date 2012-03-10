class Icon < ActiveRecord::Base
  belongs_to :user
  validate :right_size?
  
  def uploaded_data= image
    self.file = image.read
    self.content_type = image.content_type.chomp
  end
  
  protected
  def right_size?
#   unless self.file.nil?
    image=MiniMagick::Image.read self.file
    size=image.size
    errors.add(:uploaded_data, "width to high") if size.width > 128 # parametro da prendere da qualche altra parte
    errors.add(:uploaded_data, "hight to high") if size.height > 128 # parametro da prendere da qualche altra parte
#   end
  end
end
