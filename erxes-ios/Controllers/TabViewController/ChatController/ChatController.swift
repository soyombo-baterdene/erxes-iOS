//
//  ChatController.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 6/7/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit
import LiveGQL
import WebKit
import SnapKit
import Apollo
import AVFoundation
//import KCKeyboardImagePicker
import Alamofire
import Photos
import MobileCoreServices

class ChatController: UIViewController {

    var player: AVAudioPlayer?
    var isPickerActive = false
    var loader: ErxesLoader = {
        let loader = ErxesLoader()
        loader.lineWidth = 3
        return loader
    }()
    
    var uploadUrl = ""
    var uploaded = JSON()
    var pickerContainer = UIView()
    var attachments = [JSON]()
    
    var keyboardFrame = CGRect(){
        didSet{
            if Constants.SCREEN_HEIGHT == 812 {
                pickerContainer = UIView(frame: CGRect(x: 0, y: keyboardFrame.origin.y+34, width: Constants.SCREEN_WIDTH, height: keyboardFrame.size.height-34))
            }else{
                pickerContainer = UIView(frame: keyboardFrame)
            }
            
            pickerContainer.backgroundColor = UIColor.init(hexString: "cccfd6")
            self.view.addSubview(pickerContainer)

           
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "facebook_messagetone", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
           
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    let client: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        let currentUser = ErxesUser.sharedUserInfo()
        configuration.httpAdditionalHeaders = ["x-token": currentUser.token as Any,
                                               "x-refresh-token": currentUser.refreshToken as Any]
        let url = URL(string: Constants.API_ENDPOINT + "/graphql")!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    
//    ws://\(host):3300/subscriptions
    
    let gql = LiveGQL(socket: Constants.SUBSCRITION_ENDPOINT)
    
    func configLive(){
        gql.delegate = self
    }
    
    func subscribe(){
        gql.subscribe(graphql: "subscription{conversationMessageInserted(_id:\"\(self.conversationId!)\"){content,userId,createdAt,customerId,user{details{avatar}},attachments}}", variables: nil, operationName: nil, identifier: "conversationMessageInserted")
    }
    
    var conversationId:String?
    var inited = false
    var bg = "#5629b6"
    var css = ""
    var container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hexString: "cccfd6")
        return view
    }()
    
