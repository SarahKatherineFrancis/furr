import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: [
        "dog.",
        "cat.",
        "bird.",
        "hamster.",
        "guinea pig.",
        "rabbit.",
        "fish.",
        "snake.",
        "turtle.",
        "frog.",
        "lizard.",
        "gerbil.",
        "ferret.",
        "hedgehog.",
        "chinchilla.",
        "rat.",
        "mouse.",
        "parrot.",
        "canary.",
        "cockatiel.",
        "lovebird.",
        "finch.",
        "budgerigar.",
        "parakeet.",
        "gecko.",
        "iguana.",
        "hermit crab.",
        "tarantula.",
        "scorpion.",
        "beta fish."
      ],
      typeSpeed: 50,
      loop: true
    })
  }
}
