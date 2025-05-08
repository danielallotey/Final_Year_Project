import "./admin-panel.css";
import NotificationItem from "./notification-item";
import { ChevronRightIcon } from "../icons/icons";
import user from "../../assets/user.jpg"

const AdminPanel = () => {
  const notifications = [
    {
      id: 1,
      type: "warning",
      title: "Booking Reminder",
      message: "Lorem ipsum dolor sit amet, consectetur",
    },
    {
      id: 2,
      type: "message",
      title: "New Message",
      message: "Lorem ipsum dolor sit amet, consectetur",
    },
    {
      id: 3,
      type: "warning",
      title: "Upcoming Booking",
      message: "Lorem ipsum dolor sit amet, consectetur",
    },
  ];

  return (
    <div className="admin-panel">
      <div className="admin-profile">
        <div className="admin-info">
          <div className="admin-title">Admin,</div>
          <h2 className="admin-name">Jonathan!</h2>
          <p className="admin-tip">
            Copy your bio link and paste it in your profile to let people find
            you.
          </p>
        </div>
        <div className="admin-avatar">
          <img className="avatar" src={user} alt="" />
        </div>
      </div>

      <div className="notifications-section">
        <div className="section-header">
          <h3>Notifications</h3>
          <a href="#all" className="view-all">
            View All <ChevronRightIcon />
          </a>
        </div>
        <div className="notifications-list">
          {notifications.map((notification) => (
            <NotificationItem
              key={notification.id}
              type={notification.type}
              title={notification.title}
              message={notification.message}
            />
          ))}
        </div>
      </div>
    </div>
  );
};

export default AdminPanel;
