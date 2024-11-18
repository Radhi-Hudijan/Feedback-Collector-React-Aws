import React from 'react';
import { useNavigate } from 'react-router-dom';

const Button = ({ children, to }) => {
  const navigate = useNavigate();

  const handleClick = () => {
    navigate(to);
  };

  return (
    <button 
      onClick={handleClick} 
      className="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-opacity-50"
    >
      {children}
    </button>
  );
};

export default Button;