import "./notification-item.css"; // Import the CSS file for styling
import { AlertCircleIcon, MessageSquareIcon } from "../icons/icons";

const NotificationItem = ({ type, title, message }) => {
  return (
    <div className="notification-item">
      <div className={`notification-icon ${type}`}>
        {type === "warning" ? <AlertCircleIcon /> : <MessageSquareIcon />}
      </div>
      <div className="notification-content">
        <h4 className="notification-title">{title}</h4>
        <p className="notification-message">{message}</p>
      </div>
    </div>
  );
};

export default NotificationItem;
