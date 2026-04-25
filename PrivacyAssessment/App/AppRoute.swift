//
//  AppRoute.swift
//  PrivacyAssessment
//
//  Created by Usef on 24/04/2026.
//

import Foundation

enum AppRoute: Hashable {
    case home
    case selectDevice
    case riskFactors(device: ModelDevice)
    case result(
        device: ModelDevice,
        [ModelRiskFactor: ModelRisk]
    )
}
