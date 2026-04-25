//
//  BlurryBackground.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import SwiftUI

struct BlurryBackground: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()

            Circle()
                .fill(Color.accentColor.opacity(0.15))
                .frame(width: 150, height: 150)
                .blur(radius: 100)
                .offset(x: 120, y: -200)


            Circle()
                .fill(Color.accentColor.opacity(0.3))
                .frame(width: 200, height: 200)
                .blur(radius: 120)
                .offset(x: 0, y: 0)
        }
    }
}


#Preview {
    BlurryBackground()
}
