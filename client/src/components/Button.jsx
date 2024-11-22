import { useNavigate } from "react-router-dom";
import PropTypes from "prop-types";

const Button = ({ className , children, to }) => {
  const navigate = useNavigate();

  const handleClick = () => {
    if (to) {
      navigate(to);
    }
  };

  return (
    <button
      onClick={handleClick}
      className={`bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-opacity-50 ${className}`}
    >
      {children}
    </button>
  );
};

Button.propTypes = {
  children: PropTypes.node,
  to: PropTypes.string,
  className: PropTypes.string,
};

export default Button;
