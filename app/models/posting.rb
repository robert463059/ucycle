class Posting < ApplicationRecord
	mount_uploaders :images, PostingUploader
	belongs_to :user
end
