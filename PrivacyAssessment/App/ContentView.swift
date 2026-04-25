//
//  ContentView.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @StateObject private var router = AppRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            HomeView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .home:
                        HomeView()
                    case .selectDevice:
                        SelectDeviceView(viewModel: SelectDeviceViewModel())
                    case .riskFactors(let device):
                        RiskFactorsView(
                            viewModel: RiskFactorsViewModel(device: device)
                        )
                    case .result(let device, let factorLevels):
                        ResultView(
                            viewModel: ResultViewModel(
                                device: device,
                                factorLevels: factorLevels
                            )
                        )
                    }
                }
        }
        .environmentObject(router)
    }
}

#Preview {
    ContentView()
}
