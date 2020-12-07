//
//  TCService.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/1.
//

import UIKit
import Alamofire
import HandyJSON

func publicParams<Parameters: TCPublicProtocol>(params:Parameters?) -> Parameters {
    let appId = "1003604205986484225"
    let platform = "ios"
    let timestamp = TCUtility.getCurrentTimeStamp()
    let version = "1.1.19"
    var token = ""
    if let userModel = TCUserManager.sharedInstance.getUserModel(), let t = userModel.token {
        token = t
    }
    if var params = params {
        params.appId = appId
        params.platform = platform
        params.timestamp = timestamp
        params.version = version
        if params.token == nil {
            params.token = token
        }
        return params
    }else {
        let params = TCNullParams()
        params.appId = appId
        params.platform = platform
        params.timestamp = timestamp
        params.version = version
        if params.token == nil {
            params.token = token
        }
        return params as! Parameters
    }
}

typealias Handle<H:HandyJSON, S:TCDataWraper<H>, E:Error> = (_ res:S?, _ error:E?, _ isSuccess:Bool)->Void

class TCService: NSObject {
    static func request<Parameters: TCPublicProtocol, H: HandyJSON>(name:String, params:Parameters?, dataType:H.Type?, handle:@escaping Handle<H,TCDataWraper<H>,Error>) -> Void {
        let paramsStruct : Parameters = publicParams(params: ((params is TCNullParams) ? nil : params));
        let url = interfaceUrl(string: name)
        let uuid = TCUtility.uuid()
        print("[REQ] ReqId : \(uuid) url : \(url) params : \(paramsStruct)")
        AF.request(url,
                   method: .post,
                   parameters: paramsStruct,
                   encoder: JSONParameterEncoder.default).responseJSON { response in
                    switch response.result {
                    case.success(let data):
                        do {
                            print("[RES] ReqId : \(uuid) url : \(url) response : \(data)")
                            let dataD : Data = try!JSONSerialization.data(withJSONObject: data, options: []) as Data
                            let jsonString = String.init(data: dataD, encoding: String.Encoding.utf8)
                            if let model = JSONDeserializer<TCDataWraper<H>>.deserializeFrom(json: jsonString) {
                                handle(model, nil, model.isSuccess())
                            }
                        }
                    case.failure(let error):
                        print("error >> \(error)")
                        handle(nil, error, false)
                        
                        TCAlertUtil.showPrompt(info: "网络不给力，亲~~")
                    }
                   }
    }
}
