import { useEffect } from "react";
import { Authenticator ,useAuthenticator} from "@aws-amplify/ui-react";
import "@aws-amplify/ui-react/styles.css";
import Header from "../components/Header";
import Footer from "../components/Footer";
import { useNavigate } from "react-router-dom";

const Sign = () => {
  const navigate = useNavigate();
  const { user } = useAuthenticator((context)=>[context.user]); // get the user object from the Authenticator context

  useEffect(() => {
    if (user) {
      navigate("/"); // redirect to the home page if the user is signed in
    }
  }
  , [user, navigate]);

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
