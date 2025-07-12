import "./dashboard.css";
import StatCard from "./stat-card";
import TabNavigation from "./tab-navigation";
import UserCard from "./user-card";
import AmenityCard from "./amenity-card";
import BusinessCard from "./business-card";
import Modal from "./modal";
import UserForm from "./user-form";
import AmenityForm from "./amenity-form";
import BusinessForm from "./business-form";
import { useEffect, useState } from "react";
import { collection, getDocs, getCountFromServer } from "firebase/firestore";
import { db } from "../../firebase";
import defaultUserImage from "../../assets/user.jpg";

const UserDashboard = () => {
  const [stats, setStats] = useState([
    { title: "Total Users", value: "..." },
    { title: "Total Amenities", value: "..." },
    { title: "Total Businesses", value: "..." },
    { title: "Pending Approval", value: "..." },
  ]);

  const tabs = ["Amenities", "Business", "Users"];
  const [activeTab, setActiveTab] = useState("Users");
  const [users, setUsers] = useState([]);
  const [amenities, setAmenities] = useState([]);
  const [businesses, setBusinesses] = useState([]);
  const [loading, setLoading] = useState(true);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingAmenity, setEditingAmenity] = useState(null);
  const [editingUser, setEditingUser] = useState(null);
  const [editingBusiness, setEditingBusiness] = useState(null);

  useEffect(() => {
    const fetchStats = async () => {
      try {
        const userSnap = await getCountFromServer(collection(db, "users"));
        const amenitySnap = await getCountFromServer(
          collection(db, "amenities")
        );
        const businessSnap = await getCountFromServer(
          collection(db, "businesses")
        );

        setStats([
          { title: "Total Users", value: userSnap.data().count.toString() },
          {
            title: "Total Amenities",
            value: amenitySnap.data().count.toString(),
          },
          {
            title: "Total Businesses",
            value: businessSnap.data().count.toString(),
          },
          { title: "Pending Approval", value: "46,000" },
        ]);
      } catch (error) {
        console.error("Error fetching stats:", error);
      }
    };
    fetchStats();
  }, []);

  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      try {
        let colRef;
        if (activeTab === "Users") colRef = collection(db, "users");
        if (activeTab === "Amenities") colRef = collection(db, "amenities");
        if (activeTab === "Business") colRef = collection(db, "businesses");

        const snapshot = await getDocs(colRef);
        const dataList = snapshot.docs.map((doc) => ({
          id: doc.id,
          ...doc.data(),
        }));

        if (activeTab === "Users") setUsers(dataList);
        if (activeTab === "Amenities") setAmenities(dataList);
        if (activeTab === "Business") setBusinesses(dataList);
      } catch (error) {
        console.error(`Error fetching ${activeTab.toLowerCase()}:`, error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [activeTab]);

  const handleTabChange = (tab) => {
    setActiveTab(tab);
  };

  const handleAddNew = () => {
    setEditingUser(null);
    setEditingAmenity(null);
    setEditingBusiness(null);
    setIsModalOpen(true);
  };

  const handleCloseModal = () => {
    setIsModalOpen(false);
  };

  const handleSuccess = (message) => {
    alert(message);
    setIsModalOpen(false);
    setEditingUser(null);
    setEditingAmenity(null);
    setEditingBusiness(null);

    const fetchData = async () => {
      setLoading(true);
      try {
        let colRef;
        if (activeTab === "Users") colRef = collection(db, "users");
        if (activeTab === "Amenities") colRef = collection(db, "amenities");
        if (activeTab === "Business") colRef = collection(db, "businesses");

        const snapshot = await getDocs(colRef);
        const dataList = snapshot.docs.map((doc) => ({
          id: doc.id,
          ...doc.data(),
        }));

        if (activeTab === "Users") setUsers(dataList);
        if (activeTab === "Amenities") setAmenities(dataList);
        if (activeTab === "Business") setBusinesses(dataList);
      } catch (error) {
        console.error(`Error refreshing ${activeTab.toLowerCase()}:`, error);
      } finally {
        setLoading(false);
      }
    };
    fetchData();
  };

  const getModalTitle = () => {
    if (editingUser || editingAmenity || editingBusiness)
      return `Edit ${activeTab.slice(0, -1)}`;
    return `Add New ${activeTab.slice(0, -1)}`;
  };

  const renderModalForm = () => {
    switch (activeTab) {
      case "Users":
        return (
          <UserForm
            initialData={editingUser}
            onClose={handleCloseModal}
            onSuccess={handleSuccess}
          />
        );
      case "Amenities":
        return (
          <AmenityForm
            initialData={editingAmenity}
            onClose={handleCloseModal}
            onSuccess={handleSuccess}
          />
        );
      case "Business":
        return (
          <BusinessForm
            initialData={editingBusiness}
            onClose={handleCloseModal}
            onSuccess={handleSuccess}
          />
        );
      default:
        return null;
    }
  };

  const renderContent = () => {
    if (loading) return <p>Loading {activeTab.toLowerCase()}...</p>;

    switch (activeTab) {
      case "Users":
        return (
          <div className="users-grid">
            {users.map((user) => (
              <UserCard
                key={user.id}
                {...user}
                image={user.image || defaultUserImage}
                onEdit={() => {
                  setEditingUser(user);
                  setIsModalOpen(true);
                }}
              />
            ))}
          </div>
        );
      case "Amenities":
        return (
          <div className="amenities-grid">
            {amenities.map((amenity) => (
              <AmenityCard
                key={amenity.id}
                {...amenity}
                onEdit={() => {
                  setEditingAmenity(amenity);
                  setIsModalOpen(true);
                }}
              />
            ))}
          </div>
        );
      case "Business":
        return (
          <div className="businesses-grid">
            {businesses.map((business) => (
              <BusinessCard
                key={business.id}
                {...business}
                onEdit={() => {
                  setEditingBusiness(business);
                  setIsModalOpen(true);
                }}
              />
            ))}
          </div>
        );
      default:
        return null;
    }
  };

  return (
    <div className="dashboard">
      <div className="dashboard-header">
        <h1>Dashboard</h1>
        <p className="welcome-text">Welcome Back!</p>
      </div>

      <section className="quick-stats">
        <h2>Quick Stats</h2>
        <div className="stats-grid">
          {stats.map((stat, index) => (
            <StatCard key={index} title={stat.title} value={stat.value} />
          ))}
        </div>
      </section>

      <section className="data-section">
        <div className="section-header">
          <TabNavigation
            tabs={tabs}
            activeTab={activeTab}
            onTabChange={handleTabChange}
          />
          <button className="add-new-btn" onClick={handleAddNew}>
            Add New {activeTab.slice(0, -1)}
          </button>
        </div>
        {renderContent()}
      </section>

      <Modal
        isOpen={isModalOpen}
        onClose={handleCloseModal}
        title={getModalTitle()}
      >
        {renderModalForm()}
      </Modal>
    </div>
  );
};

export default UserDashboard;
