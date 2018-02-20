class Notifications
	constructor: ->
		@notifications = $("[data-behavior='notifications']")
		@setup() if @notifications.length > 0


	setup: ->

		$("[data-behavior='notifications-link']").on "click", @handleClick

		$.ajax(
			url: "/notifications.json"
			dataType: "JSON"
			method: "GET"
			success: @handleSuccess

		)


	handleClick: (e) =>
		$.ajax(
			url: "/notifications/mark_as_read"
			dataType: "JSON"
			method: "POST"
			success: ->
				$("[data-behavior='unread-count']").text(0)
		)


	handleSuccess: (data) =>
		items = $.map data, (notification) ->
			"<div class='navbar-item'>
				<a href='#{notification.url}'>#{notification.actor} #{notification.action} you!</a>
			</div>"

		if items.length == 0 
			$("[data-behavior='notification-items']").html(
				"<div class='navbar-item'>
					<p>You have no new notifications</p>
				</div>")
		else 
			$("[data-behavior='notification-items']").html(items)
		

		$("[data-behavior='unread-count']").text(items.length)
		

jQuery -> 
	new Notifications 