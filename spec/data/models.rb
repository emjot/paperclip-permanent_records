class Post < ActiveRecord::Base
  has_attached_file :image,
    url: '/system/:test_env_number/:class/:attachment/:id/:style-:fingerprint.:extension'
  validates_attachment :image, content_type: {content_type: ['image/png']}
end

class PermanentPost < ActiveRecord::Base
  has_attached_file :image,
    url: '/system/:test_env_number/:class/:attachment/:id/:style-:fingerprint.:extension'
  validates_attachment :image, content_type: {content_type: ['image/png']}
end

class Uid < ActiveRecord::Base
end

class PermanentUid < ActiveRecord::Base
end
