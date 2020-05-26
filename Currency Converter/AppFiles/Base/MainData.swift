import Foundation

let currentUrl =  "http://api.currencylayer.com/live?access_key=7b3227866aebfd9080832df2d7371022&currencies=USD,AUD,CAD,PLN,MXN&format=1"

var converterArray = [Converter]()
var historyCurrencyArray = [NSNumber]()
var currencyArray = [NSNumber]()
class Converter {
    var americarDollar: NSNumber
    var australianDollar: NSNumber
    var canadianDollar: NSNumber
    var polishZloty: NSNumber
    var mexicanPeso: NSNumber
    
    init(dictionary: Dictionary<String,Any>) {
        let dicter = dictionary["quotes"] as? Dictionary<String,Any> ?? [:]
        americarDollar  = dicter["USDUSD"] as? NSNumber ?? 0
        australianDollar = dicter["USDAUD"] as? NSNumber ?? 0
        canadianDollar = dicter["USDCAD"] as? NSNumber ?? 0
        polishZloty = dicter["USDPLN"] as? NSNumber ?? 0
        mexicanPeso = dicter["USDMXN"] as? NSNumber ?? 0
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

