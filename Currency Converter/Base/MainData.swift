import Foundation

public let currentUrl =  "http://api.currencylayer.com/live?access_key=7b3227866aebfd9080832df2d7371022&currencies=USD,AUD,CAD,PLN,MXN&format=1"

public var converterArray = [Converter]()
public var historyCurrencyArray = [NSNumber]()
public var currencyArray = [NSNumber]()
public class Converter {
    fileprivate var americarDollar: NSNumber
    fileprivate var australianDollar: NSNumber
    fileprivate var canadianDollar: NSNumber
    fileprivate var polishZloty: NSNumber
    fileprivate var mexicanPeso: NSNumber
    
    init(dictionary: Dictionary<String,Any>) {
        let dictionary = dictionary["quotes"] as? Dictionary<String,Any>  ?? [:]
        americarDollar  = dictionary[Keys.americarDollar.rawValue] as? NSNumber ?? 0
        australianDollar = dictionary[Keys.australianDollar.rawValue] as? NSNumber ?? 0
        canadianDollar = dictionary[Keys.canadianDollar.rawValue] as? NSNumber ?? 0
        polishZloty = dictionary[Keys.polishZloty.rawValue] as? NSNumber ?? 0
        mexicanPeso = dictionary[Keys.mexicanPeso.rawValue] as? NSNumber ?? 0
    }
}

func add(){
    currencyArray.append(converterArray.first!.australianDollar)
    currencyArray.append(converterArray.first!.canadianDollar)
    currencyArray.append(converterArray.first!.mexicanPeso)
    currencyArray.append(converterArray.first!.polishZloty)
    
}
func addHistory(){
    historyCurrencyArray.append(converterArray.last!.australianDollar)
    historyCurrencyArray.append(converterArray.last!.canadianDollar)
    historyCurrencyArray.append(converterArray.last!.mexicanPeso)
    historyCurrencyArray.append(converterArray.last!.polishZloty)
}

//MARK: Enum Keys for init
fileprivate enum Keys: String{
    case americarDollar  = "USDUSD"
    case australianDollar = "USDAUD"
    case canadianDollar = "USDCAD"
    case polishZloty = "USDPLN"
    case mexicanPeso = "USDMXN"
}
