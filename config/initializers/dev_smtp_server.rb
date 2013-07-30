if Rails.env.development? || Rails.env.test?
  require 'mini-smtp-server'
  server = MiniSmtpServer.new(2525, '127.0.0.1', 4)
  server.start
end
