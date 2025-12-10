//
// ContentView.swift
// FuseAppExample
//
// Copyright 2025 Publift Pty Ltd.
//

import FuseAppSDK
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Fuse App Examples")
                    .font(.title)
                
                Divider()
                
                Text("Banner Ad")
                    .font(.headline)
                
                FuseAdViewRepresentable(code: "banner")
                
                Divider()
                
                Text("Banner Ad With Custom Parameters")
                    .font(.headline)
                
                FuseAdViewRepresentable(
                    code: "banner",
                    params: FuseAdViewParams(
                        customTargeting: ["sport": "basketball", "size": "small"],
                        contentUrls: ["https://www.publift.com/about"]
                    )
                )
                
                Divider()

                Text("Banner Ad With Custom Placeholder Image")
                    .font(.headline)
                
                FuseAdViewRepresentable(
                    code: "example_no_fill_banner",
                    loadingBehaviour: .background(image: UIImage(named: "Placeholder")),
                    errorBehaviour: .background(image: UIImage(named: "Placeholder"))
                )
                
                Divider()

                Text("Native Ad")
                    .font(.headline)
                
                FuseAdViewRepresentable(
                    code: "native",
                    loadingBehaviour: .progressBar,
                    errorBehaviour: .doNothing
                )                
            }
            .padding()
        }
    }
}
