json.array! @notifications do |notification|
	json.id notification.id
	#json.recipient notification.recipient
	#json.actor notification.actor
	json.actor notification.actor.username
	json.action notification.action
	#json.notifiable notification.notifiable
	json.notifiable do
		json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
	end

	if notification.notifiable.class.to_s.underscore.humanize.downcase == "conversation"
		json.url messages_path(user_id: notification.actor.id)   
	elsif notification.notifiable.class.to_s.underscore.humanize.downcase == "post"
		json.url home_path 
	elsif notification.notifiable.class.to_s.underscore.humanize.downcase == "comment"
		json.url home_path
	end	
end