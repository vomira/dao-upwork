// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface IERC20 {
  function mint(address to, uint256 amount) external returns (bool);

  function balanceOf(address account) external view returns (uint256);

  function decimals() external pure returns (uint8);

  function transferFrom(
    address sender,
    address recipient,
    uint256 amount
  ) external returns (bool);
}

contract DCMEscrow {

    uint _escrowIds = 0;
    address eth_contract_address;
    
    struct Escrow {
        uint escrowId;
        uint amount;
        uint projectId;
        uint projectStartDate;
        uint projectEndDate;
        address payer;
        address payee;
    }

    event EscrowCreated(uint eId, uint pId);

    mapping(uint => Escrow) idToEscrowMapping;
    
    constructor(address contract_addr) {
        eth_contract_address = contract_addr;
    }

    function createEscrow(uint _amount, uint _projectId, uint _projectStartDate, uint _projectEndDate, address _payee, address _payer) public returns(uint) {
        _escrowIds += 1;
        idToEscrowMapping[_escrowIds] = Escrow(_escrowIds, _amount, _projectId, _projectStartDate, _projectEndDate, _payer, _payee);

        return _escrowIds;
        
    }

    function escrowSettle(uint eId) public {
        Escrow storage e = idToEscrowMapping[eId];
        IERC20(eth_contract_address).transferFrom(e.payer, e.payee, e.amount);
    }


    //******** GET FUNCTIONS *******************//

    function getEscrow(uint eId) public view returns(Escrow memory) {
        return idToEscrowMapping[eId];
    }
}

contract DCM {

    uint _projectIds = 0;
    address escrow_contract_address;

    enum ProjectStatus {
        INITIATED,
        INREVIEW,
        COMPLETED
    }

    struct DAO {
        string name;
        string description;
        address uniqueAddress; //For eventual gating purposes
        uint numBounties;
    }

    struct Contributor {
        address user;
        string name;
        string description;
        string linkedIn;
        string github;
        uint avgRatePerHour;
        uint numProjects;
    }

    struct Project {
        uint id;
        string name;
        string description;
        uint maxCompensation;
        uint startDate;
        uint endDate;
        address dao;
        address user;
        ProjectStatus status;
    }

    Contributor[] contributors;
    Project[] projects;

    event EscrowCreated(address indexed escrowAddress, uint indexed amount, uint indexed projectId);
    event EscrowSettled(uint projectId);


    //Project -> Escrow Contract
    mapping(uint => address) projectToEscrowMap;

    // Project ID -> Escrow ID
    mapping(uint => uint) projectIdToEscrowId;

    //Project ID -> Project Struct
    mapping(uint => Project) projectIdToProjectMap;

    //User ID -> User Struct
    mapping(address => Contributor) contributorIdToUserMap;

    constructor(address contract_addr) {
        escrow_contract_address = contract_addr;
    }

    //***************** Write functions *****************//
    
    //Add a new contributor
    function createContributor(string memory _name, string memory _description, string memory _linkedIn, string memory _github, uint _averageRatePerHour) public returns(address) {
        contributorIdToUserMap[msg.sender] = Contributor(msg.sender, _name, _description, _linkedIn, _github, _averageRatePerHour, 0);
        contributors.push(contributorIdToUserMap[msg.sender]);

        return msg.sender;
    }

    function createProject(string memory _name, string memory _description, uint _maxCompensation, uint _startDate, uint _endDate, address _dao, address _contributor) internal returns(uint) {
        _projectIds = _projectIds + 1;
        uint projectId = _projectIds;

        projectIdToProjectMap[projectId] = Project(projectId, _name, _description, _maxCompensation, _startDate, _endDate, _dao, _contributor, ProjectStatus.INREVIEW);

        projects.push(projectIdToProjectMap[projectId]);

        return projectId;
    }

    //Current logic states that the one who is invited is auomatically going to work on the project, not for production
    //MaxCompensation = x*10^18
    function inviteContributor(address contributor, string memory _name, string memory _description, uint _maxCompensation, uint _startDate, uint _endDate) public payable {
        //1. Create a Project
        uint projectId = createProject(_name, _description, _maxCompensation, _startDate, _endDate, msg.sender, contributor);

        //2. Spin up an escrow with maxCompensation
        projectToEscrowMap[projectId] = escrow_contract_address;
        uint eId = DCMEscrow(escrow_contract_address).createEscrow(_maxCompensation, projectId, _startDate, _endDate, contributor, msg.sender);
        projectIdToEscrowId[projectId] = eId;

    }

    function approveProject(uint projectId) external {
        //DCMEscrow escrowContract = DCMEscrow(projectToEscrowMap[projectId]);
        uint eId = projectIdToEscrowId[projectId];             
        DCMEscrow(escrow_contract_address).escrowSettle(eId);

        //Project storage project = projectIdToProjectMap[projectId];
        //project.status = ProjectStatus.COMPLETED;

    }
    //******************* Read functions *****************//

    //Get contributor details from their address
    function getAllContributors(address _contributor) public view returns(string memory, string memory, uint) {
        return (contributorIdToUserMap[_contributor].name, contributorIdToUserMap[_contributor].description, contributorIdToUserMap[_contributor].avgRatePerHour);
    } 

    function getProjectFromId(uint projectId) public view returns(uint, uint,  address, address) {
        return (projectIdToProjectMap[projectId].id, projectIdToProjectMap[projectId].maxCompensation, projectIdToProjectMap[projectId].dao, projectIdToProjectMap[projectId].user);
    }

}
