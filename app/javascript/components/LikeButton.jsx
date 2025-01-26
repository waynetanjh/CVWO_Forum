import React from "react";
import { useState } from 'react';

// items in bracket are props passed into likebutton component
const LikeButton = ({ postId, initialLikes, initialStatus }) => {
    // initiallikes and initialstate passed as prop to initialize the like and status state
    const [likes, setLikes] = useState(initialLikes);
    const [status, setStatus] = useState(initialStatus);
  
    const handleLike = () => {
      const csrfToken = document.querySelector("meta[name='csrf-token']").content; // Get CSRF token
        
      fetch(`/posts/${postId}/like`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken,  // Include CSRF token
        },
      })
        .then((response) => {
          if (!response.ok) {
            throw new Error('Failed to like/unlike post');
          }
          return response.json();
        })
        .then((data) => {
          setLikes(data.likes);  // Update the like count from the response
          setStatus(data.status);  // Update the status (liked or unliked)
        })
        .catch((error) => {
          console.error("Error:", error);
        });
    };
  
    return (
        // rendering the button 
      <>
        <p>Likes: {likes}</p>
        <button className="btn btn-primary" onClick={handleLike}>
          {status === "liked" ? "Unlike" : "Like"}  {/* Change button text based on status */}
        </button>
      </>
    );
  };
  
  export default LikeButton;