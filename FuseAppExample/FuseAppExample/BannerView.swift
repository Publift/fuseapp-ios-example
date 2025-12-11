//
// BannerView.swift
// FuseAppExample
//
// Copyright 2025 Publift Pty Ltd.
//

import FuseAppSDK
import SwiftUI

struct BannerView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                /*
                 * Example 1: Display a banner ad
                 */
                
                Text("Banner Ad")
                
                FuseAdViewRepresentable(code: "banner")
                
                Divider()
                
                /*
                 * Example 2: Display a banner ad with custom parameters
                 */

                Text("Banner Ad With Custom Parameters")
                
                FuseAdViewRepresentable(
                    code: "banner",
                    params: FuseAdViewParams(
                        customTargeting: [
                            "sport": "basketball",
                            "size": "small"
                        ],
                        contentUrls: [
                            "https://www.publift.com/about"
                        ]
                    ),
                    onEvent: { adView, adViewEvent in
                        // You can listen to banner ad events.
                        print("Fuse Event: \(adViewEvent)")
                    }
                )
                
                Divider()

                /*
                 * Example 3: Display a banner ad with custom placeholder image
                 */

                Text("Banner Ad With Custom Placeholder Image")
                
                FuseAdViewRepresentable(
                    code: "example_no_fill_banner",
                    loadingBehaviour: .background(image: UIImage(named: "Placeholder")),
                    errorBehaviour: .background(image: UIImage(named: "Placeholder"))
                )
                
                Divider()

                /*
                 * Example 4: Display a native ad (instead of a banner ad)
                 */
                
                Text("Native Ad")
                
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
