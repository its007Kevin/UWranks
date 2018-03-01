var conversations = $('#conversations-list');
var conversation = conversations.find("[data-conversation-id='" + "<%= @conversation.id %>" + "']");
var messages_list = conversation.find('.messages-list');
var height = messages_list[0].scrollHeight;
messages_list.scrollTop(height);


function goBack() {
  window.history.back();
}