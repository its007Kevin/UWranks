$(document).on 'turbolinks:load', ->
	class Notifications
		constructor: ->
			@notifications = $("[data-behavior='notifications']")
			@setup() if @notifications.length > 0

		setup: ->

			$("[data-behavior='notification-items']").on "click", @handleClick

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
					$("[data-behavior='unread-count']").text("")
			)

		handleSuccess: (data) =>
			items = $.map data, (notification) ->
				if notification.action == "messaged"
					"<div class='navbar-item'>
						<a href='#{notification.url}'>#{notification.actor} #{notification.action} you!</a>
					</div>"
				else if /commented/.test notification.action
					"<div class='navbar-item'>
						<a href='#{notification.url}'>#{notification.actor} #{notification.action}</a>
					</div>"
				else if /replied/.test notification.action
					"<div class='navbar-item'>
						<a href='#{notification.url}'>#{notification.actor} #{notification.action}</a>
					</div>"

			if items.length == 0 
				$("[data-behavior='notification-items']").html(
					"<div class='navbar-item'>
						<p>You have no new notifications</p>
					</div>")
				$("[data-behavior='unread-count']").text("")
			else 
				$("[data-behavior='notification-items']").html(items)
				$("[data-behavior='unread-count']").html('<div class="button is-info is-rounded is-small">' + items.length + '</div>')
			
	jQuery -> 
		new Notifications 

	return