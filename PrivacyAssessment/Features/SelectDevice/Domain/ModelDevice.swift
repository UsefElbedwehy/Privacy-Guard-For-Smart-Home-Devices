//
//  ModelDevice.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import Foundation

enum ModelDevice: String, CaseIterable, Identifiable {
    case camera, speaker, lock, thermostat, plug, lightBulb

    var id: String { rawValue }

    var name: String {
        switch self {
        case .camera: return "Smart Camera"
        case .speaker: return "Smart Speaker"
        case .lock: return "Smart Lock"
        case .thermostat: return "Smart Thermostat"
        case .plug: return "Smart Plug"
        case .lightBulb: return "Smart Light Bulb"
        }
    }

    var risk: ModelRisk {
        switch self {
        case .camera, .speaker: return .high
        case .lock, .thermostat: return .medium
        case .plug, .lightBulb: return .low
        }
    }

    var emoji: String {
        switch self {
        case .camera: return "📷"
        case .speaker: return "🔊"
        case .lock: return "🔒"
        case .thermostat: return "🌡️"
        case .plug: return "🔌"
        case .lightBulb: return "💡"
        }
    }
}

extension ModelDevice {
    func defaultLevel(for factor: ModelRiskFactor) -> ModelRisk {
        defaultRiskLevels[factor] ?? .low
    }
}

extension ModelDevice {
    var defaultRiskLevels: [ModelRiskFactor: ModelRisk] {
        switch self {
        case .camera, .speaker:
            return [
                .dataSensitivity: .high,
                .networkExposure: .high,
                .userAwarenes: .medium
            ]

        case .lock, .thermostat:
            return [
                .dataSensitivity: .medium,
                .networkExposure: .medium,
                .userAwarenes: .medium
            ]

        case .plug, .lightBulb:
            return [
                .dataSensitivity: .low,
                .networkExposure: .low,
                .userAwarenes: .low
            ]
        }
    }
}
