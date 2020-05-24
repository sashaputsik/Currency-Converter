import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let headers = [
            "x-rapidapi-host": "fixer-fixer-currency-v1.p.rapidapi.com",
            "x-rapidapi-key": "f873f7a911msh2f68168cb39b33cp111b03jsne9f90a7e130b"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://fixer-fixer-currency-v1.p.rapidapi.com/symbols")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })

        dataTask.resume()
    }


}