    var inputContainer:UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.init(hexString: "cccfd6")
        return view
    }()
    
    var chatInputView: UITextField = {
       let textfield = UITextField()
        textfield.backgroundColor = UIColor.init(hexString: "f0ebf8")
        textfield.layer.cornerRadius = 5.0
        textfield.tintColor = Constants.ERXES_COLOR
        textfield.placeholder = "Write a reply..."
        let sendButton = UIButton(type: .custom)
        sendButton.titleLabel?.font = Constants.ULTRALIGHT
        sendButton.setTitle("Send", for: .normal)
        sendButton.setTitleColor(Constants.ERXES_COLOR, for: .normal)
        sendButton.frame = CGRect(x: 0, y: CGFloat(0), width: CGFloat(60), height: CGFloat(40))
        sendButton.addTarget(self, action: #selector(sendMessage(_:)), for: .touchUpInside)
        let line = UIView(frame: CGRect(x: 0, y: 10, width: 1, height: 20))
        line.backgroundColor = Constants.ERXES_COLOR
        sendButton.addSubview(line)
        
        textfield.rightView = sendButton
        textfield.rightViewMode = .always
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        let attachmentButton = UIButton(type: .custom)
        attachmentButton.setImage(#imageLiteral(resourceName: "ic_attachment"), for: .normal)
        attachmentButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        attachmentButton.imageView?.contentMode = .scaleAspectFit
        attachmentButton.addTarget(self, action: #selector(openImagePicker(sender:)), for: .touchUpInside)
        leftView.addSubview(attachmentButton)
        let cameraButton = UIButton(type: .custom)
        cameraButton.setImage(#imageLiteral(resourceName: "ic_camera"), for: .normal)
        cameraButton.frame = CGRect(x: 40, y: 0, width: 40, height: 40)
        cameraButton.imageView?.contentMode = .scaleAspectFit
        leftView.addSubview(cameraButton)
//        textfield.leftView = leftView
//        textfield.leftViewMode = .always
        
        return textfield
    }()
    
    @objc func openImagePicker(sender:UIButton){
        self.chatInputView.becomeFirstResponder()
        self.view.endEditing(true)
        let imagePicker = KCKeyboardImagePickerController.init(parentViewController: self)
//        imagePicker.isForceTouchPreviewEnabled = true
        imagePicker.forceTouchPreviewEnabled = true
        let style1 = KCKeyboardImagePickerStyle.init(optionButtonTag: 1, titleColor: .white, backgroundColor: Constants.ERXES_COLOR)
       
        let style2 = KCKeyboardImagePickerStyle.init(imagePickerControllerButtonBackgroundColor: Constants.ERXES_COLOR, image: #imageLiteral(resourceName: "ImagePickerControllerButtonIcon"))
        
        let action1 = KCKeyboardImagePickerAction.init(optionButtonTag: 1, title: "Send", forceTouchEnabled: true) { (selectedImage) in
            print("image = ", selectedImage?.size)
            self.uploadFile(image: selectedImage!)
            self.attachments = [JSON]()
            self.attachments.append(self.uploaded)
            self.sendMessage(UIButton())
        }
        let action2 = KCKeyboardImagePickerAction.init { (selectedImage) in
            
        }
        style1.titleColor = .white
        style1.tag = 1
        style1.backgroundColor = Constants.ERXES_COLOR
        style2.backgroundColor = Constants.ERXES_COLOR
        style2.image = #imageLiteral(resourceName: "ImagePickerControllerButtonIcon")
        
        action1.tag = 1
        action1.title = "Send"
        action1.forceTouchEnabled = true
        action1.handler = { (selectedImage) in
            print("image = ", selectedImage?.size)
            self.uploadFile(image: selectedImage!)
            self.attachments = [JSON]()
            self.attachments.append(self.uploaded)
            self.sendMessage(UIButton())
        }
        action2.handler = { (selectedImage) in 
            
        }
      
        imagePicker.add(style1)
        imagePicker.add(style2)
        imagePicker.addAction(action1)
        imagePicker.addAction(action2)
        
        
        imagePicker.keyboardFrame = CGRect(x: 0, y: 0, width: pickerContainer.frame.size.width, height: pickerContainer.frame.size.height)
        imagePicker.imagePickerView.backgroundColor  = UIColor.init(hexString: "cccfd6")
        pickerContainer.addSubview(imagePicker.imagePickerView)
        
        imagePicker.imagePickerView.reload()
        
        imagePicker.showKeyboardImagePickerView(animated: true)
        
    }
    
    func uploadFile(image:UIImage){
        

        
        let url = "https://app-api.crm.nmma.co/upload-file"
        let imgData = UIImageJPEGRepresentation(image, 0.5)!
        let size = imgData.count
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useKB] // optional: restricts the units to MB only
        bcf.countStyle = .file
       
        
        //        let parameters = ["name": rname] //Optional for extra parameter
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData, withName: "file",fileName: "file.jpg", mimeType: "image/jpg")
            //            for (key, value) in parameters {
            //                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            //            } //Optional for extra parameters
        },
                         to:url)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                   
                })
                
                upload.responseString { response in
                    print(response)
                    self.uploadUrl = response.value!
                    self.uploaded = ["url" : self.uploadUrl, "size" : size, "type" : "image/jpeg"]
                }
                
            case .failure(let encodingError):
                print(encodingError)
            }
        }
        
    }
    
    var chatView: UIWebView = {
        let webview = UIWebView()
        webview.backgroundColor = .clear
        return webview
    }()
    
  
    
    convenience init(chatId:String,title:String){
        self.init()
        self.conversationId = chatId
        self.title = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        configureViews()

        initChat()
        

        let path = Bundle.main.bundlePath
        let url = URL.init(fileURLWithPath: path)

        self.isPickerActive = false
        self.chatView.scrollView.bounces = false
        self.chatView.loadHTMLString(self.css, baseURL: url)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        configLive()
        
        if conversationId != nil {
            subscribe()
        }
    }
    
    func configureViews(){
        self.view.backgroundColor = .white
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(color: .white), for: .default)
        let rightItem: UIBarButtonItem = {
            let rightImage = #imageLiteral(resourceName: "ic_profile")
            let barButtomItem = UIBarButtonItem()
            let button = UIButton()
            button.setBackgroundImage(rightImage, for: .normal)
            //            button.addTarget(self, action: #selector(toggleSideMenu(sender:)), for: .touchUpInside)
            barButtomItem.customView = button
            return barButtomItem
        }()
