require 'rufus-scheduler'
# Let's use the rufus-scheduler singleton
s = Rufus::Scheduler.singleton
# Slack notifications linked to webhook that is directed to the channel random with the name overdue notifier
SLACK_NOTIFIER1 = Slack::Notifier.new(
	"https://hooks.slack.com/services/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", channel: "#random", username: "OVERDUE NOTIFIER")
# Every interval run through all the items and compare due dates of current logs to the current date. 
s.every '24h' do
	items = Item.all
	items.each do |item|
		if item.current
			if item.current.due_date < DateTime.now
				SLACK_NOTIFIER1.ping("----------------------------\n OVER DUE ALERT\nLender: "  + User.find(item.current.lender_id).name + "\n Borrower:"  + User.find(item.current.borrower_id).name + "\n Item: " + item.description + "\n Due Date:"  + item.current.due_date.to_s)
			end
		end
	end
end