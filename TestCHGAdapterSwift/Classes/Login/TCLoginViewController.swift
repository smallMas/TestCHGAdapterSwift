//
//  TCLoginViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/3.
//

import UIKit

class TCLoginViewController: TCLoginBaseController {
    open var value : String?
    
    private lazy var mobileLabel : UILabel = {
        let mobileLabel = UILabel()
        mobileLabel.text = "手机号"
        mobileLabel.font = UIFont.boldSystemFont(ofSize: 24)
        mobileLabel.textColor = COLHEX(s: "#1E1E1E")
        mobileLabel.textAlignment = NSTextAlignment.center
        return mobileLabel
    }()
    private lazy var flagView : TCCountryFlagView = TCCountryFlagView()
    
    private lazy var mobileTextField : UITextField = {
        let mobileTextField = UITextField()
        
        mobileTextField.backgroundColor = COLHEX(s: "#FAFAFA");
        mobileTextField.placeholder = "请输入手机号";
        mobileTextField.textAlignment = NSTextAlignment.center;
        mobileTextField.addTarget(self, action: #selector(changedTextField), for: UIControl.Event.editingChanged)
        mobileTextField.keyboardType = UIKeyboardType.phonePad
        
        return mobileTextField
    }()
    private lazy var nextButton : TCAButton = {
        let nextButton = TCAButton()
        nextButton.setBackgroundColor(color: COLHEX(s: "#F0F0F0"), state: UIControl.State.normal)
        nextButton.setBackgroundColor(color: COLHEX(s: "#1E1E1E"), state: UIControl.State.highlighted)
        nextButton.addTarget(self, action: #selector(nextAction), for: UIControl.Event.touchUpInside)
        nextButton.setImage(UIImage(named: "login_btn_next"), for: UIControl.State.normal)
        nextButton.setImage(UIImage(named: "login_btn_next_highlighted"), for: UIControl.State.highlighted)
        nextButton.layer.cornerRadius = 45
        nextButton.layer.masksToBounds = true
        
        return nextButton
    }()
    
    // MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupView()
        self.layoutUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupView() -> Void {
        self.view.addSubview(self.mobileLabel)
        self.view.addSubview(self.flagView)
        self.view.addSubview(self.mobileTextField)
        self.view.addSubview(self.nextButton)
        
        let phoneCode = "86"
        let countryCode = "CN"
        self.flagView.config(phoneCode: phoneCode, countryCode: countryCode, name: "中国")
    }
    
    func layoutUI() -> Void {
        self.mobileLabel.snp.makeConstraints { (make) in
            make.top.equalTo(kSafeTopHeight+85)
            make.width.equalTo(200)
            make.height.equalTo(25)
            make.centerX.equalTo(self.view)
        }
        
        self.flagView.snp.makeConstraints { (make) in
            make.width.equalTo(200);
            make.height.equalTo(30);
            make.top.equalTo(self.mobileLabel.snp_bottomMargin).offset(25);
            make.centerX.equalTo(self.view);
        }
        
        self.mobileTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.flagView.snp_bottomMargin).offset(25)
            make.width.equalTo(241)
            make.height.equalTo(40)
            make.centerX.equalTo(self.view)
        }

        self.nextButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(90)
            make.top.equalTo(self.mobileTextField.snp_bottomMargin).offset(116)
            make.centerX.equalTo(self.view)
        }
    }
    
    // MARK: - EVENT
    @objc func nextAction() -> Void {
        if self.checkText() {
            self.requestSendCode()
        }
    }
    
    @objc func changedTextField(textField:UITextField) -> Void {
        self.value = textField.text
    }

    // MARK: 逻辑方法
    func checkText() -> Bool {
        if ((self.value?.isMobilePhone()) == nil) {
            TCAlertUtil.showPrompt(info: "请输入正确的手机号")
            return false
        }
        return true
    }
    
    // MARK: 网络请求
    func requestSendCode() -> Void {
        TCAlertUtil.showLoading()
        var params = TCLoginBean()
        params.mobile = self.value
        TCService.request(name: TC_SendValidateCode, params: params, dataType: TCVerificationModel.self) { [weak self] (res, error, isSccess) in
            TCAlertUtil.hiddenLoading()
            if isSccess {
                let vc = TCVerifyCodeController()
                vc.mobile = self?.value
                vc.isAccountOld = res?.data?.isValidate
                self?.navigationController?.pushViewController(vc, animated: true)
            }else {
                self?.showInterfaceError(res: res)
            }
        }
    }
}