//        self.navigationItem.rightBarButtonItem = rightItem
        chatView.delegate = self
        chatInputView.delegate = self
        self.view.addSubview(container)
        container.addSubview(chatView)
        self.view.addSubview(inputContainer)
        inputContainer.addSubview(chatInputView)
        self.view.addSubview(loader)
        

    }
    
    let currentUser = ErxesUser.sharedUserInfo()
    
    func initChat(){
   
        
        var str = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let now = dateFormatter.string(from: Date())
        
        str = "<div class=\"row\"><div class=\"img\"><img src=\"\(currentUser.avatar!)\"/></div><div class=\"date\">\(now)</div></div>"

        css = "<style>body{background:#ffffff;}.root{background:#ffffff}.row{overflow:hidden;margin-bottom:10px;font-family:'Helvetica Neue',Arial,sans-serif}.row .text a{float:left;padding:8px 10px;background:#f6f4fb;border-radius:5px;color:#444;margin-bottom:5px;font-size:14px;box-shadow: 0 1px 1px 0 rgba(0,0,0,0.2)}.row .text{overflow:hidden}.me .text a{float:right;background:\(bg);color:#fff}.row .text img{max-width:100%; height:auto!; padding-top:3px;} .row .date{color:#686868;font-size:11px}.me .date{text-align:right}p{display:inline}.row .img{float:left;margin-right:8px}.row .img img{width:40px;height:40px;border-radius:20px;}.me .img{float:right}.me .img img{margin-right:0;margin-left:8px}</style>"
    }
    

    
    func loadMessages(){
        
        if conversationId == nil{
            return
        }

        print("loaded")

        let messagesQuery = ConversationDetailQuery(_id: self.conversationId!)
        client.fetch(query: messagesQuery, cachePolicy: .fetchIgnoringCacheData) { [weak self] result, error in
            if let error = error {
                print(error.localizedDescription)
                let alert = FailureAlert(message: error.localizedDescription)
                alert.show(animated: true)
                return
            }
            
            if let err = result?.errors {
                let alert = FailureAlert(message: err[0].localizedDescription)
                alert.show(animated: true)
            }
            if let allMessages = result?.data?.conversationDetail {
          
                let messagesArray = (allMessages.messages?.map {($0?.fragments.messageDetail)!})!
                var me = ""
                var str = ""
 
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

                for item in messagesArray {
//                    let created:String! = item.createdAt.hou
//                    let tmp = Int64(created)
//                    let date = Date(milliseconds:tmp!)
//                    let now = item.createdAt!.hourMinutes!
                    let date = item.createdAt?.dateFromUnixTime()
                    let now = date?.hourMinutes!
                    
         

                    var avatar = "avatar.png"

                    if let user = item.user{
                        if let userAvatar = self?.currentUser.avatar{
                            avatar = userAvatar
                        }
                    }

                    me = ""
                    if item.userId != nil{
                            me = "me"
                    }

                    var image = ""

                    if let attachments = item.attachments{
                        if attachments.count > 0{
                            let attachment = attachments[0]
                            
                            if let url = attachment!["url"] as? String{
                                image = url
                            }
                            
                        }
                    }

                    let chat = item.content?.withoutHtml

                    str = str + "<div class=\"row \(me)\"><div class=\"img\"><img src=\"\(avatar)\"/></div><div class=\"text\"><a>\(chat!)<img src=\"\(image)\"/></a></div><div class=\"date\">\(now!)</div></div>"
                }
             

                self?.inited = true
                str = "document.body.innerHTML += '\(str)';window.location.href = \"inapp://scroll\""
                self?.chatView.stringByEvaluatingJavaScript(from: str)
                let scrollPoint = CGPoint(x: 0, y: (self?.chatView.scrollView.contentSize.height)! - (self?.chatView.frame.size.height)!)
                self?.chatView.scrollView.setContentOffset(scrollPoint, animated: true)
                self?.loader.stopAnimating()
            }
        }
    }
    
   @objc func sendMessage(_ sender:UIButton){
        
    let mutation = ConversationMessageAddMutation(conversationId: self.conversationId!, content: self.chatInputView.text!)
        client.perform(mutation: mutation) { [weak self] result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self?.chatInputView.text = ""
        }
    }
    
    func appendToChat(_ item:MessageSubs){
      
        if let message = item.payload?.data?.conversationMessageInserted{
            
            var str = ""
            
            if let content = message.content{
                str = content
            }
            
//            let now = NMFormatter.now()
            
            let date = Date()
            let calendar = Calendar.current
            
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            let now = String(format:"%i:%i",hour,minutes)
            
            var me = ""
            
            if message.user != nil {
                me = "me"
            }else{
                playSound()
            }
            
            var avatar = "avatar.png"
            
            if let userAvatar = message.user?.details?.avatar{
                avatar = userAvatar
            }
            
            var image = ""
            
            if message.attachments.count > 0{
                let attachment = message.attachments[0]
                if let img = attachment!.url{
                    image = img
                }
            }
            
            str = "<div class=\"row \(me)\"><div class=\"img\"><img src=\"\(avatar)\"/></div><div class=\"text\"><a>\(str)<img src=\"\(image)\"/></a></div><div class=\"date\">\(now)</div></div>"
            str = "document.body.innerHTML += '\(str)';window.location.href = \"inapp://scroll\""
            
            self.chatView.stringByEvaluatingJavaScript(from: str)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.container.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
//            make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
        }
        
        self.inputContainer.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(47)
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
        }
        
        self.chatInputView.snp.makeConstraints { (make) in
            make.left.equalTo(container.snp.left).offset(10)
            make.right.equalTo(container.snp.right).inset(10)
            make.height.equalTo(40)
            make.bottom.equalToSuperview()
        }
        
        self.chatView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(self.inputContainer.snp.top)
        }
        
        self.loader.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view.snp.center)
        }
    }
}

