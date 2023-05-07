pragma solidity ^0.8.3;

contract EtherWallet {
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(unit _amount) external {
        require(msg.sender == owner, "caller is not owner");
        
        payable(msg.sender).transfer(_amount);

        (bool sent,)=msg.sender.call{value: _amount}("");
        require(sent, "Failed to send Ether");
    }
}