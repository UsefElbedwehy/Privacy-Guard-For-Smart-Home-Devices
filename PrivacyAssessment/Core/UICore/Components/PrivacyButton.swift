//
//  PrivacyButton.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import SwiftUI

struct PrivacyButton: View {
    let title: String
    let image: Image?
    let isOn: Bool
    let onTap: () -> Void

    init(
        _ title: String,
        image: Image? = nil,
        isOn: Bool = true,
        onTap: @escaping () -> Void
    ) {
        self.title = title
        self.image = image
        self.isOn = isOn
        self.onTap = onTap
    }

    var body: some View {
        Button {
            onTap()
        } label: {
            Text(title)
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(background)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(
                    color: Color.accent.opacity(0.25),
                    radius: 16,
                    x: 0,
                    y: 8
                )
        }
        .disabled(!isOn)
        .opacity(isOn ? 1.0 : 0.4)
        .animation(.easeInOut(duration: 0.2), value: isOn)
    }

    private var background: some View {
        Color.mainLinearGradient
    }
}

#Preview {
    PrivacyButton("Continue") {
        
    }
}
