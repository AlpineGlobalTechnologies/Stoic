import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    hiddenOffset: { type: Number, default: 80 },
    jitter: { type: Number, default: 10 }
  };

  connect() {
    this.lastScroll = window.scrollY;
    this.onScroll = this.onScroll.bind(this);

    // Set correct initial state
    this.updateScrolledState(this.lastScroll);

    window.addEventListener("scroll", this.onScroll, { passive: true });
  }

  disconnect() {
    window.removeEventListener("scroll", this.onScroll);
  }

  onScroll() {
    const currentScroll = window.scrollY;

    // Always handle scrolled state FIRST
    this.updateScrolledState(currentScroll);

    // Reset cleanly at top
    if (currentScroll <= 0) {
      this.element.classList.remove("hidden");
      this.lastScroll = 0;
      return;
    }

    // Ignore jitter AFTER scrolled state is handled
    if (Math.abs(currentScroll - this.lastScroll) < this.jitterValue) return;

    // Hide / show header
    if (currentScroll > this.lastScroll && currentScroll > this.hiddenOffsetValue) {
      this.element.classList.add("hidden");
    } else {
      this.element.classList.remove("hidden");
    }

    this.lastScroll = currentScroll;
  }

  updateScrolledState(scrollY) {
    if (scrollY > 10) {
      this.element.classList.add("scrolled");
    } else {
      this.element.classList.remove("scrolled");
    }
  }
}
