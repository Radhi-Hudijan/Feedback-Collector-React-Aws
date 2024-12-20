import Button from "./Button";
const Header = () => {
  return (
    <header className="flex bg-blue-500 text-white p-4 justify-between">
      <Button to="/">
        <h1 className="content-start text-2xl font-bold">Feedback Page</h1>
      </Button>
      <div className="right-side">
        <Button className="content-end" to="/create-feedback">
          Create Feadback
        </Button>
        <Button className="content-end" to="sign">
          LogIn
        </Button>
      </div>
    </header>
  );
};

export default Header;
