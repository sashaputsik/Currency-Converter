import Foundation
import UIKit
extension HistoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return historyCurrencyArray.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                    for: indexPath) as? mainTableViewCell{
            cell.currencyImageView.image = UIImage(named: DataSource().imageName[indexPath.row])
            cell.nameOfCurrencyLabel.text = DataSource().currencyName[indexPath.row]
            cell.sNameOfCurrencyLabel.text = DataSource().sCurrencyName[indexPath.row]
            cell.valueCurrencyLabel.text = "\(historyCurrencyArray[indexPath.row].floatValue)"
            if currencyArray[indexPath.row].floatValue > historyCurrencyArray[indexPath.row].floatValue{
                cell.valueChangeImageView.image = UIImage(named: "up.png")
            }
            else if currencyArray[indexPath.row].floatValue < historyCurrencyArray[indexPath.row].floatValue{
                cell.valueChangeImageView.image = UIImage(named: "down.png")
            }
            else{
                cell.valueChangeImageView.image = UIImage(named: "equal.png")
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
}
extension HistoryViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
