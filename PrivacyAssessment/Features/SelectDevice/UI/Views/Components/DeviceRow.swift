//
//  DeviceRow.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import SwiftUI

struct DeviceRow: View {
    let device: ModelDevice
    let isSelected: Bool

    init(
        device: ModelDevice,
        isSelected: Bool
    ) {
        self.device = device
        self.isSelected = isSelected
    }

    var body: some View {
        HStack {
            Text(device.emoji)
                .padding()
                .background {
                    isSelected ? Color.accent.opacity(0.1) : Color.surface2
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading) {
                Text(device.name)
                    .foregroundStyle(Color.textPrimary)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(device.risk.description)
                    .foregroundStyle(Color.textDim)
                    .font(.caption2)
                    .monospaced()
            }

            Spacer()

            radioButton
        }
        .padding()
        .background {
            isSelected ? Color.accent.opacity(0.05) : Color.surface
        }
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    isSelected ? Color.accent : Color.textDimmer,
                    lineWidth: 1
                )
        }
    }

    private var radioButton: some View {
        ZStack {
            Circle()
                .stroke(
                    isSelected ? Color.textDim : Color.secondary,
                    lineWidth: 1
                )
                .frame(width: 26, height: 26)

            Circle()
                .frame(width: 26, height: 26)
                .foregroundStyle(isSelected ? .accent : .clear)

            if isSelected {
                Image(systemName: "checkmark")
                    .font(.caption.bold())
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    VStack {
        DeviceRow(
            device: .speaker,
            isSelected: true
        )
        DeviceRow(
            device: .camera,
            isSelected: false
        )
    }
    .padding(24)
    .background {
        BlurryBackground()
    }
}
