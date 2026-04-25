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
    var devices: [ModelDevice] = []

    init(selectedDevice: ModelDevice? = nil, devices: [ModelDevice] = []) {
        self.selectedDevice = selectedDevice
        self.devices = devices
        getDevices()
    }

    func getDevices() {
        devices = [
            ModelDevice(name: "Smart Camera", risk: .high, emoji: "📷"),
            ModelDevice(name: "Smart Speaker", risk: .high, emoji: "🔊"),
            ModelDevice(name: "Smart Lock", risk: .medium, emoji: "🔒"),
            ModelDevice(name: "Smart Thermostat", risk: .medium, emoji: "🌡️"),
            ModelDevice(name: "Smart Plug", risk: .low, emoji: "🔌"),
            ModelDevice(name: "Smart Light Bulb", risk: .low, emoji: "💡"),
        ]
    }
}
