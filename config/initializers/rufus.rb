
require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton


# Stupid recurrent task...
SLACK_NOTIFIER1 = Slack::Notifier.new(
	"https://hooks.slack.com/services/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"
	)
#
s.every '20s' do
	items = Item.all
	items.each do |item|
		if item.current
			if item.current.due_date < DateTime.now
				SLACK_NOTIFIER.ping("----------------------------\n OVER DUE ALERT\nLender: "  + User.find(item.current.lender_id).name + "\n Borrower:"  + User.find(item.current.borrower_id).name + "\n Item: " + item.description + "\n Due Date:"  + item.current.due_date.to_s)
			end
		end
	end
end