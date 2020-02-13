FactoryBot.define do

  factory :images do
    # attach_file (:images)            {File.open("#{Rails.root}/public/uploads/image/images/7/ポメラニアン.jpeg")}
    images            {File.open("#{Rails.root}/public/furima.box.png")}
    # attach_file "post[images]",{File.open"(#{Rails.root}/public/uploads/image/images/7/ポメラニアン.jpeg"}
    # images   Rack::Test::UploadedFile.new(File.join(Rails.root, "#{Rails.root}/public/uploads/image/images/7/ポメラニアン.jpeg"))
  end

end