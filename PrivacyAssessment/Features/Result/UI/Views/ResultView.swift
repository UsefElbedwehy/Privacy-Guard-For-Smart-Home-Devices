//
//  ResultView.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: ResultViewModel
    @EnvironmentObject var router: AppRouter

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ScrollView {
                scoreView
                recommendationView
            }
            .scrollIndicators(.hidden)
            Spacer()

            PrivacyButton("New Assessment") {
                router.popToRoot()
            }
        }
        .navigationTitle("Assessment Result")
        .appBackground()
        .navigationBarBackButtonHidden()
    }

    private var recommendationView: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("Recommendations".uppercased())
                    .font(.subheadline.bold())
                    .foregroundStyle(.textPrimary)

                Spacer()

                Text("\(viewModel.recommendations.count) items")
                    .foregroundStyle(Color.textDimmer)
                    .font(.caption)
            }
            .padding(.bottom, 12)

            ForEach(
                viewModel.recommendations.indices,
                id: \.self
            ) { index in
                HStack(spacing: 16) {
                    Circle()
                        .foregroundStyle(Color.highRisk)
                        .frame(width: 8, height: 8)

                    Text(viewModel.recommendations[index])
                        .foregroundStyle(Color.textDim)
                        .font(.callout)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.vertical, 10)

                if index < viewModel.recommendations.count - 1 {
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 0.5)
                        .foregroundStyle(Color.textDimmer)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.surface)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.textDimmer.opacity(0.5), lineWidth: 0.8)
        }
    }

    private var scoreView: some View {
        VStack(spacing: 24) {
            VStack(spacing: 0) {
                GaugeView(
                    score: viewModel.totalScore,
                    color: viewModel.riskLevel.color
                )

                tagView
            }
            .padding(.top)

            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible()), count: 3),
                spacing: 12
            ) {
                ForEach(Array(viewModel.factorLevels), id: \.key) { item in
                    let factor = item.key
                    let level = item.value

                    VStack {
                        Text("\(viewModel.displayScore(for: factor))")
                            .font(.title3.bold())
                            .foregroundStyle(level.color)

                        Text(factor.shortTitle)
                            .font(.caption)
                            .foregroundStyle(Color.textDim)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.surface2)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.surface)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.textDimmer.opacity(0.5), lineWidth: 0.8)
        }
    }

    private var tagView: some View {
        HStack {
            Circle()
                .frame(width: 8, height: 8)
                .foregroundStyle(viewModel.riskLevel.color)

            Text(viewModel.riskLevel.dispalyName.capitalized + " Risk")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(viewModel.riskLevel.color)
                .monospaced()
        }
        .padding(.horizontal)
        .padding(.horizontal, 2)
        .padding(.vertical, 6)
        .background(viewModel.riskLevel.color.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    viewModel.riskLevel.color.opacity(0.7),
                    style: StrokeStyle(lineWidth: 1)
                )
        }
        .shadow(
            color: viewModel.riskLevel.color.opacity(0.2),
            radius: 16,
            x: 0,
            y: 8
        )
    }
}

#Preview {
    ResultView(
        viewModel: ResultViewModel(
            device: .camera,
            factorLevels: [
                .userAwarenes: .high,
                .networkExposure: .medium,
                .dataSensitivity: .low,
            ]
        )
    )
}
