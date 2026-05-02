//
//  ModelRiskFactor.swift
//  PrivacyAssessment
//
//  Created by Usef on 24/04/2026.
//

import Foundation

enum ModelRiskFactor: String, CaseIterable, Identifiable {
    case dataSensitivity
    case networkExposure
    case userAwarenes

    var id: String { rawValue }

    var title: String {
        switch self {
        case .dataSensitivity:
            return "🔐 Data Sensitivity"
        case .networkExposure:
            return "🌐 Network Exposure"
        case .userAwarenes:
            return "🧠 User Awareness"
        }
    }

    var shortTitle: String {
        switch self {
        case .dataSensitivity:
            return "Data"
        case .networkExposure:
            return "Network"
        case .userAwarenes:
            return "Awareness"
        }
    }

    func subTitle(for level: ModelRisk) -> String {
        switch self {
        case .dataSensitivity:
            switch level {
            case .low: return "Basic Usage Data"
            case .medium: return "Profile Info"
            case .high: return "Private Data"
            }

        case .networkExposure:
            switch level {
            case .low: return "Local Only"
            case .medium: return "Limited"
            case .high: return "Full Internet"
            }

        case .userAwarenes:
            switch level {
            case .low: return "Not Aware"
            case .medium: return "Somewhat"
            case .high: return "Very Aware"
            }
        }
    }

    func score(for level: ModelRisk) -> Int {
        switch self {
        case .userAwarenes:
            switch level {
            case .low: return 3
            case .medium: return 2
            case .high: return 1
            }
        default:
            return level.score
        }
    }
}
