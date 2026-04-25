//
//  AppRouter.swift
//  PrivacyAssessment
//
//  Created by Usef on 24/04/2026.
//

import Combine
import SwiftUI

final class AppRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
