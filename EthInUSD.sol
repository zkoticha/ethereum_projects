
/*
 we will use this contract to figure out the ethereum price

*/


pragma solidity ^0.4.8;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract EthInUSD is usingOraclize {

    string public ethPrice;

    event newOraclizeQuery(string description);
    event newEthPrice(string price);

    function EthInUSD() {
        update();
    }

    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) throw;
        ethPrice = result;
    }

    function update() payable {
        newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
        //this xpath doesn't work, was working on it
        oraclize_query('URL', 'html(https://api.gemini.com/v1/pubticker/ethusd).xpath(//*[contains(@class, "gr__api_gemini_com")]/pre()['price'])');
    }
}
