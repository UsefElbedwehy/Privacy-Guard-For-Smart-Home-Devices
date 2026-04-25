//
//  RiskFactorsViewModel.swift
//  PrivacyAssessment
//
//  Created by Usef on 24/04/2026.
//

import Combine
import Foundation

final class RiskFactorsViewModel: ObservableObject {
    let device: ModelDevice
    @Published var showResult: Bool = false
    @Published var selectedLevels: [ModelRiskFactor: ModelRisk?] = [
        .dataSensitivity: nil,
        .networkExposure: nil,
        .userAwarenes: nil,
    ]

    init(
        device: ModelDevice,
        showResult: Bool = false,
        selectedLevels: [ModelRiskFactor: ModelRisk?] = [:]
    ) {
        self.device = device
        self.showResult = showResult
        self.selectedLevels = selectedLevels
    }
}
