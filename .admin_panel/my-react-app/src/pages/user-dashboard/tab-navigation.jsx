import "./tab-navigation.css";

const TabNavigation = ({ tabs, activeTab }) => {
  return (
    <div className="tab-navigation">
      {tabs.map((tab) => (
        <a
          key={tab}
          href={`/dashboard/${tab.toLowerCase()}`}
          className={`tab ${tab === activeTab ? "active" : ""}`}
        >
          {tab}
        </a>
      ))}
    </div>
  );
};

export default TabNavigation;