extension ChatController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.sendMessage(self.chatInputView.text!)
        self.sendMessage(UIButton())
        return true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
           
            self.keyboardFrame = keyboardSize
            inputContainer.snp.makeConstraints { (make) in
                make.bottom.equalTo(self.view.snp.bottom).inset(keyboardSize.height)
            }
            
            container.snp.makeConstraints({ (update) in
                update.bottom.equalTo(self.inputContainer.snp.top)
            })
            
            chatView.snp.makeConstraints { (make) in
                make.bottom.equalTo(container.snp.bottom)
            }
            
            self.view.layoutIfNeeded()
        }
        
    }
}

extension ChatController: UIWebViewDelegate{
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.url?.scheme == "inapp"{
            if request.url?.host == "scroll"{
                let scrollPoint = CGPoint(x: 0, y: self.chatView.scrollView.contentSize.height - self.chatView.frame.size.height)
                self.chatView.scrollView.setContentOffset(scrollPoint, animated: true)
                loader.stopAnimating()
                return false
            }
        }
        return true
    }
    
    
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        
        if(!inited){
            loadMessages()
        }
        
    }
    
    public func webViewDidStartLoad(_ webView: UIWebView) {
        loader.startAnimating()
    }
}

extension ChatController:LiveGQLDelegate{
    
    public func receivedRawMessage(text: String) {
        do{
           print(text)
            if let dataFromString = text.data(using: .utf8, allowLossyConversion: false) {
                
                let item = try JSONDecoder().decode(MessageSubs.self, from: dataFromString)
               
                self.appendToChat(item)
            }
        }
        catch{
            print(error)
        }
    }
}


