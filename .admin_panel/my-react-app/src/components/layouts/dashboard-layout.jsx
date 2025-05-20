
import { useState } from "react";
import { Outlet } from "react-router-dom"; 
import Sidebar from "../navigation/sidebar";
import TopBar from "../navigation/top-bar";
import AdminPanel from "../admin/admin-panel";
import "./dashboard-layout.css";

const DashboardLayout = () => {
  const [isAdminPanelOpen, setIsAdminPanelOpen] = useState(true);

  const toggleAdminPanel = () => {
    setIsAdminPanelOpen(!isAdminPanelOpen);
  };

  return (
    <div className="dashboard-layout">
      <Sidebar />
      <div className="main-content-wrapper">
        <TopBar
          onToggleAdminPanel={toggleAdminPanel}
          isAdminPanelOpen={isAdminPanelOpen}
        />
        <div className="content-area">
          <main
            className={`main-content ${!isAdminPanelOpen ? "full-width" : ""}`}
          >
            <Outlet /> 
          </main>
          {isAdminPanelOpen && <AdminPanel />}
        </div>
      </div>
    </div>
  );
};

export default DashboardLayout;
