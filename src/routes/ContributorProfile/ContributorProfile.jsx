import Layout from "../layout";
import { useParams } from "react-router-dom";
import mockData from "../../assets/sample-response.json";
import Bear1 from "../../assets/img/bear-1.jpg";
import "./ContributorProfile.css";
import { Divider, Button, Chip } from "@mui/material";
import CheckCircleOutlineIcon from '@mui/icons-material/CheckCircleOutline';
import FavoriteBorderIcon from '@mui/icons-material/FavoriteBorder';
import InfoIcon from '@mui/icons-material/Info';
import SearchIcon from '@mui/icons-material/Search';
import escrowContractAbi from "../../assets/DCMEscrow_contract_abi.json";
import mainContractAbi from "../../assets/DCMFinal_contract_abi.json";
import { getStarknet } from "get-starknet";
import { useState } from "react";
import Modal from 'react-modal';
import { flexbox } from "@mui/system";

export default function ContributorProfile() {
    const [isModalOpen, setIsModalOpen] = useState(false);

    const openModal = () => {
        setIsModalOpen(true);
    };

    const closeModal = () => {
        setIsModalOpen(false);
    };

    const handleSubmit = (event) => {
        event.preventDefault();
        createEscrow();
    }

    const customStyles = {
        content: {
          top: '50%',
          left: '50%',
          right: 'auto',
          bottom: 'auto',
          marginRight: '-50%',
          transform: 'translate(-50%, -50%)',
        },
      };

    const escrowContract = '0x0703314998148f32a707df2c1eebf5649af108ecb3ac7f360084805026de26fa';
    const mainContract = '0x01483547e97fbd070c3d17a802db033017e3b5b13017f23da9e2fb21559077b7';


    const contributorId = useParams().id;

    const contributorData = mockData.filter(contributor => contributor.user == contributorId)[0];



    function createEscrow() {
    
        console.log("create escrow called");
            const wallet = getStarknet();
            if (!wallet.isConnected) {
                console.log("Wallet not connected!");
                return undefined;
            };
    
            const address = wallet.account.address;
            console.log("address", address);
            wallet.provider.callContract(
                    {
                        contractAddress: escrowContract,
                        entrypoint: "createEscrow",
                        calldata: [650000000000000, 123, 237007096079816496001586, 237043989567963915104818, address, 0x0135aeB7a5B989712C85Ae5044d47C755d86CbdD8A70FC4baCfbbd7e3DB2c710],
                    },
                    { blockIdentifier: "pending" }
                ).then((res) => {
                    console.log("result from calling escrow", res);
                    return res;
                }).catch(() => {
                console.log("catch block reached");
                return undefined;
            })
    }

    return (
        <Layout>
            <div className="profile-container">
                <div className="profile-column-1">
                    <img src={Bear1} className="profile-picture"></img>
                    <div className="profile-description header">
                        Description
                    </div>
                    <div className="profile-details">
                        <div className="header">Details</div>
                        <Divider />
                        <div className="profile-details-container">
                            <div className="profile-detail"><span >Contract Address</span><span>0x85f7Db219F0a1D4749125581F21147...</span></div>
                            <div className="profile-detail"><span>Token ID</span><span>Token ID</span></div>
                            <div className="profile-detail"><span className="profile-detail">Blockchain</span><span>Starknet</span></div>
                        </div>
                    </div>
                    <Button onClick={() => openModal()} sx={{mt: 2}} variant="contained" color="success">Make Offer</Button>
                </div>
                <div className="profile-column-2">
                    <div className="profile-intro">
                        <div className="profile-title">
                            <span>{contributorData.role}</span>
                            <Chip className="skill-chip" label="Strategy" variant="outlined" />
                            <Chip className="skill-chip" label="Wireframing" variant="outlined" />
                            <Chip className="skill-chip" label="UI Design" variant="outlined" />
                            <FavoriteBorderIcon/>
                        </div>
                        <div className="profile-abstract">
                            <p>
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quidem perferendis placeat odit expedita possimus enim ratione officiis, similique dolores in cum neque deserunt aut quod natus quis quibusdam, iusto ab?
                        </p>
                        </div>
                        <div className="profile-attributes">
                            <div className="attribute availability"> 
                            <CheckCircleOutlineIcon color="success"/>
                            <span>Available</span></div>
                            <div className="attribute rate"> <InfoIcon color="secondary"/><span>{contributorData.avgRatePerHour + ' $/hour'}</span></div>
                            <div className="attribute verified"> <SearchIcon/><span> Verified </span></div>
                        </div>
                    </div>
                </div>
                <div>
      <Modal
        isOpen={isModalOpen}
        onRequestClose={closeModal}
        style={customStyles}
        contentLabel="Example Modal"
        clasName="project-modal"
      >
        <div className="modal-header">
            <span className="modal-title">
            <h2>Project Details</h2>
            </span>
        <button onClick={closeModal} className="close-button">X</button>
        </div>
       
        <div>
        <form onSubmit={handleSubmit} className="project-modal-form">
            <div className="form-child">
        <label className="form-child-label">
          <span>Project Description</span>
          <textarea name="description" />
        </label>
        </div>
        <div className="form-child">
        <label className="form-child-label">
            <span>
          Amount to be paid (ETH)
          </span>
          <input type="text" name="amount" />
        </label>
        </div>
        <div className="form-child">
        <label className="form-child-label">
            <span>
            Project Start Date
            </span>
        <input type="date" name="date" />
        </label>
        </div>
        <div className="form-child">
        <label className="form-child-label">
            <span>
            Project End Date
            </span>
        <input type="date" name="date" />
        </label>
        </div>
        {/* <input type="submit" value="Make an offer" /> */}
        <div className="submit-container">
        <Button type="submit" variant="contained" color="success" className="submit-button">Make Offer</Button>
        </div>
        </form>
        </div>
        
    
      </Modal>
    </div>
            </div>
        </Layout>
        )
}