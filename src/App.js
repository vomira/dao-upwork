import React, { useState, useEffect } from 'react';
import './App.css';
import { Route, Routes } from 'react-router-dom';
import Dashboard from './routes/dashboard';
import Projects from './routes/projects';
import Login from './routes/Login/login';
import { StarknetProvider } from '@starknet-react/core'
import ContributorOverview from './routes/ContributorOverview/ContributorOverview';
import ContributorProfile from './routes/ContributorProfile/ContributorProfile';
import { getStarknet, connect } from 'get-starknet';

function App() {

  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [ userRole, setUserRole ] = useState("dao");

  const handleLogin = (newValue) => {
    setIsLoggedIn(newValue);
  }

  return (
    <StarknetProvider>
    <div className="wrapper">
      <Routes>
      {!isLoggedIn && <Route path="/" element={<Login handleLogin={handleLogin}/>} />}
      {isLoggedIn && <Route path="/" element={<ContributorOverview />} />}
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/projects" element={<Projects />} />
          <Route path="/explore" element={<ContributorOverview />} />
          <Route path="/contributor/:id" element={<ContributorProfile />} />
  
      </Routes>

    </div>

    </StarknetProvider>
  );
}

export default App;