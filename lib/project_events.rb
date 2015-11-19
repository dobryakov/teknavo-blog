
# events map: event name[s] --> worker

class ProjectEvents

  {

    'ArticleCreatedJob' => [
      'global.article.create.success'
    ]

  }.each{|job_name, event_names|

    event_names.each{|event_name|
      ActiveSupport::Notifications.subscribe(event_name) do |*args|
        events = []
        events << ActiveSupport::Notifications::Event.new(*args)
        events.each{|event|
          Object.const_get(job_name).perform_later({ payload: event.payload, event_name: event.name })
        }
      end
    }

  }

end
