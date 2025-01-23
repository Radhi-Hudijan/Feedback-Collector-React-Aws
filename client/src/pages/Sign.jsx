import { useEffect } from "react";
import { Authenticator, useAuthenticator } from "@aws-amplify/ui-react";
import { fetchAuthSession } from "@aws-amplify/auth";
import "@aws-amplify/ui-react/styles.css";
import Header from "../components/Header";
import Footer from "../components/Footer";
import { useNavigate } from "react-router-dom";

const Sign = () => {
  const navigate = useNavigate();
  const { user } = useAuthenticator((context) => [context.user]); // get the user object from the Authenticator context

  const printAccessTokenAndIdToken = async () => {
    try {
      const session = await fetchAuthSession(); // Fetch the authentication session
      console.log("ID Token:", session.tokens.idToken.toString());
    } catch (e) {
      console.log(e);
    }
  };

  useEffect(() => {
    if (user) {
      printAccessTokenAndIdToken();
      navigate("/"); // redirect to the home page if the user is signed in
    }
  }, [user, navigate]);

  return (
    <div className="min-h-screen flex flex-col justify-between bg-gray-100">
      <Header />
      <main className="flex-grow flex items-center justify-center">
        <Authenticator loginMechanisms={["email"]} />
      </main>
      <Footer />
    </div>
  );
};

export default Sign;
