import * as React from 'react';
import { Link } from 'react-router-dom';
import Paper from '@mui/material/Paper';
import MenuList from '@mui/material/MenuList';
import MenuItem from '@mui/material/MenuItem';
import ListItemIcon from '@mui/material/ListItemIcon';
import DashboardIcon from '@mui/icons-material/Dashboard';
import SupervisedUserCircleRoundedIcon from '@mui/icons-material/SupervisedUserCircleRounded';
import DescriptionIcon from '@mui/icons-material/Description';
import LayersIcon from '@mui/icons-material/Layers';
import "./NavBar.css"

export default function NavBar() {
  return (
    <div className="nav-bar-container">
      <MenuList>
        <MenuItem>
        <Link to="/dashboard">
          <ListItemIcon>
            <DashboardIcon className="icon"/>
          </ListItemIcon>
          
          <span className="item-text">Dashboard</span>
          </Link>
        </MenuItem>
        <MenuItem>
        <Link to="/explore">
          <ListItemIcon >
          <SupervisedUserCircleRoundedIcon className="icon"/>   
          </ListItemIcon>
          
          <span className="item-text">Explore</span>
          </Link>
        </MenuItem>
        <MenuItem>
        <Link to="/projects">
          <ListItemIcon>
            <DescriptionIcon className="icon"/>
          </ListItemIcon>
          
          <span className="item-text">Projects</span>
          </Link>
        </MenuItem>
        <MenuItem>
        <Link to="/explore">
          <ListItemIcon>
            <LayersIcon className="icon"/>
          </ListItemIcon>
          <span className="item-text">Assessment</span>
          </Link>
        </MenuItem>
      </MenuList>
    </div>
  );
}
