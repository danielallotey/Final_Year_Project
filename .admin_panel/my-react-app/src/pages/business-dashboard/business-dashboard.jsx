import "./Dashboard.css";
import StatCard from "./stat-card";
import TabNavigation from "./tab-navigation";
import UserCard from "./user-card";

const BusinessDashboard = () => {
  const stats = [
    { title: "Total Users", value: "29,345" },
    { title: "Total Amenities", value: "120" },
    { title: "Total Businesses", value: "89" },
    { title: "Pending Approval", value: "46,000" },
  ];

  const tabs = ["Amenities", "Businesses", "Dashboard"];

  const users = [
    {
      id: "#2247654",
      name: "Daniel Allotey",
      community: "Prampram",
      contact: "0555555678",
    },
    {
      id: "#2247654",
      name: "Daniel Allotey",
      community: "Prampram",
      contact: "0555555678",
    },
    {
      id: "#2247654",
      name: "Daniel Allotey",
      community: "Prampram",
      contact: "0555555678",
    },
    {
      id: "#2247654",
      name: "Daniel Allotey",
      community: "Prampram",
      contact: "0555555678",
    },
    {
      id: "#2247654",
      name: "Daniel Allotey",
      community: "Prampram",
      contact: "0555555678",
    },
    {
      id: "#2247654",
      name: "Daniel Allotey",
      community: "Prampram",
      contact: "0555555678",
    },
  ];

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
        <TabNavigation tabs={tabs} activeTab="Businesses" />

        <div className="users-grid">
          {users.map((user, index) => (
            <UserCard
              key={index}
              id={user.id}
              name={user.name}
              community={user.community}
              contact={user.contact}
            />
          ))}
        </div>
      </section>
    </div>
  );
};

export default BusinessDashboard;
