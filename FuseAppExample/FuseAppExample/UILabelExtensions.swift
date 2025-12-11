//
// UILabelExtensions.swift
// FuseAppExample
//
// Copyright 2025 Publift Pty Ltd.
//

import UIKit

extension UILabel {
    convenience init(text: String, textAlignment: NSTextAlignment = .center, translatesAutoresizingMaskIntoConstraints: Bool = false) {
        self.init()
        self.text = text
        self.textAlignment = textAlignment
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
    }
}
