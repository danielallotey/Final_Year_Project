"use client";
import { useEffect, useState } from "react";
import { collection, addDoc, doc, updateDoc } from "firebase/firestore";
import { db } from "../../firebase";
import toast from "react-hot-toast";

const AmenityForm = ({ onClose, onSuccess, initialData = null }) => {
  const [formData, setFormData] = useState({
    name: "",
    location: "",
    status: "Pending",
    image: "",
  });
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (initialData) {
      setFormData({
        name: initialData.name || "",
        location: initialData.location || "",
        status: initialData.status || "Pending",
        image: initialData.image || "",
      });
    }
  }, [initialData]);

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);

    try {
      if (initialData && initialData.id) {
        const docRef = doc(db, "amenities", initialData.id);
        await updateDoc(docRef, {
          ...formData,
          updatedAt: new Date(),
        });
        toast.success("Amenity updated successfully!");
      } else {
        await addDoc(collection(db, "amenities"), {
          ...formData,
          createdAt: new Date(),
        });
        toast.success("Amenity added successfully!");
      }

      onSuccess();
      onClose();
    } catch (error) {
      console.error("Error saving amenity:", error);
      toast.error("Failed to save amenity. Please try again.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <div className="form-group">
        <label htmlFor="name">Amenity Name *</label>
        <input
          type="text"
          id="name"
          name="name"
          value={formData.name}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="location">Location *</label>
        <input
          type="text"
          id="location"
          name="location"
          value={formData.location}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="status">Status</label>
        <select
          id="status"
          name="status"
          value={formData.status}
          onChange={handleChange}
        >
          <option value="Pending">Pending</option>
          <option value="Approved">Approved</option>
        </select>
      </div>

      <div className="form-group">
        <label htmlFor="image">Image URL</label>
        <input
          type="url"
          id="image"
          name="image"
          value={formData.image}
          onChange={handleChange}
        />
      </div>

      <div className="form-actions">
        <button type="button" className="btn btn-secondary" onClick={onClose}>
          Cancel
        </button>
        <button
          type="submit"
          className="btn bg-[#4f46e5] text-white"
          disabled={loading}
        >
          {loading
            ? initialData
              ? "Updating..."
              : "Adding..."
            : initialData
            ? "Update Amenity"
            : "Add Amenity"}
        </button>
      </div>
    </form>
  );
};

export default AmenityForm;
