import Foundation
import UIKit

class MyViewController: UIViewController {
    @IBOutlet weak var gridView: CustomGridView!
    
    @IBAction func buttonClick(_ sender: Any) {
        gridView.squareCount = gridView.squareCount + 1
    }
}
