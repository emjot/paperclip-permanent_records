ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :permanent_posts, force: true do |t|
    t.string     :image_file_name
    t.integer    :image_file_size
    t.string     :image_content_type
    t.string     :image_fingerprint
    t.timestamp  :image_updated_at
    t.timestamp  :deleted_at
  end

  create_table :posts, force: true do |t|
    t.string     :image_file_name
    t.integer    :image_file_size
    t.string     :image_content_type
    t.string     :image_fingerprint
    t.timestamp  :image_updated_at
  end

  create_table :permanent_uids, force: true do |t|
    t.integer :uid
    t.timestamp :deleted_at
  end

  create_table :uids, force: true do |t|
    t.integer :uid
  end
end
