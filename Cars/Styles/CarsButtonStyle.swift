//
//  CarsButtonStyle.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import Foundation
import SwiftUI

struct CarsButtonStyle: ButtonStyle {
    var color: Color = .green

    public func makeBody(configuration: CarsButtonStyle.Configuration) -> some View {
        CarsButton(configuration: configuration, color: color)
    }

    struct CarsButton: View {
        let configuration: CarsButtonStyle.Configuration
        let color: Color

        var body: some View {

            return configuration.label
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(color)
                .cornerRadius(12)
                .padding()
        }
    }
}
