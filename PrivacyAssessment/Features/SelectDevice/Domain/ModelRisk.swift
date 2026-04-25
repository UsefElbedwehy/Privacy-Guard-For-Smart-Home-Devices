//
//  ModelRisk.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import Foundation
import SwiftUI

enum ModelRisk: Int, CaseIterable, Identifiable {
    case low
    case medium
    case high

    var id: Int { rawValue }

    var weight: Int {
        return self.rawValue + 1
    }

    var score: Int {
        switch self {
        case .low: return 1
        case .medium: return 2
        case .high: return 3
        }
    }

    var dispalyName: String {
        switch self {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }

    var description: String {
        switch self {
        case .low:
            return "Weight: \(self.weight) . Low risk"
        case .medium:
            return "Weight: \(self.weight) . Medium risk"
        case .high:
            return "Weight: \(self.weight) . High risk"
        }
    }

    var color: Color {
        switch self {
        case .low:
            Color.lowRisk
        case .medium:
            Color.mediumRisk
        case .high:
            Color.highRisk
        }
    }
}
