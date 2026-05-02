//
//  SelectDeviceViewModel.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import Combine
import Foundation

final class SelectDeviceViewModel: ObservableObject {
    @Published var selectedDevice: ModelDevice? = nil
    var devices: [ModelDevice] = ModelDevice.allCases

    init(selectedDevice: ModelDevice? = nil, devices: [ModelDevice] = []) {
        self.selectedDevice = selectedDevice
        self.devices = devices.isEmpty ? ModelDevice.allCases : devices
    }
}
