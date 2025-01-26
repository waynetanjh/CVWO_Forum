import React from "react";
import { useState } from 'react';
import { createRoot } from 'react-dom/client';

// items in bracket are props passed into likebutton component
const Stats = (userId, initialFollowers , initialStatus, initalFollowing) => {

    const [Followers, setFollowers] = useState(initialFollowers);
    const [Following, setFollowing] = useState(initialFollowing);
    const [status, setStatus] = useState(initialStatus);
      
    const handleFollow = () => {
        const csrfToken = document.querySelector("meta[name='csrf-token']").content; // Get CSRF token
        
        fetch(`/users/${userId}`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": csrfToken,  // Include CSRF token
        },
        })
        .then((response) => {
            if (!response.ok) {
            throw new Error('Failed to follow user');
            }
            return response.json();
        })
        .then((data) => {
            setFollowers(data.followers);  // Update the like count from the response
            setFollowing(data.following);  // Update the status (liked or unliked)
        })
        .catch((error) => {
            console.error("Error:", error);
        });
    };
    
    return (
        // rendering the button 
        <div className="container">
            <p>Following: {Following}</p>
            <p>Followers: {Followers}</p>
            <button className="btn btn-primary" onClick={handleFollow}>
                {status === "followed" ? "Following" : "Unfollow"}  {/* Change button text based on status */}
            </button>
        </div>
    );
  };
  
  export default Stats;