// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener('turbo:load', function() {
  const notice = document.getElementById('notice');
  if (notice) {
    setTimeout(function() {
      notice.classList.add('animate-fade-out');
      setTimeout(function() {
        notice.remove();
      }, 300);
    }, 5000);
  }
});
