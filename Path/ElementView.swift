//
//  ElementView.swift
//  Path
//
//  Created by Alexey Turulin on 9/13/23.
//

import SwiftUI

struct ElementView: View {
    let color: Color
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let nearLine = size * 0.1
            let farLine = size * 0.9
            let middle = size / 2
            
            VStack {
                ZStack {
                    Path { path in
                        path.addArc(
                            center: CGPoint(x: nearLine, y: nearLine),
                            radius: middle,
                            startAngle: Angle(degrees: 90),
                            endAngle: Angle(degrees: 0),
                            clockwise: true
                        )
                        path.addArc(
                            center: CGPoint(x: farLine, y: nearLine),
                            radius: middle,
                            startAngle: Angle(degrees: 180),
                            endAngle: Angle(degrees: 90),
                            clockwise: true
                        )
                        path.addArc(
                            center: CGPoint(x: farLine, y: farLine),
                            radius: middle,
                            startAngle: Angle(degrees: 270),
                            endAngle: Angle(degrees: 180),
                            clockwise: true
                        )
                        path.addArc(
                            center: CGPoint(x: nearLine, y: farLine),
                            radius: middle,
                            startAngle: Angle(degrees: 0),
                            endAngle: Angle(degrees: 270),
                            clockwise: true
                        )
                        path.closeSubpath()
                    }
                    .stroke(color, lineWidth: 2)
                }
            }
        }
    }
}

struct ElementView_Previews: PreviewProvider {
    static var previews: some View {
        ElementView(color: .red)
    }
}
