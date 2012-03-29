Rails.application.routes.draw do

  get "tests/index"

  mount FileUploadRails::Engine => "/file_upload_rails"
end
