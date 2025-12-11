//
// BannerViewController.swift
// FuseAppExample
//
// Copyright 2025 Publift Pty Ltd.
//

import FuseAppSDK
import SwiftUI
import UIKit

struct BannerViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ExampleViewController {
        ExampleViewController()
    }
    
    func updateUIViewController(_ uiViewController: ExampleViewController, context: Context) {
    }
}

class ExampleViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIKit Example"
        setupView()
        
        /*
         * Example 1: Display a banner ad
         */
        
        let label1 = UILabel()
        label1.text = "Banner Ad"
        label1.textAlignment = .center
        label1.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(label1)
        
        let adView1 = FuseAdView(code: "banner")
        stackView.addArrangedSubview(adView1)
        
        /*
         * Example 2: Display a banner ad with custom parameters
         */
        
        let label2 = UILabel(text: "Banner Ad With Custom Parameters")
        stackView.addArrangedSubview(label2)
        
        let adView2 = FuseAdView(
            code: "banner",
            params: FuseAdViewParams(
                customTargeting: [
                    "sport": "basketball",
                    "size": "small"
                ],
                contentUrls: [
                    "https://www.publift.com/about"
                ]
            )
        )
        stackView.addArrangedSubview(adView2)

        // You can listen to banner ad events.
        adView2.delegate = self
        
        /*
         * Example 3: Display a banner ad with custom placeholder image
         */
        
        let label3 = UILabel(text: "Banner Ad With Custom Placeholder Image")
        stackView.addArrangedSubview(label3)
        
        let adView3 = FuseAdView(
            code: "example_no_fill_banner",
            loadingBehaviour: .background(image: UIImage(named: "Placeholder")),
            errorBehaviour: .background(image: UIImage(named: "Placeholder"))
        )
        stackView.addArrangedSubview(adView3)
        
        /*
         * Example 4: Display a native ad (instead of a banner ad)
         */
        
        let label4 = UILabel(text: "Native Ad")
        stackView.addArrangedSubview(label4)
        
        let adView4 = FuseAdView(
            code: "native",
            loadingBehaviour: .progressBar,
            errorBehaviour: .doNothing
        )
        stackView.addArrangedSubview(adView4)
    }
    
    private func setupView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
        ])
    }
}

extension ExampleViewController: FuseAdViewDelegate {
    func onEvent(adView: FuseAppSDK.FuseAdView, event: FuseAppSDK.FuseAdViewEvent) {
        // Listen to banner ad events (loading, loaded, etc.)
        print("Fuse Event: \(event)")
    }
}
