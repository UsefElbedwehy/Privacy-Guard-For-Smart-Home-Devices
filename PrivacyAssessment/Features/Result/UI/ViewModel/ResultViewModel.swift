//
//  ResultViewModel.swift
//  PrivacyAssessment
//
//  Created by Usef on 24/04/2026.
//

import Combine
import Foundation

final class ResultViewModel: ObservableObject {
    let device: ModelDevice
    let factorLevels: [ModelRiskFactor: ModelRisk]

    init(device: ModelDevice, factorLevels: [ModelRiskFactor: ModelRisk]) {
        self.device = device
        self.factorLevels = factorLevels
    }

    var totalScore: Int {
        let factorsScore = factorLevels.reduce(0) { total, pair in
            total + pair.key.score(for: pair.value)
        }
        return device.risk.weight + factorsScore
    }

    var riskLevel: ModelRisk {
        switch totalScore {
        case 4...6: return .low
        case 7...9: return .medium
        default: return .high
        }
    }

    func displayScore(for factor: ModelRiskFactor) -> Int {
        guard let level = factorLevels[factor] else { return 0 }
        return factor.score(for: level)
    }
}

extension ResultViewModel {

    var recommendations: [String] {
        var rec =
            switch riskLevel {
            case .low:
                [
                    "Maintain current privacy settings",
                    "Keep device updated",
                    "Continue monitoring privacy options",
                ]
            case .medium:
                [
                    "Check privacy settings",
                    "Limit unnecessary permissions",
                    "Review connected accounts",
                    "Update passwords regularly",
                ]
            case .high:
                [
                    "Review and adjust device permissions",
                    "Disable unnecessary data sharing",
                    "Use strong passwords",
                    "Update device firmware regularly",
                    "Restrict remote access",
                    "Enable extra privacy settings",
                ]
            }

        if device.name == "Smart Camera" {
            rec.append(contentsOf: [
                "Disable camera when not needed", "Review video data settings",
                "Restrict cloud sharing",
            ])
        } else if device.name == "Smart Headphone" {
            rec.append(contentsOf: [
                "Disable microphone when not needed",
                "Review voice data settings",
                "Restrict cloud sharing",
            ])
        }

        return rec
    }
}
