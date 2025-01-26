// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"
import "../assets/stylesheets/application.css?module";
import "@hotwired/turbo-rails";
import "./controllers/application"
import React from "react";
import { createRoot } from "react-dom/client";
import "./components/Welcome.jsx";
import LikeButton from "./components/LikeButton.jsx";
import "./components/Stats.jsx";


console.log("test"); 

import $ from 'jquery';
window.$ = $;
window.jQuery = $;

// Flash message auto fade-out functionality
document.addEventListener("turbo:load", function() {
    setTimeout(function() {
      $('.alert').fadeOut('slow');
    }, 4000);

    document.querySelectorAll('[id^="like-button-"]').forEach(container => {
      const postId = container.getAttribute('data-post-id');  // Get post ID
      const initialLikes = parseInt(container.getAttribute('data-likes'), 10); // Get initial likes
      const initialStatus = container.getAttribute('data-status');
  
      const root = createRoot(container);
      root.render(<LikeButton postId={postId} initialLikes={initialLikes} initialStatus={initialStatus} />);
    });

});
