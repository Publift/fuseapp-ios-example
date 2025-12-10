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
                
                // Display a banner ad.
                FuseAdViewRepresentable(code: "banner")
                
                Divider()
                
                Text("Banner Ad With Custom Parameters")
                    .font(.headline)
                
                // Send some extra info when we request the banner ad.
                FuseAdViewRepresentable(
                    code: "banner",
                    params: FuseAdViewParams(
                        customTargeting: ["sport": "basketball", "size": "small"],
                        contentUrls: ["https://www.publift.com/about"]
                    ),
                    onEvent: { adView, adViewEvent in
                        // You can listen to banner ad events.
                        print("Fuse Event: \(adViewEvent)")
                    }
                )
                
                Divider()

                Text("Banner Ad With Custom Placeholder Image")
                    .font(.headline)
                
                // Customise the appearance of the banner ad whilst loading and if there's an error.
                FuseAdViewRepresentable(
                    code: "example_no_fill_banner",
                    loadingBehaviour: .background(image: UIImage(named: "Placeholder")),
                    errorBehaviour: .background(image: UIImage(named: "Placeholder"))
                )
                
                Divider()

                Text("Native Ad")
                    .font(.headline)
                
                // Display a native ad instead of a banner ad.
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
