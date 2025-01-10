import { useAuthenticator } from "@aws-amplify/ui-react";
import { Navigate, Outlet } from "react-router-dom";

const PrivateRoute = () => {
  const { user } = useAuthenticator((context) => [context.user]);

  return user ? <Outlet /> : <Navigate to="/sign" />;
};

export default PrivateRoute;
