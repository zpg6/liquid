//
//  Liquid.swift
//
//
//  Created by Michael Verges on 8/17/20.
//

import SwiftUI
import Combine

/// A flowing, liquid view
public struct Liquid: View {
    
    var content: AnyView
    
    /// A blob resembling a circle
    /// - Parameters:
    ///   - samples: number of points to sample along the circular path
    ///   - period: length of animation
    public init(style: LiquidShapeStyle, samples: Int = 8, period: TimeInterval = 6) {
        self.content = AnyView(LiquidCircleView(style: style, samples: samples, period: period))
    }
    
    /// A blob resembling a custom path
    /// - Parameters:
    ///   - path: the source path to construct anchor points
    ///   - interpolate: number of points along the path to up-sample
    ///   - samples: the number of samples to select at each animation
    ///   - period: length of animation
    public init(_ path: CGPath, style: LiquidShapeStyle, interpolate: Int, samples: Int, period: TimeInterval = 6) {
        assert(interpolate > samples)
        self.content = AnyView(LiquidPathView(path: path, style: style, interpolate: interpolate, samples: samples, period: period))
    }
    
    public var body: some View {
        content
    }
}
