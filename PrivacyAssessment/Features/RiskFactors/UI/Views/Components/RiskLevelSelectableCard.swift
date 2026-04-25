//
//  SelectableCard.swift
//  PrivacyAssessment
//
//  Created by Usef on 24/04/2026.
//

import SwiftUI

struct SelectableCard: View {
    let riskLevel: ModelRisk
    let subtitle: String
    let isSelected: Bool

    var body: some View {
        VStack {
            Text(riskLevel.dispalyName.capitalized)
                .bold()
                .foregroundStyle(isSelected ? riskLevel.color : Color.textDim)

            Text(subtitle)
                .font(.system(size: 8))
                .foregroundStyle(
                    isSelected ? riskLevel.color.opacity(0.6) : Color.textDim
                )
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            isSelected ? riskLevel.color.opacity(0.15) : Color.surface
        }
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    isSelected ? riskLevel.color : Color.textDimmer,
                    lineWidth: 1
                )
        }
    }
}

#Preview {
    HStack(spacing: 12) {
        SelectableCard(
            riskLevel: .low,
            subtitle: "Local Only",
            isSelected: true
        )
        SelectableCard(
            riskLevel: .medium,
            subtitle: "Local Only",
            isSelected: true
        )
        SelectableCard(
            riskLevel: .high,
            subtitle: "Local Only",
            isSelected: true
        )
    }
    .padding()
    .background(BlurryBackground())
}
