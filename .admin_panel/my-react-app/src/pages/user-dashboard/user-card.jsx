import "./user-card.css";

const UserCard = ({ id, name, community, contact, image }) => {
  return (
    <div className="user-card">
      <div className="user-info">
        <div className="user-avatar">
          <img className="avatar-placeholder" src={image} alt="" />
        </div>
        <div className="user-details">
          <h3 className="user-name">{name}</h3>
          <div className="user-id">
            User ID: <span>{id}</span>
          </div>

          <div className="user-meta">
            <div className="meta-item">
              <div className="meta-label">Community</div>
              <div className="meta-value">{community}</div>
            </div>
            <div className="meta-item">
              <div className="meta-label">Contact Info</div>
              <div className="meta-value">{contact}</div>
            </div>
          </div>
        </div>
      </div>
      <div className="user-actions">
        <button className="edit-button">Edit Details</button>
        <button className="view-button">View Profile</button>
      </div>
    </div>
  );
};

export default UserCard;
