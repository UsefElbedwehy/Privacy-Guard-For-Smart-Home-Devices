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
                isOn: viewModel.isComplete
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
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(
                    action: {
                        viewModel.toggleNetworkExposureLock()
                    },
                    label: {
                        Image(systemName: viewModel.lockImageName)
                            .symbolEffect(.bounce, value: viewModel.isNetworkExposureLocked)
                    }
                )
            }
        }
    }

    private var riskFactorsView: some View {
        VStack(alignment: .leading, spacing: 32) {
            ForEach(ModelRiskFactor.allCases) { factor in
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text(factor.title)
                            .font(.headline.bold())
                            .foregroundStyle(Color.textPrimary.opacity(0.8))
                        
                        Text(viewModel.isSelectable(factor) ? "(Selectable)" : "(Fixed)")
                            .font(.headline.bold())
                            .foregroundStyle(Color.primary.opacity(0.8))
                        
                        Spacer()
                    }

                    HStack(spacing: 4) {
                        ForEach(ModelRisk.allCases) { risk in
                            SelectableCard(
                                riskLevel: risk,
                                subtitle: factor.subTitle(for: risk),
                                isSelected: viewModel.selectedLevels[factor]
                                    == risk
                            )
                            .opacity(viewModel.isSelectable(factor) ? 1 : 0.6)
                            .scaleEffect(viewModel.isSelectable(factor) ? 1.0 : 0.95)
                            .animation(.easeInOut(duration: 0.25), value: viewModel.isNetworkExposureLocked)
                            .allowsHitTesting(viewModel.isSelectable(factor))
                            .onTapGesture {
                                viewModel.select(level: risk, of: factor)
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
            device: .camera
        )
    )
    .padding(24)
    .background(BlurryBackground())
}
