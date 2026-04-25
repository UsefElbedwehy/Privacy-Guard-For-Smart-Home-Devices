//
//  Color+Ext.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import Foundation
import SwiftUI

extension Color {
    static let mainLinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color.accent, Color.accent2]),
        startPoint: .leading,
        endPoint: .bottomTrailing
    )
}
