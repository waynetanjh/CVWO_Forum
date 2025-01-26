import * as React from 'react';
import { createRoot } from 'react-dom/client';

const Welcome = () => {
  return (
    <div className="container">
      <h1>Welcome to CVWO Forums!</h1>
      <p>This is a simple forum application built with Ruby on Rails and React.</p>
    </div>
  );
};

document.addEventListener('turbo:load', () => {
  const container = document.getElementById('welcome');
  if (container) {
    const root = createRoot(container); // Use createRoot for React 18
    root.render(<Welcome />);
  }
});

export default Welcome;
