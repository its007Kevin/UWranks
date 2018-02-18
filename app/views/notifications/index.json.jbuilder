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
	json.url messages_path(user_id: notification.actor.id)   #not sure about this one, needs to link to the correct conversation
end