import "./business-card.css"; // You'll need to create this CSS file

const BusinessCard = ({ id, name, category, owner, image, onEdit }) => {
  const handleEdit = () => {
    onEdit({
      id,
      name,
      category,
      owner,
      image,
    });
  };
  return (
    <div className="business-card">
      <div className="business-info">
        <div className="business-avatar">
          <img
            className="avatar-placeholder"
            src={image || "/placeholder.svg"}
            alt=""
          />
        </div>
        <div className="business-details">
          <h3 className="business-name">{name}</h3>
          <div className="business-id">
            Business ID: <span>{id}</span>
          </div>
          <div className="business-meta">
            <div className="meta-item">
              <div className="meta-label">Category</div>
              <div className="meta-value">{category}</div>
            </div>
            <div className="meta-item">
              <div className="meta-label">Owner</div>
              <div className="meta-value">{owner}</div>
            </div>
          </div>
        </div>
      </div>
      <div className="business-actions">
        <button className="edit-button" onClick={handleEdit}>
          Edit Details
        </button>
        <button className="view-button">View Business</button>
      </div>
    </div>
  );
};

export default BusinessCard;
