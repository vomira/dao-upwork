import * as React from 'react';
import Box from '@mui/material/Box';
import Avatar from '@mui/material/Avatar';
import IconButton from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import Tooltip from '@mui/material/Tooltip';
import './TopNav.css';

export default function TopNav() {
  return (
    <React.Fragment>
      <Box sx={{ display: 'flex', alignItems: 'center', textAlign: 'center' }} className="top-nav-container">
        <Typography sx={{ minWidth: 100 }}>Dashboard</Typography>
        <Typography sx={{ minWidth: 100 }}>Settings</Typography>
        <Typography sx={{ minWidth: 100 }}>Help</Typography>
        <Tooltip title="Account settings">
          <IconButton
            size="small"
            sx={{ ml: 2 }}
            aria-controls={'account-menu'}
            aria-haspopup="true"
            aria-expanded={'true'}
          >
            <Typography sx={{ minWidth: 100 }}>Onyx Dao</Typography>
            <Avatar sx={{ width: 32, height: 32 }}>D</Avatar>
          </IconButton>
        </Tooltip>
      </Box>
    </React.Fragment>
  );
}
