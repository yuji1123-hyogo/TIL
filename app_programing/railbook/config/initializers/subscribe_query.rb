ActiveSupport::Notifications.subscribe "sql.active_record" do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  if event.duration >= 5000
    Rails.logger.warn("#{event.name}: #{event.payload[:sql]}")
  end
end
