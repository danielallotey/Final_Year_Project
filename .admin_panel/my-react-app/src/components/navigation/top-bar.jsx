import "./top-bar.css";
import { signOut } from "firebase/auth";
import { auth } from "../../firebase";
import { useNavigate } from "react-router-dom";

import {
  SearchIcon,
  ChevronDownIcon,
  PlusIcon,
  LogOutIcon,
} from "../icons/icons";

const TopBar = ({ onToggleAdminPanel, isAdminPanelOpen }) => {
  const navigate = useNavigate();

  const handleLogout = async () => {
    try {
      await signOut(auth);
      navigate("/admin-login");
    } catch (error) {
      console.error("Error signing out:", error);
    }
  };

  return (
    <div className="top-bar">
      <div className="search-container">
        <div className="search-box">
          <SearchIcon />
          <input type="text" placeholder="Search keyword..." />
        </div>
      </div>
      <div className="top-bar-actions">
        <div className="filter-button">
          Filter <ChevronDownIcon />
        </div>
        <button className="add-new-button">
          <PlusIcon /> Add New
        </button>
        <button className="icon-button" onClick={handleLogout} title="Logout">
          <LogOutIcon />
        </button>
        <button
          className={`toggle-admin-button ${isAdminPanelOpen ? "active" : ""}`}
          onClick={onToggleAdminPanel}
        >
          <ChevronDownIcon />
        </button>
      </div>
    </div>
  );
};

export default TopBar;
