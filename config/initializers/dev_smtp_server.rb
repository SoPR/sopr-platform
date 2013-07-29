require 'mini-smtp-server'

if Rails.env.development? || Rails.env.test?
  server = MiniSmtpServer.new(2525, '127.0.0.1', 4)
  server.start
end
