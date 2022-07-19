import React, { useEffect, useState } from 'react';
import { InputLabel, Select, MenuItem,
  Button,
 } from '@mui/material';
import './login.css';
import { connect, getStarknet } from "get-starknet";
import { Link } from 'react-router-dom';


export default function Login({userRole, handleLogin, isLoggedIn}) {
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  const handleLoginChange = (newValue) => {
    console.log("handler in child called");
    handleLogin(newValue);
  }

//    // silently attempt to connect with a pre-authorized wallet
//    useEffect(() => {
//     connect({ showList: false }).then(wallet => {
//         wallet
//             ?.enable({ showModal: false })
//             .then(() => handleLoginChange(!!wallet?.isConnected));
//     });
// }, []);

const checkForExistingWallet = () => {
  connect({ showList: false }).then(wallet => {
            wallet
                ?.enable({ showModal: false })
                .then(() => {return true});
        });
};

useEffect(() => {
    const connectedState = getStarknet().isConnected;
    if (connectedState !== isLoggedIn) {
        handleLoginChange(connectedState);
    }
});

  return(
   <div className="login-wrapper">
    <h1>Welcome to Contributor Upwork!</h1>
  <div>
  <Button
                    sx={{ mt: 1 }}
                    variant={"contained"}
                    onClick={async () => {
                        try {
                            const wallet = await connect();
                            if (wallet) {
                                wallet.enable({ showModal: true }).then(() => {
                                  handleLoginChange(!!wallet?.isConnected);
                                });
                            }
                        } catch {}
                    }}>
                    {checkForExistingWallet ? "Find Contributors" : "Connect Wallet"}
                </Button>
    </div>
   </div>
  )
}