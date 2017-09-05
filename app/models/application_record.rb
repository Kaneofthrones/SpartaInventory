class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

   def self.everymin
      SLACK_NOTIFIER.ping("everymin")
  end
end
