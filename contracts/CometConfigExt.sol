// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.15;

import "./ICometConfigExt.sol";

/**
 * @title CometConfigExt
 * @notice An immutable contract to store configuration for the Comet protocol.
 */
contract CometConfigExt is ICometConfigExt {
    struct ConstructorParams {
        RateConfig supplyRateConfig;
        RateConfig borrowRateConfig;
    }

    /// @inheritdoc ICometConfigExt
    uint public immutable override supplyKink;

    /// @inheritdoc ICometConfigExt
    uint public immutable override supplyPerSecondInterestRateSlopeLow;

    /// @inheritdoc ICometConfigExt
    uint public immutable override supplyPerSecondInterestRateSlopeHigh;

    /// @inheritdoc ICometConfigExt
    uint public immutable override supplyPerSecondInterestRateBase;

    /// @inheritdoc ICometConfigExt
    uint public immutable override borrowKink;

    /// @inheritdoc ICometConfigExt
    uint public immutable override borrowPerSecondInterestRateSlopeLow;

    /// @inheritdoc ICometConfigExt
    uint public immutable override borrowPerSecondInterestRateSlopeHigh;

    /// @inheritdoc ICometConfigExt
    uint public immutable override borrowPerSecondInterestRateBase;

    /// @dev 365 days * 24 hours * 60 minutes * 60 seconds
    uint64 internal constant SECONDS_PER_YEAR = 31_536_000;

    /**
     * @notice Construct a new CometConfigExt contract.
     * @param params A set of parameters to store in the configuration.
     */
    constructor(ConstructorParams memory params) {
        supplyKink = params.supplyRateConfig.kink;
        supplyPerSecondInterestRateSlopeLow = params.supplyRateConfig.perSecondInterestRateSlopeLow / SECONDS_PER_YEAR;
        supplyPerSecondInterestRateSlopeHigh = params.supplyRateConfig.perSecondInterestRateSlopeHigh / SECONDS_PER_YEAR;
        supplyPerSecondInterestRateBase = params.supplyRateConfig.perSecondInterestRateBase / SECONDS_PER_YEAR;

        borrowKink = params.borrowRateConfig.kink;
        borrowPerSecondInterestRateSlopeLow = params.borrowRateConfig.perSecondInterestRateSlopeLow / SECONDS_PER_YEAR;
        borrowPerSecondInterestRateSlopeHigh = params.borrowRateConfig.perSecondInterestRateSlopeHigh / SECONDS_PER_YEAR;
        borrowPerSecondInterestRateBase = params.borrowRateConfig.perSecondInterestRateBase / SECONDS_PER_YEAR;
    }

    /// @inheritdoc ICometConfigExt
    function supplyRateConfig() external view override returns (uint256 kink, uint256 perSecondInterestRateSlopeLow, uint256 perSecondInterestRateSlopeHigh, uint256 perSecondInterestRateBase) {
        return (supplyKink, supplyPerSecondInterestRateSlopeLow, supplyPerSecondInterestRateSlopeHigh, supplyPerSecondInterestRateBase);
    }

    /// @inheritdoc ICometConfigExt
    function borrowRateConfig() external view override returns (uint256 kink, uint256 perSecondInterestRateSlopeLow, uint256 perSecondInterestRateSlopeHigh, uint256 perSecondInterestRateBase) {
        return (borrowKink, borrowPerSecondInterestRateSlopeLow, borrowPerSecondInterestRateSlopeHigh, borrowPerSecondInterestRateBase);
    }
}