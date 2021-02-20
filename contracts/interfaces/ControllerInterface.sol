/**
 * SPDX-License-Identifier: UNLICENSED
 */
pragma solidity 0.6.10;
pragma experimental ABIEncoderV2;

import {Actions} from "../libs/Actions.sol";

interface ControllerInterface {
    function operate(Actions.ActionArgs[] memory _actions) external;
}
