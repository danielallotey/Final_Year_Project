import "./amenity-details.css";
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { doc, getDoc } from "firebase/firestore";
import { db } from "../../firebase";

const AmenityDetails = () => {
  const { id } = useParams();
  const [amenity, setAmenity] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchAmenity = async () => {
      try {
        const docRef = doc(db, "amenities", id);
        const docSnap = await getDoc(docRef);

        if (docSnap.exists()) {
          setAmenity({ id: docSnap.id, ...docSnap.data() });
        } else {
          console.error("Amenity not found");
        }
      } catch (error) {
        console.error("Error fetching amenity:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchAmenity();
  }, [id]);

  if (loading) return <p>Loading amenity...</p>;
  if (!amenity) return <p>Amenity not found.</p>;

  return (
    <div className="amenity-details-card">
      <img
        src={amenity.image || "/placeholder.svg"}
        alt={amenity.name}
        className="amenity-image"
      />
      <div className="details-content">
        <h2 className="amenity-name">{amenity.name}</h2>
        <p>
          <strong>ID:</strong> {amenity.id}
        </p>
        <p>
          <strong>Location:</strong> {amenity.location}
        </p>
        <p>
          <strong>Status:</strong> {amenity.status}
        </p>
      </div>
    </div>
  );
};

export default AmenityDetails;
