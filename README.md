# DCM - DAO Contributor Marketplace

Starknet Hackathon Paris 2022 // Creating DAO tooling for finding contributors

DAO Contributor Marketplace(DCM) is a platform to connect DAOs and Contributors.

We a service platform that connects DAOs to individual and independent professionals
across the globe. These professionals work as contributors for DAOs to achieve certain 
tasks and goals for the DAO.
Once a contributor and a DAO is matched, there is an Escrow being created for them and payment is facilitated through the escrow.

**** What's in this repo? ******

- Front End Repo

Front End is a React App that is used for *wallet connect* and *contract calls*.

Wallet Integrations:
* Argent
* Braavos

Contracts:
* Cairo contracts

- Contract Repo

Contract Repository consists of:

* Warped Cairo Contracts (DCM and Escrow)
* Base Solidity Contract
* Contract ABIs and Compiled Contracts(json)


******** Contract Information *********

DCM Contract: https://goerli.voyager.online/contract/0x01483547e97fbd070c3d17a802db033017e3b5b13017f23da9e2fb21559077b7#transactions

Escrow Contract: https://goerli.voyager.online/contract/0x0703314998148f32a707df2c1eebf5649af108ecb3ac7f360084805026de26fa#writeContract

****** ASPECT NFT APIs ********

We would be using the ASPECT APIs to fetch the NFTs for a contributor. There would be NFTs native to the user as well as NFTs issued by the platform, which would act as the proof of work for the contributor.

ERC721 Contract: https://goerli.voyager.online/contract/0x07ed9ca271a5537c68c6c8a00c0a878ae972c6bc8e714e1cbf0b1358ee33d986#writeContract
