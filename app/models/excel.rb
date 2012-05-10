class Excel < ActiveRecord::Base

	mount_uploader :archivo, ArchivoUploader


  #one convenient method to pass jq_upload the necessary information
#  def to_jq_upload
#    {
#      "name" => read_attribute(:archivo),
#      "size" => archivo.size,
#      "url" => avatar.url,
#      #{}"delete_url" => excel_path(:id => id),
#      #{}"delete_type" => "DELETE"
#    }
#  end
end
