import { useNavigate } from "react-router-dom";
import PropTypes from "prop-types";

const Button = ({ className, children, to, onClick }) => {
  const navigate = useNavigate();

  const handleClick = (event) => {
    if (to) {
      navigate(to);
    }

    if (onClick) {
      onClick(event);
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
  onClick: PropTypes.func,
};

export default Button;
