//  Created by Marcin Krzyzanowski
//  https://github.com/krzyzanowskim/STTextView/blob/main/LICENSE.md

import UIKit

final class STRulerView: UIView {
    let lineNumberView: STLineNumberView
    var drawSeparator: Bool = true

    override init(frame: CGRect) {
        lineNumberView = STLineNumberView(frame: frame)
        lineNumberView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        super.init(frame: frame)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.secondarySystemBackground

        addSubview(lineNumberView)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }

        if drawSeparator {
            ctx.setLineWidth(1)
            ctx.setStrokeColor(UIColor.separator.cgColor)
            ctx.addLines(between: [CGPoint(x: frame.width - 0.5, y: 0), CGPoint(x: frame.width - 0.5, y: bounds.maxY) ])
            ctx.strokePath()
        }
    }
}
