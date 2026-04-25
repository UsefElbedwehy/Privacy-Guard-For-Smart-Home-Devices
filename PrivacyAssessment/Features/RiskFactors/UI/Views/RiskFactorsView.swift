//
//  RiskFactorsView.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import SwiftUI

struct RiskFactorsView: View {
    @StateObject var viewModel: RiskFactorsViewModel
    @EnvironmentObject var router: AppRouter

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            riskFactorsView

            Spacer()

            PrivacyButton(
                "Calculate Risk",
                image: Image(systemName: "arrow.left"),
                isOn: isComplete
            ) {
                let selectedLevels = viewModel.selectedLevels.compactMapValues {
                    $0
                }
                guard selectedLevels.count == ModelRiskFactor.allCases.count
                else {
                    return
                }
                router.push(
                    .result(
                        device: viewModel.device,
                        selectedLevels
                    )
                )
            }
        }
        .frame(maxWidth: .infinity)
        .navigationTitle("Risk Factors")
        .appBackground()
    }

    var isComplete: Bool {
        !viewModel.selectedLevels.values.contains(nil)
    }

    private var riskFactorsView: some View {
        VStack(alignment: .leading, spacing: 32) {
            ForEach(ModelRiskFactor.allCases) { factor in
                VStack(alignment: .leading, spacing: 16) {
                    Text(factor.title)
                        .font(.headline.bold())
                        .foregroundStyle(Color.textPrimary.opacity(0.8))

                    HStack(spacing: 4) {
                        ForEach(ModelRisk.allCases) { risk in
                            SelectableCard(
                                riskLevel: risk,
                                subtitle: factor.subTitle(for: risk),
                                isSelected: viewModel.selectedLevels[factor]
                                    == risk
                            )
                            .onTapGesture {
                                viewModel.selectedLevels[factor] = risk
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RiskFactorsView(
        viewModel: RiskFactorsViewModel(
            device: .init(name: "Smart", risk: .low, emoji: "")
        )
    )
    .padding(24)
    .background(BlurryBackground())
}
