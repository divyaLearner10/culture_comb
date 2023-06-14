import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  #insertMessageAndScrollDown(data) {
    // Insert the new message at the bottom of the chatroom
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    // Scroll down to the bottom of the chatroom
    // window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' })
    this.messagesTarget.scrollTo({top: this.messagesTarget.scrollHeight, behavior: 'smooth'})
  }

  resetForm(event) {
    event.target.reset()
  }
}
