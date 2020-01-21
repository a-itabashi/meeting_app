App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
  },

  disconnected: function() {
  },

  // ④
  received: function(meeting) {
    const meetingId = document.getElementById('meeting-area');
    meetingId.innerHTML = meeting
  },

  // ②
  speak: function(content, instanceId) {
    return this.perform('speak', {content: content, instanceId: instanceId});
  }
});

// ①
document.addEventListener('turbolinks:load', function(){
  const input = document.getElementById('chat-input');
  // textareaの中身が取得できない

  const button = document.getElementById('chat-button');
  button.addEventListener('click', function(e){
    e.preventDefault();
    const instance = document.getElementById('instance-id');
    const instanceId = instance.textContent;
    const content = input.value;
    App.room.speak(content, instanceId);
  })
});