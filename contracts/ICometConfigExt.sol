// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.15;

interface ICometConfigExt {
    struct RateConfig {
        uint64 kink;
        uint64 perSecondInterestRateSlopeLow;
        uint64 perSecondInterestRateSlopeHigh;
        uint64 perSecondInterestRateBase;
    }

    /*
     * SUPPLY SIDE INTEREST RATE CONFIG
     */

    /// @notice The point in the supply rates separating the low interest rate slope and the high interest rate slope (factor)
    /// @dev uint64
    function supplyKink() external view returns (uint);

    /// @notice Per second supply interest rate slope applied when utilization is below kink (factor)
    /// @dev uint64
    function supplyPerSecondInterestRateSlopeLow() external view returns (uint);

    /// @notice Per second supply interest rate slope applied when utilization is above kink (factor)
    /// @dev uint64
    function supplyPerSecondInterestRateSlopeHigh() external view returns (uint);

    /// @notice Per second supply base interest rate (factor)
    /// @dev uint64
    function supplyPerSecondInterestRateBase() external view returns (uint);

    /// @notice Get the supply rate config
    /// @dev All return values can fit in uint64
    function supplyRateConfig() external view returns (uint256 kink, uint256 perSecondInterestRateSlopeLow,
        uint256 perSecondInterestRateSlopeHigh, uint256 perSecondInterestRateBase);

    /*
     * BORROW SIDE INTEREST RATE CONFIG
     */

    /// @notice The point in the borrow rate separating the low interest rate slope and the high interest rate slope (factor)
    /// @dev uint64
    function borrowKink() external view returns (uint);

    /// @notice Per second borrow interest rate slope applied when utilization is below kink (factor)
    /// @dev uint64
    function borrowPerSecondInterestRateSlopeLow() external view returns (uint);

    /// @notice Per second borrow interest rate slope applied when utilization is above kink (factor)
    /// @dev uint64
    function borrowPerSecondInterestRateSlopeHigh() external view returns (uint);

    /// @notice Per second borrow base interest rate (factor)
    /// @dev uint64
    function borrowPerSecondInterestRateBase() external view returns (uint);

    /// @notice Get the borrow rate config
    /// @dev All return values can fit in uint64
    function borrowRateConfig() external view returns (uint256 kink, uint256 perSecondInterestRateSlopeLow,
        uint256 perSecondInterestRateSlopeHigh, uint256 perSecondInterestRateBase);
}
