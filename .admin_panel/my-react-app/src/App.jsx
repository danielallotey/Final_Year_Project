import React from "react";
import AppRoutes from "./routes/app-routes";
import DashboardLayout from "./components/layouts/dashboard-layout";
import UserDashboard from "./pages/user-dashboard/user-dashboard";
import BusinessDashboard from "./pages/business-dashboard/business-dashboard";

const App = () => {
  return (
    <div className="App">
      <AppRoutes />

      {/* <DashboardLayout>
        <UserDashboard />
        <BusinessDashboard />
      </DashboardLayout> */}
    </div>
  );
};

export default App;
