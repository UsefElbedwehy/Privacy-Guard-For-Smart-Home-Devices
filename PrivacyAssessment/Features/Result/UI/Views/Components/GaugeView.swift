//
//  GaugeView.swift
//  PrivacyAssessment
//
//  Created by Usef on 24/04/2026.
//

import SwiftUI

struct GaugeView: View {
    let score: Int
    let maxScore: Double
    let color: Color

    init(
        score: Int,
        maxScore: Double = 12.0,
        color: Color
    ) {
        self.score = score
        self.maxScore = maxScore
        self.color = color
    }

    private let startAngle: Double = 140
    private let endAngle: Double = 400

    var body: some View {
        ZStack {
            Arc(startAngle: startAngle, endAngle: endAngle)
                .stroke(Color.surface2, style: strokeStyle)
                .frame(width: 160, height: 160)

            Arc(startAngle: startAngle, endAngle: fillEndAngle)
                .stroke(color, style: strokeStyle)
                .shadow(color: color.opacity(0.4), radius: 12)
                .frame(width: 160, height: 160)

            VStack(spacing: 4) {
                Text("\(score)")
                    .font(.system(size: 44, weight: .bold))
                    .foregroundStyle(color)
                    .monospaced()

                Text("Risk Score")
                    .font(.caption)
                    .monospaced()
                    .foregroundStyle(Color.textDim)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 170)
    }

    private var strokeStyle: StrokeStyle {
        StrokeStyle(lineWidth: 14, lineCap: .round)
    }

    private var fillEndAngle: Double {
        let range = endAngle - startAngle
        let progress = min(Double(score) / maxScore, 1.0)
        return startAngle + range * progress
    }
}
