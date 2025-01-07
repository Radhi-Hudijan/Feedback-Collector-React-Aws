import React from "react";
import { Authenticator } from "@aws-amplify/ui-react";
import "@aws-amplify/ui-react/styles.css";

const Sign = () => {
  return (
    <Authenticator
    formFields={{
      signUp: {
        username: {
          placeholder: "Enter your Username",
          isRequired: true,
        },
        email: {
          placeholder: "Enter your email",
          isRequired: true,
        },
        
      },
    }}
    >
      {({ signOut, user }) => (
        <div>
          <p>Welcome, {user.username}</p>
          <button onClick={signOut}>Sign out</button>
        </div>
      )}
    </Authenticator>
  );
};

export default Sign;
