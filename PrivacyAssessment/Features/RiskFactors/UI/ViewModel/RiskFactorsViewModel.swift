//
//  RiskFactorsViewModel.swift
//  PrivacyAssessment
//
//  Created by Usef on 24/04/2026.
//

import Combine
import Foundation
import SwiftUI

final class RiskFactorsViewModel: ObservableObject {
    let device: ModelDevice
    let showResult: Bool
    @Published private(set) var isNetworkExposureLocked: Bool
    @Published var selectedLevels = [ModelRiskFactor: ModelRisk]()

    var isComplete: Bool {
        selectedLevels.count == ModelRiskFactor.allCases.count
    }

    private let defaults = UserDefaults.standard
    private let key = "isNetworkExposureLocked"
    
    var lockImageName: String {
        isNetworkExposureLocked ? "lock.fill" : "lock.open"
    }

    init(
        device: ModelDevice,
        showResult: Bool = false
    ) {
        self.device = device
        self.showResult = showResult
        self.isNetworkExposureLocked = defaults.bool(forKey: key)

        if isNetworkExposureLocked {
            self.selectedLevels = [
                .networkExposure: device.defaultLevel(for: .networkExposure)
            ]
        }

        applyNetworkExposureRule()
    }

    func select(level: ModelRisk, of factor: ModelRiskFactor) {
        if factor == .networkExposure && isNetworkExposureLocked {
            return
        }
        selectedLevels[factor] = level
    }

    func toggleNetworkExposureLock() {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
            isNetworkExposureLocked.toggle()
            defaults.set(isNetworkExposureLocked, forKey: key)
            applyNetworkExposureRule()
        }
    }

    private func applyNetworkExposureRule() {
        if isNetworkExposureLocked {
            selectedLevels[.networkExposure] =
                device.defaultLevel(for: .networkExposure)
        }
    }

    func isSelectable(_ factor: ModelRiskFactor) -> Bool {
        factor != .networkExposure || !isNetworkExposureLocked
    }
}
