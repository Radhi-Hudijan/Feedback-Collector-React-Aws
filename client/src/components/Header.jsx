import Button from "./Button";
import { useAuthenticator } from "@aws-amplify/ui-react";
import { useNavigate } from "react-router-dom";
const Header = () => {
  const navigate = useNavigate();

  const { user, signOut } = useAuthenticator((context) => [context.user]);

  const handleSignOut = async () => {
    await signOut({ global: true });
    navigate("/sign");
  };

  return (
    <header className="flex bg-blue-500 text-white p-4 justify-between">
      <Button to="/">
        <h1 className="content-start text-2xl font-bold">Feedback Page</h1>
      </Button>
      <div className="right-side">
        <Button className="content-end" to="/create-feedback">
          Create Feadback
        </Button>

        {!user ? (
          <Button className="content-end" to="/sign">
            Sign In
          </Button>
        ) : (
          <Button className="content-end" onClick={handleSignOut}>
            Sign Out
          </Button>
        )}
      </div>
    </header>
  );
};

export default Header;
