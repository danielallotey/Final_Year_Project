import "./top-bar.css";
import {
  SearchIcon,
  ChevronDownIcon,
  PlusIcon,
  LogOutIcon,
} from "../icons/icons";

const TopBar = ({ onToggleAdminPanel, isAdminPanelOpen }) => {
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
        <button className="icon-button">
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
