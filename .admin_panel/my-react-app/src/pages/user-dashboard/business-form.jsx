"use client";
import { useEffect, useState } from "react";
import { collection, addDoc, doc, updateDoc } from "firebase/firestore";
import { db } from "../../firebase";
import toast from "react-hot-toast";

const BusinessForm = ({ onClose, onSuccess, initialData = null }) => {
  const [formData, setFormData] = useState({
    name: "",
    category: "",
    owner: "",
    contact: "",
    description: "",
    image: "",
  });
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (initialData) {
      setFormData({
        name: initialData.name || "",
        category: initialData.category || "",
        owner: initialData.owner || "",
        contact: initialData.contact || "",
        description: initialData.description || "",
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
        const docRef = doc(db, "businesses", initialData.id);
        await updateDoc(docRef, {
          ...formData,
          updatedAt: new Date(),
        });
        toast.success("Business updated successfully!");
      } else {
        await addDoc(collection(db, "businesses"), {
          ...formData,
          createdAt: new Date(),
        });
        toast.success("Business added successfully!");
      }

      onSuccess();
      onClose();
    } catch (error) {
      console.error("Error saving business:", error);
      toast.error("Failed to save business. Please try again.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      {/* Business Name */}
      <div className="form-group">
        <label htmlFor="name">Business Name *</label>
        <input
          type="text"
          id="name"
          name="name"
          value={formData.name}
          onChange={handleChange}
          required
        />
      </div>

      {/* Category */}
      <div className="form-group">
        <label htmlFor="category">Category *</label>
        <select
          id="category"
          name="category"
          value={formData.category}
          onChange={handleChange}
          required
        >
          <option value="">Select Category</option>
          <option value="restaurant">Restaurant</option>
          <option value="retail">Retail</option>
          <option value="service">Service</option>
          <option value="healthcare">Healthcare</option>
          <option value="education">Education</option>
          <option value="other">Other</option>
        </select>
      </div>

      {/* Owner */}
      <div className="form-group">
        <label htmlFor="owner">Owner *</label>
        <input
          type="text"
          id="owner"
          name="owner"
          value={formData.owner}
          onChange={handleChange}
          required
        />
      </div>

      {/* Contact */}
      <div className="form-group">
        <label htmlFor="contact">Contact</label>
        <input
          type="text"
          id="contact"
          name="contact"
          value={formData.contact}
          onChange={handleChange}
        />
      </div>

      {/* Description */}
      <div className="form-group">
        <label htmlFor="description">Description</label>
        <textarea
          id="description"
          name="description"
          value={formData.description}
          onChange={handleChange}
          placeholder="Enter a brief description..."
        />
      </div>

      {/* Image URL */}
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

      {/* Actions */}
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
            ? "Update Business"
            : "Add Business"}
        </button>
      </div>
    </form>
  );
};

export default BusinessForm;
