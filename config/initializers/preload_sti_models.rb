if Rails.env.development?
  %w[google_play ipad iphone].each do |c|
    require_dependency File.join("app","models","#{c}.rb")
  end
end
