/**
 * SPDX-License-Identifier: UNLICENSED
 */
pragma solidity 0.6.10;
pragma experimental ABIEncoderV2;

import "./interfaces/ControllerInterface.sol";
import "./interfaces/AddressBookInterface.sol";
import "./libs/Actions.sol";

// 0x81E83C6798f05C1Df545a36A82c2EbcbC703C51e
contract MyOperator {
    ControllerInterface controller;
    AddressBookInterface addressBook;

    address private owner;
    constructor(address _addressBookAddress) public {
        addressBook = AddressBookInterface(_addressBookAddress);
        controller = ControllerInterface(addressBook.getController());
    }

    function bullCallSpread(
        address assetAddress,
        address collateralAddress,
        uint buyPrice,
        uint sellPrice,
        uint collateralAmount
    ) public {
        // WithdrawLongOption -> BurnShortOption (buy on high price and then sell on higher price)
        address ownerAddress = msg.sender;
        Actions.ActionArgs [] memory actions = new Actions.ActionArgs[](3);

        actions[0] = Actions.ActionArgs(
            Actions.ActionType.WithdrawLongOption,
            ownerAddress,
            ownerAddress,
            assetAddress,
            1,
            buyPrice,
            0,
            bytes("")
        );
        actions[1] = Actions.ActionArgs(
            Actions.ActionType.BurnShortOption,
            ownerAddress,
            ownerAddress,
            assetAddress,
            1,
            sellPrice,
            0,
            bytes("")
        );
        actions[2] = Actions.ActionArgs(
            Actions.ActionType.DepositCollateral,
            ownerAddress,
            ownerAddress,
            collateralAddress,
            1,
            collateralAmount,
            0,
            bytes("")
        );
        controller.operate(actions);
    }
}
