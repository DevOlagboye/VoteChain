import React from "react";
import "./AdminWelcome.css";
import { useNavigate } from "react-router";

const AdminWelcome = () => {
  const navigate = useNavigate();
  const handleNavigate = () => {
    navigate("/create-new-poll");
  };
  return (
    <div className="admin-welcome-container">
      <div className="admin-welcome-text-button">
        <div className="admin-welcome-text">
          <h3>Welcome back, Admin</h3>
        </div>
        <div className="admin-welcome-button">
          <button className="create-new-poll-btn" onClick={handleNavigate}>
            Create New Poll
          </button>
        </div>
      </div>
    </div>
  );
};

export default AdminWelcome;
