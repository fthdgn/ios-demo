import Foundation
import UIKit

class MyTextTableViewController: UITableViewController {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as! CustomTextTableViewCell
        
        var text = ""
        
        for i in 0..<indexPath.row * 10 {
            text = text + " line\(i)"
        }
        
        cell.label.text = text
        
        return cell
    }
}


class CustomTextTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    
}
