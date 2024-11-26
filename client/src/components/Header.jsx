import Button from "./Button";
import PropTypes from "prop-types";
const Header = () => {
  return (
    <header className="flex bg-blue-500 text-white p-4 justify-between">
      <h1 className="content-start text-2xl font-bold">Feedback Page</h1>
      <dev className="right-side">
        <Button className="content-end" to="/create-feedback">
          Create Feadback
        </Button>
        <Button className="content-end" to="sign">
          LogIn
        </Button>
      </dev>
    </header>
  );
};

Button.propTypes = {
  children: PropTypes.node.isRequired,
  to: PropTypes.string.isRequired,
};

export default Header;
