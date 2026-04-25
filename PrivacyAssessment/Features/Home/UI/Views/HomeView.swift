//
//  HomeView.swift
//  PrivacyAssessment
//
//  Created by Usef on 23/04/2026.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: AppRouter

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            headerView
            Spacer()
            logoImageView
            appNameView
            statesView
            Spacer()
            actionButton
        }
        .appBackground()
    }

    private var headerView: some View {
        HStack {
            Circle()
                .frame(width: 8, height: 8)
                .foregroundStyle(Color.accent)

            Text("Privacy Gaurd")
                .textCase(.uppercase)
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.accent)
        }
        .padding(8)
        .padding(.horizontal, 2)
        .frame(maxWidth: 160)
        .background(Color.accent.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    Color.accent.opacity(0.7),
                    style: StrokeStyle(lineWidth: 1)
                )
        }
        .shadow(color: Color.accent.opacity(0.2), radius: 16, x: 0, y: 8)
    }

    private var logoImageView: some View {
        ZStack {
            HStack {
                Image("PrivacyGaurdLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 36))

            }

            RoundedRectangle(cornerRadius: 50)
                .stroke(
                    Color.accent.opacity(0.15),
                    style: StrokeStyle(lineWidth: 1.5)
                )
                .frame(width: 140, height: 140)

            RoundedRectangle(cornerRadius: 65)
                .stroke(
                    Color.accent.opacity(0.13),
                    style: StrokeStyle(lineWidth: 1.3)
                )
                .frame(width: 170, height: 170)
            
            RoundedRectangle(cornerRadius: 80)
                .stroke(
                    Color.accent.opacity(0.1),
                    style: StrokeStyle(lineWidth: 1)
                )
                .frame(width: 200, height: 200)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }

    private var appNameView: some View {
        VStack(spacing: 12) {
            Text("Privacy Assesment Tools")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Text("For Smart Home Devices")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.mainLinearGradient)

            Text(
                "Evaluate privacy risks in your smart home\ndevices with a quick, guided assesment."
            )
            .foregroundStyle(Color.textDim)
            .font(.subheadline)
            .fontWeight(.regular)
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }

    private var statesView: some View {
        HStack {
            makeSingleState(number: 6, title: "Devices")
            makeSingleState(number: 3, title: "Factors")
            makeSingleState(number: 3, title: "Risk Levels")
        }
        .frame(maxWidth: .infinity)
    }

    private var actionButton: some View {
        PrivacyButton(
            "Start Assessment",
            image: Image(systemName: "arrow.left")
        ) {
            router.push(.selectDevice)
        }
    }

    private func makeSingleState(number: Int, title: String) -> some View {
        VStack {
            Text("\(number)")
                .font(.title3.bold())
                .foregroundStyle(Color.accent)

            Text(title)
                .font(.caption)
                .foregroundStyle(Color.textDimmer)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.surface.opacity(0.1))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    Color.white.opacity(0.07),
                    style: StrokeStyle(lineWidth: 1)
                )
        }
    }
}

#Preview {
    HomeView()
}
