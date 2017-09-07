require 'rufus-scheduler'
# Let's use the rufus-scheduler singleton
s = Rufus::Scheduler.singleton
# Slack notifications linked to webhook that is directed to the channel random with the name overdue notifier
SLACK_NOTIFIER1 = Slack::Notifier.new(ENV["webhook"], username: "OVERDUE NOTIFIER")
# Every interval run through all the items and compare due dates of current logs to the current date. 
s.cron '00 15 * * *'  do
	items = Item.all
	items.each do |item|
		if item.current
			if item.current.due_date < DateTime.now.in_time_zone("London")
				SLACK_NOTIFIER1.ping("----------------------------\n OVER DUE ALERT\nLender: "  + User.find(item.current.lender_id).name + "\n Borrower:"  + User.find(item.current.borrower_id).name + "\n Item: " + item.description + "\n Due Date:"  + item.current.due_date.to_s)
			end
		end
	end
end