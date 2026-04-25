//
//  ModelDevice.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import Foundation

struct ModelDevice: Hashable {
    let id: String
    let name: String
    let risk: ModelRisk
    let emoji: String

    init(
        name: String,
        risk: ModelRisk,
        emoji: String
    ) {
        self.id = UUID().uuidString
        self.name = name
        self.risk = risk
        self.emoji = emoji
    }
}
