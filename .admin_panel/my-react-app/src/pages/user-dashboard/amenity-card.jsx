import "./amenity-card.css";
import { useNavigate } from "react-router-dom";

const AmenityCard = ({ id, name, location, status, image, onEdit }) => {
  const navigate = useNavigate();

  const handleNavigate = () => {
    navigate(`/amenities/${id}`);
  };

  const handleEdit = () => {
    onEdit({
      id,
      name,
      location,
      status,
      image,
    });
  };
  return (
    <div className="amenity-card">
      <div className="amenity-info">
        <div className="amenity-avatar">
          <img
            className="avatar-placeholder"
            src={image || "/placeholder.svg"}
            alt=""
          />
        </div>
        <div className="amenity-details">
          <h3 className="amenity-name">{name}</h3>
          <div className="amenity-id">
            Amenity ID: <span>{id}</span>
          </div>
          <div className="amenity-meta">
            <div className="meta-item">
              <div className="meta-label">Location</div>
              <div className="meta-value">{JSON.stringify(location)}</div>
            </div>
            <div className="meta-item">
              <div className="meta-label">Status</div>
              <div className="meta-value">{status}</div>
            </div>
          </div>
        </div>
      </div>

      <div className="amenity-actions">
        <button
          className="edit-button"
          onClick={() => onEdit({ id, name, location, status, image })}
        >
          Edit Details
        </button>
        <button className="view-button" onClick={handleNavigate}>
          View Amenity
        </button>
      </div>
    </div>
  );
};

export default AmenityCard;
