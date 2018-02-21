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

	if notification.action == "messaged"
		json.url messages_path(user_id: notification.actor.id)   
	elsif notification.action == "commented"
		json.url #path for comments
	end	
end