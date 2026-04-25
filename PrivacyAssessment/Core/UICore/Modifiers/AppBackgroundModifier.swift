//
//  AppBackgroundModifier.swift
//  PrivacyAssessment
//
//  Created by Usef on 25/04/2026.
//

import SwiftUI

struct AppBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 24)
            .padding(.top, 28)
            .padding(.bottom, 24)
            .background(BlurryBackground())
    }
}
