import "./sidebar.css";
import {
  GridIcon,
  FileTextIcon,
  MessageSquareIcon,
  UsersIcon,
  SettingsIcon,
} from "../icons/icons";

const Sidebar = () => {
  return (
    <div className="sidebar">
      <div className="logo">
        <div className="logo-square"></div>
      </div>
      <nav className="sidebar-nav">
        <ul>
          <li className="active">
            <a href="#dashboard">
              <GridIcon />
            </a>
          </li>
          <li>
            <a href="#documents">
              <FileTextIcon />
            </a>
          </li>
          <li>
            <a href="#messages">
              <MessageSquareIcon />
            </a>
          </li>
          <li>
            <a href="#users">
              <UsersIcon />
            </a>
          </li>
          <li>
            <a href="#settings">
              <SettingsIcon />
            </a>
          </li>
        </ul>
      </nav>
    </div>
  );
};

export default Sidebar;
