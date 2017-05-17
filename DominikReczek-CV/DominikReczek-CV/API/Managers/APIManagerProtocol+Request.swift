import Alamofire
import SwiftyJSON

extension APIManagerProtocol {

    func request(completion: @escaping ([APIResultModelProtocol]) -> ()) {
        let fullPath = baseURL + path

        Alamofire.request(fullPath, parameters: nil).responseData { response in
            if let responseData =  response.result.value {
                let jsonData = JSON(data: responseData)
                let result = self.parser.parse(data: jsonData)
                completion(result)
            }
        }
    }
}
