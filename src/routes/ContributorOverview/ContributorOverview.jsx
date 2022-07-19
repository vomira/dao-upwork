import { useEffect } from "react";
import Layout from "../layout";
import * as React from 'react';
import SearchBar from "../../components/SearchBar";
import "./ContributorOverview.css";
import { Button, Paper } from "@mui/material";
import ContributorCard from "../../components/ContributorCard/ContributorCard";
import mockData from "../../assets/sample-response.json";
import "./ContributorOverview.css";

export default function ContributorOverview(props) {
    return (
        <Layout>
      <div style={{ padding: "1rem 0" }} className="contributor-container">
        <div>
        <h2>Explore Contributors</h2>

<div className="search-bar">
       <SearchBar></SearchBar>
       </div>
       <div className="filter-button-container">
        <Button variant='contained'>UI/UX Designer</Button>
        <Button variant='text'>Developer</Button>
        <Button variant='text'>Marketing</Button>
        <Button variant='text'>NFT Artist</Button>
        <Button variant='text'>Biz Dev</Button>
        <Button variant='text'>Operations</Button>
       </div>
       </div>

      <Paper elevation={2} className="contributor-overlay">
        <h2 className="contributor-overlay-title">All Contributors</h2>
        <div className="contributor-card-container">
        {mockData.map((contributor, index) => {
            return <ContributorCard className="contributor-card" user={contributor.user} name={contributor.name} role={contributor.role} description={contributor.description} linkedIn={contributor.linkedIn} github={contributor.github} ratePerHour={contributor.avgRatePerHour} numOfProjects={contributor.numProjects} key={index}></ContributorCard>
        })}
        </div>
      </Paper>
      
      </div>
      </Layout>
    );
  }