//
// MainView.swift
// FuseAppExample
//
// Copyright 2025 Publift Pty Ltd.
//

import FuseAppSDK
import SwiftUI

struct MainView: View {
    let interstitialAd = FuseFullScreenAdView(code: "interstitial")
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Fuse App Examples")
                    .font(.title)
                
                NavigationLink(destination: BannerView().navigationTitle("SwiftUI Example")) {
                    Text("SwiftUI Example")
                }
                .buttonStyle(BorderedButtonStyle())
                .padding()
                
                NavigationLink(destination: BannerViewController().navigationTitle("UIKit Example")) {
                    Text("UIKit Example")
                }
                .buttonStyle(BorderedButtonStyle())
                .padding()
                
                Button("Interstitial Example") {
                    /*
                     * Example: Display a full-screen interstitial ad
                     */
                    interstitialAd.show(timeout: 10)
                }
                .buttonStyle(BorderedButtonStyle())
                .padding()
            }
            .padding()
        }
    }
}
