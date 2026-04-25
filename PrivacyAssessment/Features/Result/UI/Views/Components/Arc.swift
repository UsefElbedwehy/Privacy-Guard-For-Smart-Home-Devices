//
//  Arc.swift
//  PrivacyAssessment
//
//  Created by Usef on 24/04/2026.
//

import SwiftUI

struct Arc: Shape {
   let startAngle: Double
   let endAngle: Double

   func path(in rect: CGRect) -> Path {
       Path { p in
           p.addArc(
               center: CGPoint(x: rect.midX, y: rect.midY),
               radius: rect.width / 2,
               startAngle: .degrees(startAngle),
               endAngle: .degrees(endAngle),
               clockwise: false
           )
       }
   }
}

#Preview {
    Arc(startAngle: 180, endAngle: 0)
        .stroke(lineWidth: 10)
}
