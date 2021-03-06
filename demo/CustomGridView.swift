import Foundation
import UIKit

class CustomGridView: UIView {
    
    let squareSize: CGSize = .init(width: 20, height: 20)
    let rowDistance: CGFloat = 10
    let minColumnDistance: CGFloat = 10
    let squareColor: UIColor = .red
    
    
    @IBInspectable
    var squareCount: Int = 0 {
        didSet {
            if (subviews.count > squareCount) {
                let willBeRemoved = subviews.count - squareCount
                for _ in 0..<willBeRemoved {
                    subviews.last?.removeFromSuperview()
                }
                invalidateIntrinsicContentSize()
                setNeedsLayout()
            } else if (subviews.count < squareCount) {
                let willBeAdded = squareCount - subviews.count
                for _ in 0..<willBeAdded {
                    let view = UIView(frame: .zero)
                    view.backgroundColor = squareColor
                    addSubview(view)
                }
                invalidateIntrinsicContentSize()
                setNeedsLayout()
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layout \(frame.size)")
        let columnCount = Int((frame.width + minColumnDistance) / (squareSize.width + minColumnDistance))
        let columnDistance = (frame.width - (CGFloat(columnCount) * squareSize.width)) / CGFloat(columnCount - 1)
        
        for (index, view) in subviews.enumerated() {
            let column = index % columnCount
            let row = index / columnCount
            view.frame = .init(x: CGFloat(column) * (squareSize.width + columnDistance),
                               y: CGFloat(row) * (squareSize.height + rowDistance),
                               width: squareSize.width,
                               height: squareSize.height)
        }
        invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            let columnCount = Int((frame.width + minColumnDistance) / (squareSize.width + minColumnDistance))
            let lastViewIndex = subviews.count - 1
            let row = lastViewIndex / columnCount
            let height = (CGFloat(row) * (squareSize.height + rowDistance)) + squareSize.height
            
            let size: CGSize = .init(width: UIView.noIntrinsicMetric, height: height)
            print("content \(size) frame \(frame.size)")
            return size
        }
    }
    
}
