import React from "react";
import { Routes, Route } from "react-router-dom";
import Login from "./pages/auth/admin-login";
import UserDashboard from "./pages/user-dashboard/user-dashboard";
import BusinessDashboard from "./pages/business-dashboard/business-dashboard";
import DashboardLayout from "./components/layouts/dashboard-layout";
import PrivateRoute from "./components/routeprotection/PrivateRoute";

const AppRoutes = () => {
  return (
    <Routes>
      {/* Public Route */}
      <Route path="/" element={<Login />} />
      <Route path="/login" element={<Login />} />

      {/* Protected Routes inside Layout */}
      <Route
        element={
          <PrivateRoute>
            <DashboardLayout />
          </PrivateRoute>
        }
      >
        <Route path="/user-dashboard" element={<UserDashboard />} />
        <Route path="/business-dashboard" element={<BusinessDashboard />} />
      </Route>
    </Routes>
  );
};

export default AppRoutes;
