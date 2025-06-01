import React from "react";
import { Routes, Route } from "react-router-dom";
import Login from "../pages/Login";
import UserDashboard from "../pages/user-dashboard/user-dashboard";
import BusinessDashboard from "../pages/business-dashboard/business-dashboard";
import DashboardLayout from "../components/layouts/dashboard-layout";

const AppRoutes = () => {
  return (
    <Routes>
      {/* Dashboard routes inside layout */}
      <Route element={<DashboardLayout />}>
        <Route path="/user-dashboard" element={<UserDashboard />} />
        <Route path="/business-dashboard" element={<BusinessDashboard />} />
      </Route>
    </Routes>
  );
};

export default AppRoutes;
