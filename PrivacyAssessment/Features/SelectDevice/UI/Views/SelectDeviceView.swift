//
//  SelectDeviceView.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import SwiftUI

struct SelectDeviceView: View {
    @StateObject var viewModel: SelectDeviceViewModel
    @EnvironmentObject var router: AppRouter

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text("Which smart home device would you like to assess?")
                .foregroundStyle(Color.textDim)
                .font(.subheadline)
                .fontWeight(.regular)

            ScrollView {
                ForEach(viewModel.devices, id: \.id) { device in
                    DeviceRow(
                        device: device,
                        isSelected: device.id == viewModel.selectedDevice?.id
                            ?? ""
                    ).onTapGesture {
                        viewModel.selectedDevice = device
                    }
                }
                .padding(1)
            }
            .scrollIndicators(.hidden)

            Spacer()

            PrivacyButton(
                "Continue",
                image: Image(systemName: "arrow.left"),
                isOn: viewModel.selectedDevice != nil
            ) {
                if let device = viewModel.selectedDevice {
                    router.push(
                        .riskFactors(
                            device: device
                        )
                    )
                }
            }
        }
        .navigationTitle("Select Device")
        .appBackground()
    }
}

#Preview {
    SelectDeviceView(viewModel: SelectDeviceViewModel())
        .padding(24)
        .background(BlurryBackground())
}
