ActiveSupport::Notifications.subscribe "hello.list.railbook" do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  Rails.logger.warn("★ #{event.name}/#{event.duration}ms: #{event.payload}")
end
