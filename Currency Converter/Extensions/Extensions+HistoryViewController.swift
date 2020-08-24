import Foundation
import UIKit

//MARK: UITableViewDataSource
extension HistoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return historyCurrencyArray.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.id,
                                                       for: indexPath) as? MainTableViewCell else{ return UITableViewCell()}
        cell.setHistoryCurrency(indexPath: indexPath)
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
}

//MARK: UITableViewDelegate
extension HistoryViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath,
                              animated: true)
    }
}

//MARK: UITableViewCell
extension UITableViewCell{
    public static var id: String{
        return "cell"
    }
}