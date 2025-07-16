"use client";

import "./tab-navigation.css";

const TabNavigation = ({ tabs, activeTab, onTabChange }) => {
  return (
    <div className="tab-navigation">
      {tabs.map((tab) => (
        <button
          key={tab}
          onClick={() => onTabChange(tab)}
          className={`tab ${tab === activeTab ? "active" : ""}`}
        >
          {tab}
        </button>
      ))}
    </div>
  );
};

export default TabNavigation;
