import React from "react";
import { Routes, Route } from "react-router-dom";
import AdminLogin from "../pages/auth/admin-login";
import DashboardLayout from "../components/layouts/dashboard-layout";
import UserDashboard from "../pages/user-dashboard/user-dashboard";
import BusinessDashboard from "../pages/business-dashboard/business-dashboard";

const AppRoutes = () => {
  return (
    <Routes>
      <Route path="/" element={<AdminLogin />} />

      <Route path="/dashboard/*" element={<DashboardLayout />}>
        <Route index element={<UserDashboard />} />
        <Route path="business" element={<BusinessDashboard/>}/>
        
        
      </Route>
    </Routes>
  );
};

export default AppRoutes;
