//
//  TCVerifyCodeController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/3.
//

import UIKit

let TC_Verify_Code_Second = 60

class TCVerifyCodeController: TCLoginBaseController {
    var mobile : String?
    var isAccountOld : Bool?
    
    private var value : String?
    private var codeTimer : Timer?
    
    private lazy var previousButton : UIButton = {
        let previousButton = UIButton.create(type: UIButton.ButtonType.custom, targe: self, action: #selector(back))
        previousButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        previousButton.setTitle("上一步", for: UIControl.State.normal)
        previousButton.setTitleColor(COLHEX(s: "#969696"), for: UIControl.State.normal)
        previousButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        return previousButton
    }()
    
    private lazy var codeLabel : UILabel = {
        let codeLabel = UILabel.create(font: UIFont.boldSystemFont(ofSize: 24), color: COLHEX(s: "#1E1E1E"), alignment: NSTextAlignment.center)
        codeLabel.text = "验证码"
        return codeLabel
    }()
    
    private lazy var codeTextField : UITextField = {
        let codeTextField = UITextField()
        
        codeTextField.backgroundColor = COLHEX(s: "#FAFAFA");
        codeTextField.placeholder = "请输入验证码";
        codeTextField.textAlignment = NSTextAlignment.center;
        codeTextField.addTarget(self, action: #selector(changedTextField), for: UIControl.Event.editingChanged)
        codeTextField.keyboardType = UIKeyboardType.phonePad
        
        return codeTextField
    }()
    
    private lazy var resendButton : UIButton = {
        let resendButton = UIButton.create(type: UIButton.ButtonType.custom, targe: self, action: #selector(resendAction))
        resendButton.isEnabled = false;
        return resendButton
    }()
    
    private lazy var agreementView = TCUserAgreementView()
    
    lazy var nextButton : TCAButton = {
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
        setupView()
        layoutUI()
    }
    
    func setupView() -> Void {
        self.view.addSubview(self.previousButton)
        self.view.addSubview(self.codeLabel)
        self.view.addSubview(self.codeTextField)
        self.view.addSubview(self.resendButton)
        self.view.addSubview(self.agreementView)
        self.view.addSubview(self.nextButton)
    }
    
    func layoutUI() -> Void {
        self.previousButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(20)
            make.top.equalTo(self.view).offset(kSafeTopHeight);
            make.height.equalTo(44);
            make.width.equalTo(50);
        }
        
        self.codeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(kSafeTopHeight+85);
            make.width.equalTo(200);
            make.height.equalTo(25);
            make.centerX.equalTo(self.view);
        }
        
        self.codeTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.codeLabel.snp_bottomMargin).offset(33);
            make.width.equalTo(190);
            make.height.equalTo(40);
            make.centerX.equalTo(self.view);
        }
        
        self.resendButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.codeTextField.snp_bottomMargin).offset(30);
            make.height.equalTo(30);
            make.width.equalTo(100);
            make.centerX.equalTo(self.view);
        }
        
        self.agreementView.snp.makeConstraints { (make) in
            make.top.equalTo(self.resendButton.snp_bottomMargin).offset(10);
            make.height.equalTo(25);
            make.left.right.equalTo(self.view);
        }
        
        self.nextButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(90);
            make.top.equalTo(self.codeTextField.snp_bottomMargin).offset(116);
            make.centerX.equalTo(self.view);
        }
    }
    
    // MARK: - EVENT
    @objc func back() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func changedTextField(textField:UITextField) -> Void {
        self.value = textField.text
    }
    
    @objc func resendAction() -> Void {
        
    }
    
    @objc func nextAction() -> Void {
        if self.checkText() {
            self.requestLogin()
        }
    }
    
    // MARK: - 业务逻辑
    func checkText() -> Bool {
        guard let value = self.value, value.count == 4 else {
            TCAlertUtil.showPrompt(info: "请输入正确的验证码")
            return false
        }
        return true
    }
    
    func startTimer() -> Void {
        if self.codeTimer == nil {
            self.codeTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self](timer) in
                self?.updateCode()
            })
        }
    }
    
    func stopTimer() -> Void {
        if let codeTimer = self.codeTimer {
            codeTimer.invalidate()
            self.codeTimer = nil
        }
    }
    
    private var allSecond : NSInteger = TC_Verify_Code_Second
    func updateCode() -> Void {
        self.allSecond -= 1
        
        if self.allSecond < 0 {
            self.stopTimer()
            
            self.resendButton.isEnabled = true
            self.resendButton.setTitle("重新发送", for: UIControl.State.normal)
            self.resendButton.setTitleColor(COLHEX(s: "#18609C"), for: UIControl.State.normal)
            self.resendButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        }else {
            let string = NSString(format: "%d", allSecond)
            self.resendButton.isEnabled = false
            self.resendButton.setTitle(string as String, for: UIControl.State.normal)
            self.resendButton.setTitleColor(COLHEX(s: "#979797"), for: UIControl.State.normal)
            self.resendButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        }
    }
    
    func handleUserModel(userModel : TCUserModel?) -> Void {
        TCControllerRouter.loginLogic(userModel: userModel, target: self) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNoticeRegisterLogin), object: userModel)
        }
    }
    
    // MARK: 网络请求
    func requestLogin() -> Void {
        TCAlertUtil.showLoading()
        var params = TCLoginBean()
        params.mobile = self.mobile
        params.code = self.value
        TCService.request(name: TC_CheckValidateCode, params: params, dataType: TCUserModel.self) { [weak self] (res, error, isSuccess) in
            TCAlertUtil.hiddenLoading()
            if isSuccess {
                self?.handleUserModel(userModel: res?.data)
            }else {
                self?.showInterfaceError(res: res)
            }
        }
    }
    
    func requestSendCode() -> Void {
        TCAlertUtil.showLoading()
        var params = TCLoginBean()
        params.mobile = self.value
        self.resendButton.isEnabled = false
        TCService.request(name: TC_SendValidateCode, params: params, dataType: TCVerificationModel.self) { [weak self] (res, error, isSuccess) in
            TCAlertUtil.hiddenLoading()
            if isSuccess {
                self?.startTimer()
            }else {
                self?.resendButton.isEnabled = true
                self?.showInterfaceError(res: res)
            }
        }
    }
    
}
