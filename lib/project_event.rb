
# http://rusrails.ru/active-support-instrumentation
# http://api.rubyonrails.org/classes/ActiveSupport/Notifications.html

class ProjectEvent

  def self.create(event_name, payload = {})
    ActiveSupport::Notifications.instrument event_name, payload do

    end
  end

end