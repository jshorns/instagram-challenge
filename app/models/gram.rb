class Gram < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    has_many :comments, :dependent => :destroy

    def resize_image
        resized_image = MiniMagick::Image.read(image.download)
        resized_image = resized_image.resize "400x400"
        v_filename = image.filename
        v_content_type = image.content_type
        image.purge
        image.attach(io: File.open(resized_image.path), filename:  v_filename, content_type: v_content_type)
    end

    def image_format
        return unless image.attached?
        if image.blob.content_type.start_with? 'image/'
          if image.blob.byte_size > 10.megabytes
            errors.add(:image, 'size needs to be less than 10MB')
            image.purge
          else
            resize_image
          end
         else
           image.purge
           errors.add(:avatar, 'needs to be an image')
         end
       end
end
