RailsAdmin.config do |config|
  config.authenticate_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == 'admin' && password == ENV.fetch('RAILS_ADMIN_PASSWORD','pass')
    end
  end
end