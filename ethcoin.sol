pragma solidity ^0.4.13;

//Creates a coin which is worth exactly one ether.
contract Ethcoin {

    mapping(address => uint256) private balances;

    /// Is this constructor necessary?
    function Ethcoin() {
    }


    //TODO: when will this return false?
    function deposit() payable returns (bool) {
        //Prevent overflow errors
        assert(balances[msg.sender]  + msg.value > balances[msg.sender]);
        balances[msg.sender] += msg.value;
        return true;
        //TODO: check for overflow errors
    }

    function withdraw(uint8 amount) returns (bool) {
        //TODO: ensure they have enough money
        require(balances[msg.sender] < amount);
        assert(this.balance - amount>0);
        msg.sender.transfer(amount);
        balances[msg.sender]-=amount;
        return true;
    }

    function checkBalance() external returns (uint256) {
        return balances[msg.sender];
    }
}