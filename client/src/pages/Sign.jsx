import { useEffect } from "react";
import { Authenticator, useAuthenticator } from "@aws-amplify/ui-react";
import "@aws-amplify/ui-react/styles.css";
import Header from "../components/Header";
import Footer from "../components/Footer";
import { useNavigate } from "react-router-dom";

const Sign = () => {
  const navigate = useNavigate();
  const { user } = useAuthenticator((context) => [context.user]); // get the user object from the Authenticator context

  useEffect(() => {
    if (user) {
      navigate("/"); // redirect to the home page if the user is signed in
    }
  }, [user, navigate]);

  return (
    <div className="min-h-screen flex flex-col justify-between bg-gray-100">
      <Header />
      <style>
        {`
        [data-amplify-authenticator] {
           --amplify-components-button-primary-background-color: #3C82F6;
            --amplify-components-button-primary-color: white;
            --amplify-components-button-primary-border-color: #3C82F6;
            --amplify-components-button-primary-hover-background-color:rgba(60, 131, 246, 0.7);
           --amplify-components-tabs-item-active-border-color: #3C82F6;
           --amplify-components-tabs-item-active-color: black;
            --amplify-components-button-link-color:rgb(0, 0, 0);
            --amplify-components-button-link-hover-color:rgba(0, 0, 0, 0.7);
        }

        [data-amplify-button]:active {
           --amplify-components-button-primary-background-color: rgba(60, 82, 246, 0.9); 
           --amplify-components-button-primary-color: white;
           }
          `}
      </style>
      <main className="flex-grow flex items-center justify-center">
        <Authenticator loginMechanisms={["email"]} />
      </main>
      <Footer />
    </div>
  );
};

export default Sign;
