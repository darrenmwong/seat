Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '657380804327121', '99e43bbee32e1f22c5cdb2890dfc1ee3'
end