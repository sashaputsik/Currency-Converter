import Foundation
import UIKit

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as? mainTableViewCell{
            cell.currencyImageView.image = UIImage(named: DataSource().imageName[indexPath.row])
            cell.valueCurrencyLabel.text = "\(currencyArray[indexPath.row].doubleValue)"
            cell.nameOfCurrencyLabel.text = DataSource().currencyName[indexPath.row]
            cell.sNameOfCurrencyLabel.text = DataSource().sCurrencyName[indexPath.row]
            let one = 1/currencyArray[indexPath.row].floatValue
            cell.equeltyCurrencyLabel.text = "1 \(DataSource().sCurrencyName[indexPath.row]) = \(one) USD"
        return cell
    }
        return UITableViewCell()
    }
    
    
}
extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
}