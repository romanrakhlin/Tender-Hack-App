//
//  Wawe.swift
//  Tender App
//
//  Created by Roman Rakhlin on 4/16/22.
//

import SwiftUI

struct WaveShape : Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: .zero)

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        path.addCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY),
            control1: CGPoint(x: rect.maxX * 0.75, y: rect.maxY * 0.8),
            control2: CGPoint(x: rect.maxX * 0.35, y: rect.maxY * 2)
        )

        return path
    }
}
