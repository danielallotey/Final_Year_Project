import { useState, useEffect } from "react";
import { collection, addDoc, updateDoc, doc } from "firebase/firestore";
import { db } from "../../firebase";
import toast from "react-hot-toast";

const UserForm = ({ onClose, onSuccess, initialData }) => {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    community: "",
    contact: "",
    image: "",
  });
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (initialData) {
      setFormData(initialData);
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
      if (initialData) {
        const docRef = doc(db, "users", initialData.id);
        await updateDoc(docRef, { ...formData });
        toast.success("User updated successfully!");
      } else {
        await addDoc(collection(db, "users"), {
          ...formData,
          createdAt: new Date(),
        });
        toast.success("User added successfully!");
      }
      onClose();
    } catch (error) {
      console.error("Error saving user:", error);
      toast.error("Failed to save user. Please try again.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <div className="form-group">
        <label htmlFor="name">Name *</label>
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
        <label htmlFor="email">Email *</label>
        <input
          type="email"
          id="email"
          name="email"
          value={formData.email}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="community">Community</label>
        <input
          type="text"
          id="community"
          name="community"
          value={formData.community}
          onChange={handleChange}
        />
      </div>

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
            ? "Update User"
            : "Add User"}
        </button>
      </div>
    </form>
  );
};

export default UserForm;
