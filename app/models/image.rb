class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :imageable, :polymorphic => true
  has_many :comments, :as => :commentable, :dependent => :destroy, :order => 'created_at DESC'
  
  acts_as_list :scope => [:imageable_id, :imageable_type]
  acts_as_taggable
    
  attr_accessible :uploaded_data, :name, :description, :tag_list, :copy_id, :position, :folder_name
  
  has_attachment  :storage => :s3, 
                  :max_size => 5.megabytes,
                  :content_type => :image,
                  :reisze_to => '1600>x1200>',
                  :thumbnails => { 
                    :thumbnail => '96x72c',
                    :thumb_150 => '150cx113c',
                    :profile => '120cx90c',
                    :med     => '240>x360>',
                    :entry   => '360>x',
                    :medium  => '640>x480>',
                    :large  => '800>x600>',
                    :square  => '64cx64c',
                    :comment => '45cx45c'
                  },
                  :processor => :MiniMagick
      
  validates_as_attachment
  
  after_resize do |record, img|
     record.size = File.size(record.temp_path)
  end

end