App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
  },

  disconnected: function() {
  },

  received: function(meeting) {
    console.log("test");
    const meetingId = document.getElementById('meeting-area')
    meetingId.insertAdjacentHTML('afterbegin', meeting);
    // posts.innerHTML += post

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
    // const content = input.value;
    const instance = document.getElementById('instance-id');
    const instanceId = instance.textContent;

    const content = "ファック";
    App.room.speak(content, instanceId);
  })
});