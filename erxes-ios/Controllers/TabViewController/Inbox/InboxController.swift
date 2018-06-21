//
//  InboxController.swift
//  Erxes.io
//
//  Created by soyombo bat-erdene on 2/20/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit
import Apollo
import Popover
import SDWebImage
import SWRevealViewController
import Shimmer
import LiveGQL

public struct FilterOptions {

    public var status: String = ""
    public var channel: ChannelDetail? = nil
    public var brand: BrandDetail? = nil
    public var unassigned: String = ""
    public var participating: String = ""
    public var integrationType: String = ""
    public var tag: TagDetail? = nil
    public var startDate: String = ""
    public var endDate: String = ""
    mutating func removeAll() {
        self = FilterOptions()
    }


    public init() { }
}

class InboxController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    fileprivate var popover: Popover!
    fileprivate var popoverOptions: [PopoverOption] = [
            .type(.down),
            .blackOverlayColor(UIColor(white: 0.0, alpha: 0.6))
    ]

    var total = Int()
    var loader: ErxesLoader = {
        let loader = ErxesLoader(frame: CGRect(x: Constants.SCREEN_WIDTH/2-25, y: Constants.SCREEN_HEIGHT/2-25, width: 50, height: 50))
        loader.lineWidth = 3
        return loader
    }()
    var timer: Timer!
    var shadovView = UIView()
    var topOffset: CGFloat = 0.0
    var shimmer: FBShimmeringView!
    var conversationLimit = 10
    let client: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        let currentUser = ErxesUser.sharedUserInfo()
        configuration.httpAdditionalHeaders = ["x-token": currentUser.token as Any,
            "x-refresh-token": currentUser.refreshToken as Any]
        let url = URL(string: Constants.API_ENDPOINT + "/graphql")!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()


    var robotView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = #imageLiteral(resourceName: "robot-2")
        imageview.contentMode = .scaleAspectFit
        let label = UILabel()
        label.textColor = .gray
        label.font = Constants.LIGHT
        label.text = "There is no message."
        label.textAlignment = .center
        imageview.addSubview(label)
        imageview.clipsToBounds = false

        return imageview
    }()

    var filterListView: TagListView = {
        let tagListView = TagListView()
        tagListView.tagBackgroundColor = Constants.ERXES_COLOR
        tagListView.cornerRadius = 6
        tagListView.textFont = UIFont(name: "Montserrat-Light", size: 14)!
        tagListView.textColor = .white
        tagListView.clipsToBounds = false
//        tagListView.removeButtonIconSize = 4
        tagListView.removeIconLineWidth = 1
        tagListView.removeIconLineColor = .white
        tagListView.enableRemoveButton = true
        return tagListView
    }()


    let gql = LiveGQL(socket: Constants.SUBSCRITION_ENDPOINT)

    func configLive() {
        gql.delegate = self
    }

    func subscribe(id: String) {

        gql.subscribe(graphql: "subscription{conversationsChanged(customerId:\"\(id)\"){type,customerId}}", variables: nil, operationName: nil, identifier: "change")

    }

    var conversations = [ObjectDetail]() {
        didSet {

        }
    }

    var lastItem = [ObjectDetail]() {
        didSet {

            let index = lastItem[0].findIndex(from: self.conversations)
      
            self.conversations.remove(at: index)
            self.conversations.insert(lastItem[0], at: 0)

            let updateIndexPath1 = IndexPath(row: index, section: 0)
            let updateIndexPath2 = IndexPath(row: 0, section: 0)

            //
            self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [updateIndexPath1, updateIndexPath2], with: UITableViewRowAnimation.fade)
            self.tableView.endUpdates()
        }
    }

    var filterView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()


    @objc func navigateFilter() {
        let nav = NavigationController()
        let controller = FilterController()
        controller.delegate = self
        nav.viewControllers = [controller]
        self.present(nav, animated: true) {

        }
    }

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ErxesInboxCell.self, forCellReuseIdentifier: "ErxesInboxCell")
        tableView.rowHeight = 120
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.separatorColor = Constants.ERXES_COLOR
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 6.0
        return tableView
    }()

    public var options: FilterOptions? = nil



    func configureViews() {
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        var leftImage = #imageLiteral(resourceName: "ic_filter")
        leftImage = leftImage.withRenderingMode(.alwaysTemplate)
        let leftButton = UIButton()
        leftButton.setImage(leftImage, for: .normal)
        leftButton.addTarget(self, action: #selector(navigateFilter), for: .touchUpInside)
        leftButton.tintColor = Constants.ERXES_COLOR
        let leftItem = UIBarButtonItem()
        leftItem.tintColor = Constants.ERXES_COLOR
        leftItem.customView = leftButton
//        leftItem.image = leftImage

        self.navigationItem.leftBarButtonItem = leftItem

        var rightImage = #imageLiteral(resourceName: "ic_search")
        rightImage = rightImage.withRenderingMode(.alwaysTemplate)
        let rightItem = UIBarButtonItem()
        rightItem.tintColor = Constants.ERXES_COLOR
        rightItem.image = rightImage
//        self.navigationItem.rightBarButtonItem = rightItem
        self.view.addSubview(robotView)
        robotView.isHidden = true
        shadovView.backgroundColor = .white
        shadovView.layer.cornerRadius = 6.0

        self.view.addSubview(shadovView)
        filterListView.delegate = self
        self.view.addSubview(filterListView)

        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.backgroundColor = .white


//        shimmer = FBShimmeringView()
//        shimmer.contentView = tableView
//        self.view.addSubview(shimmer)
//        shimmer.isShimmering = true
        self.view.addSubview(loader)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUser = ErxesUser.sharedUserInfo()

        topOffset = UIApplication.shared.statusBarFrame.height + (self.navigationController?.navigationBar.frame.size.height)! + 3

        self.title = "INBOX"
        self.view.backgroundColor = Constants.INBOX_BG_COLOR
        self.configureViews()
        configLive()
        self.view.bringSubview(toFront: loader)
        self.getInbox()
//        getInbox()
//        getUnreadCount()

    }




    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

//        shimmer.snp.makeConstraints { (make) in
//            make.left.equalTo(self.view.snp.left).offset(16)
//            make.right.equalTo(self.view.snp.right).inset(16)
//            make.top.equalTo(topLayoutGuide.snp.bottom).offset(3)
//            make.bottom.equalTo(self.view.snp.bottom).inset(3)
//        }

        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(16)
            make.right.equalTo(self.view.snp.right).inset(16)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(3)
            make.bottom.equalTo(self.view.snp.bottom).inset(3)
        }

        filterListView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(16)
            make.right.equalTo(view.snp.right).inset(16)
            make.height.equalTo(65)
            make.top.equalTo(topOffset)
        }

        shadovView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(16)
            make.right.equalTo(self.view.snp.right).inset(16)
            make.top.equalTo(topLayoutGuide.snp.bottom).offset(3)
            make.bottom.equalTo(self.view.snp.bottom).inset(3)
        }

        robotView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).inset(30)
            make.center.equalToSuperview()
        }

        robotView.subviews[0].snp.makeConstraints { (make) in
            make.right.left.width.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalTo(robotView.snp.bottom)
        }

//        loader.snp.makeConstraints { (make) in
//            make.width.height.equalTo(50)
//            make.center.equalTo(self.view.snp.center)
//        }

        shadovView.dropShadow(color: Constants.ERXES_COLOR, opacity: 0.2, offSet: CGSize(width: 1.0, height: 1.0), radius: 4, scale: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        self.timer.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func presentViewControllerAsPopover(viewController: UIViewController, from: UIView) {
        if let presentedVC = self.presentedViewController {
            if presentedVC.nibName == viewController.nibName {
                // The view is already being presented
                return
            }
        }
        // Specify presentation style first (makes the popoverPresentationController property available)
        viewController.modalPresentationStyle = .popover
        let viewPresentationController = viewController.popoverPresentationController
        if let presentationController = viewPresentationController {
            presentationController.delegate = self
            presentationController.permittedArrowDirections = [.down, .up]
            presentationController.sourceView = from
            presentationController.sourceRect = from.bounds
        }
        viewController.preferredContentSize = CGSize(width: Constants.SCREEN_WIDTH, height: 300)

        self.present(viewController, animated: true, completion: nil)
    }


    func getLast() {

        let query = GetLastQuery()
        client.fetch(query: query, cachePolicy: CachePolicy.returnCacheDataAndFetch) { [weak self] result, error in
            if let error = error {
              
                let alert = FailureAlert(message: error.localizedDescription)
                alert.show(animated: true)
                self?.loader.stopAnimating()
                return
            }
            if let err = result?.errors {
                let alert = FailureAlert(message: err[0].localizedDescription)
                alert.show(animated: true)
                self?.loader.stopAnimating()
            }

            if result?.data != nil {
                if let rslt = result?.data?.conversationsGetLast {
                    if self?.lastItem.count == 0 {
                        self?.lastItem = [rslt.fragments.objectDetail]
                    } else {
                        for item in (self?.lastItem)! {
                            if !item.isNew(to: rslt.fragments.objectDetail) {
                                self?.lastItem = [rslt.fragments.objectDetail]
                            }
                        }
                    }

                }

            }
        }
    }

    @objc func getInbox(limit: Int = 10) {
        if self.timer != nil {
            self.timer.invalidate()
        }
        loader.startAnimating()
        let query = ObjectsQuery()

        if options != nil {
            query.brandId = options?.brand?.id
            if options?.unassigned.count != 0 {
                query.unassigned = "true"
            }
            if options?.participating.count != 0 {
                query.participating = "true"
            }
            query.channelId = options?.channel?.id
            query.status = options?.status
            query.integrationType = options?.integrationType
            if options?.startDate.count != 0 {
                query.startDate = (options?.startDate)! + " 00:00"
            }

            if options?.endDate.count != 0 {
                query.endDate = (options?.endDate)! + " 00:00"
            }
            query.tag = options?.tag?.id

        }
        query.limit = limit

        client.fetch(query: query, cachePolicy: CachePolicy.returnCacheDataAndFetch) { [weak self] result, error in
            if let error = error {

                let alert = FailureAlert(message: error.localizedDescription)
                alert.show(animated: true)
                self?.loader.stopAnimating()
                return
            }
            if let err = result?.errors {
                let alert = FailureAlert(message: err[0].localizedDescription)
                alert.show(animated: true)
                self?.loader.stopAnimating()
            }
            if result?.data != nil {
                if let allConversations = result?.data?.conversations {
                  
                    if allConversations.count == 0 {
                        self?.conversations.removeAll()
                        self?.tableView.reloadData()
                        self?.shadovView.isHidden = true
                        self?.tableView.isHidden = true
                        self?.robotView.isHidden = false
                    } else {
                        self?.tableView.isHidden = false
                        self?.shadovView.isHidden = false
                        self?.robotView.isHidden = true
                        self?.conversations = allConversations.map { ($0?.fragments.objectDetail)! }

//                    self?.shimmer.isShimmering = false
                        for conversation in (self?.conversations)! {
                            self?.subscribe(id: (conversation.customer?.id)!)
//                            self?.subscribe(id: conversation.id)

                        }
                    }

                    self?.loader.stopAnimating()
                    self?.tableView.reloadData()

                }
            }
        }
    }

    func getUnreadCount() {
        let query = UnreadCountQuery()
        client.fetch(query: query, cachePolicy: CachePolicy.returnCacheDataAndFetch) { [weak self] result, error in
            if let error = error {
    
                let alert = FailureAlert(message: error.localizedDescription)
                alert.show(animated: true)
                return
            }
            if let err = result?.errors {
                let alert = FailureAlert(message: err[0].localizedDescription)
                alert.show(animated: true)
            }
            if result?.data != nil {
                if let count = result?.data?.conversationsTotalUnreadCount {
              
                    if count != 0 {
                        self?.tabBarItem.badgeColor = .red
                        self?.tabBarItem.badgeValue = String(format: "%i", count)
                    } else {
                        self?.tabBarItem.badgeValue = nil
                    }

                }
            }

        }

    }



    func getTimeComponentString(olderDate older: Date, newerDate newer: Date) -> (String?) {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full

        let componentsLeftTime = Calendar.current.dateComponents([.minute, .hour, .day, .month, .weekOfMonth, .year], from: older, to: newer)

        let year = componentsLeftTime.year ?? 0
        if year > 0 {
            formatter.allowedUnits = [.year]
            return formatter.string(from: older, to: newer)
        }


        let month = componentsLeftTime.month ?? 0
        if month > 0 {
            formatter.allowedUnits = [.month]
            return formatter.string(from: older, to: newer)
        }

        let weekOfMonth = componentsLeftTime.weekOfMonth ?? 0
        if weekOfMonth > 0 {
            formatter.allowedUnits = [.weekOfMonth]
            return formatter.string(from: older, to: newer)
        }

        let day = componentsLeftTime.day ?? 0
        if day > 0 {
            formatter.allowedUnits = [.day]
            return formatter.string(from: older, to: newer)
        }

        let hour = componentsLeftTime.hour ?? 0
        if hour > 0 {
            formatter.allowedUnits = [.hour]
            return formatter.string(from: older, to: newer)
        }

        let minute = componentsLeftTime.minute ?? 0
        if minute > 0 {
            formatter.allowedUnits = [.minute]
            return formatter.string(from: older, to: newer) ?? ""
        }

        return nil
    }

}

extension InboxController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if conversations.count != 0 {
            return conversations.count
        }
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ErxesInboxCell", for: indexPath) as? ErxesInboxCell
        if cell == nil {
            cell = ErxesInboxCell.init(style: .default, reuseIdentifier: "ErxesInboxCell")
        }
        if conversations.count != 0 {
            cell?.clearColor()
            let conversation = conversations[indexPath.row]

            cell?.avatar.image = nil
            cell?.fullName.text = ""
            cell?.desc.text = ""
            cell?.message.text = ""
            cell?.date.text = ""
            cell?.userAvatar.image = nil
            var userName = ""
            if conversation.customer?.firstName != nil && conversation.customer?.lastName != nil {
                userName = String(format: "%@ %@", (conversation.customer?.firstName)!, (conversation.customer?.lastName)!)
                if userName.count > 1 {
                    if (conversation.customer?.isUser != nil) {
                        if (conversation.customer?.isUser)! {
                            cell?.avatar.setImageWithString(text: userName, backGroundColor: UIColor(red: 96 / 255, green: 210 / 255, blue: 214 / 255, alpha: 1.0), attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: Constants.LIGHT])
                        } else {
                            cell?.avatar.setImageWithString(text: userName, backGroundColor: Constants.ERXES_COLOR, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: Constants.LIGHT])
                        }
                    } else {
                        cell?.avatar.setImageWithString(text: userName, backGroundColor: Constants.ERXES_COLOR, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: Constants.LIGHT])
                    }
                } else {
                    if conversation.customer?.email != nil {
                        if conversation.customer?.email?.count != 0 {
                            userName = (conversation.customer?.email!)!
                        } else {
                            userName = "Unnamed"
                        }
                    } else {
                        userName = "Unnamed"
                    }

                    cell?.avatar.image = #imageLiteral(resourceName: "ic_avatar")
                }
            } else if conversation.customer?.firstName == nil && conversation.customer?.lastName == nil {
                if conversation.customer?.email != nil {
                    if conversation.customer?.email?.count != 0 {
                        userName = (conversation.customer?.email!)!
                    } else {
                        userName = "Unnamed"
                    }
                } else {
                    userName = "Unnamed"
                }
                cell?.avatar.image = #imageLiteral(resourceName: "ic_avatar")
            } else if conversation.customer?.firstName?.count == 0 && conversation.customer?.lastName?.count == 0 {
                if conversation.customer?.email != nil {
                    if conversation.customer?.email?.count != 0 {
                        userName = (conversation.customer?.email!)!
                    } else {
                        userName = "Unnamed"
                    }
                } else {
                    userName = "Unnamed"
                }

                cell?.avatar.image = #imageLiteral(resourceName: "ic_avatar")
            } else if conversation.customer?.firstName != nil {
                userName = (conversation.customer?.firstName!)!
                if (conversation.customer?.isUser != nil) {
                    if (conversation.customer?.isUser)! {
                        cell?.avatar.setImageWithString(text: userName, backGroundColor: UIColor(red: 96 / 255, green: 210 / 255, blue: 214 / 255, alpha: 1.0), attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: Constants.LIGHT])
                    } else {
                        cell?.avatar.setImageWithString(text: userName, backGroundColor: Constants.ERXES_COLOR, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: Constants.LIGHT])
                    }
                } else {
                    cell?.avatar.setImageWithString(text: userName, backGroundColor: Constants.ERXES_COLOR, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: Constants.LIGHT])
                }
            } else if conversation.customer?.lastName != nil {
                userName = (conversation.customer?.lastName!)!
                if (conversation.customer?.isUser != nil) {
                    if (conversation.customer?.isUser)! {
                        cell?.avatar.setImageWithString(text: userName, backGroundColor: UIColor(red: 96 / 255, green: 210 / 255, blue: 214 / 255, alpha: 1.0), attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: Constants.LIGHT])
                    } else {
                        cell?.avatar.setImageWithString(text: userName, backGroundColor: Constants.ERXES_COLOR, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: Constants.LIGHT])
                    }
                } else {
                    cell?.avatar.setImageWithString(text: userName, backGroundColor: Constants.ERXES_COLOR, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: Constants.LIGHT])
                }
            }


            cell?.fullName.text = userName

            cell?.desc.text = "to " + (conversation.integration?.brand?.name)! + " via " + (conversation.integration?.kind)!

            if conversation.readUserIds?.count == 0 {
                cell?.message.font = Constants.BOLD
                cell?.message.textColor = .black
            } else {
                cell?.message.textColor = Constants.TEXT_COLOR
                cell?.message.font = Constants.LIGHT
            }
            cell?.message.text = conversation.content?.html2String

            let date = conversation.updatedAt?.dateFromUnixTime()

            let now = Date()

            let dateLblValue = self.getTimeComponentString(olderDate: date!, newerDate: now)

            cell?.date.text = dateLblValue
            cell?.tagListView.removeAllTags()

            if conversation.tags?.count != 0 {
                for tag in conversation.tags! {
                    cell?.tagListView.addTag((tag?.name)!)
                }
            }

            if conversation.integration?.kind != nil && conversation.integration?.kind == "facebook" {
                if conversation.facebookData?.kind != nil && conversation.facebookData?.kind == "messenger" {
                    cell?.setIcon(type: .messenger)
                } else if conversation.facebookData?.kind == "feed" {
                    cell?.setIcon(type: .feed)
                }
            } else if conversation.integration?.kind != nil && conversation.integration?.kind == "messenger" {
                if (conversation.customer?.isUser)! {
                    cell?.setIcon(type: .user)
                } else {
                    cell?.setIcon(type: .notuser)
                }
            } else if conversation.integration?.kind != nil && conversation.integration?.kind == "form" {
                cell?.setIcon(type: .form)
            }

            if conversation.assignedUser != nil && conversation.assignedUser?.details?.avatar != nil {
                cell?.userAvatar.sd_setImage(with: URL(string: (conversation.assignedUser?.details?.avatar)!), placeholderImage: UIImage(named: "avatar.png"))

            }
        }

        return cell!
    }


    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        self.timer.invalidate()
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        if maximumOffset - currentOffset <= 0.0 {
            conversationLimit = conversationLimit + 10
            self.getInbox(limit: conversationLimit)
//             self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(inboxTimer(sender:)), userInfo: self.conversationLimit, repeats: true)
        }
    }



    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let conversation = self.conversations[indexPath.row]
        let currentCell = tableView.cellForRow(at: indexPath) as! ErxesInboxCell
  
        var arr = [UITableViewRowAction]()
        let assignAction = UITableViewRowAction(style: .normal, title: "Assign") { (rowAction, indexPath) in
            let controller = UsersController()
            controller.delegate = self
            controller.conversationId = conversation.id
            self.presentViewControllerAsPopover(viewController: controller, from: currentCell.userAvatar)
        }
        assignAction.backgroundColor = Constants.ERXES_COLOR
        arr.append(assignAction)


        if conversation.status == "closed" {
            let openAction = UITableViewRowAction(style: .normal, title: "Open") { (rowAction, indexPath) in
                self.changeStatus(id: conversation.id, status: "open")
            }
            openAction.backgroundColor = UIColor.init(hexString: "f8d05e")
            arr.append(openAction)
        } else {
            let closeAction = UITableViewRowAction(style: .normal, title: "Resolve") { (rowAction, indexPath) in
                //TODO: edit the row at indexPath here
                self.changeStatus(id: conversation.id, status: "closed")
            }
            closeAction.backgroundColor = UIColor.init(hexString: "37ce49")
            arr.append(closeAction)
        }



        return arr
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let conversation = conversations[indexPath.row]
        navigate(.chat(withId: conversation.id, title: (conversation.integration?.brand?.name)!))

    }


    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        let shadovFrame = shadovView.frame
        if scrollView.contentOffset.y < 0 {

            UIView.animate(withDuration: 0.3) {

                self.shadovView.frame = CGRect(x: shadovFrame.origin.x, y: self.topOffset + 75, width: shadovFrame.size.width, height: shadovFrame.size.height)
                self.tableView.frame = CGRect(x: shadovFrame.origin.x, y: self.topOffset + 75, width: shadovFrame.size.width, height: shadovFrame.size.height)

            }
        } else {

            UIView.animate(withDuration: 0.3) {

                self.shadovView.frame = CGRect(x: 16, y: self.topOffset, width: shadovFrame.size.width, height: shadovFrame.size.height)
                self.tableView.frame = CGRect(x: 16, y: self.topOffset, width: shadovFrame.size.width, height: shadovFrame.size.height)
            }
        }
    }


}


extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }

    struct Formatter {
        static let utcFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E MMM dd yyyy HH:mm:ss"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            return dateFormatter
        }()
    }

    var dateFromUTC: Date? {
        let endIndex = self.index(self.endIndex, offsetBy: -15)

        return Formatter.utcFormatter.date(from: self.substring(to: endIndex))

    }


}

extension Int {
    func dateFromUnixTime() -> Date {
//        let date = NSDate(timeIntervalSince1970: TimeInterval(self))
        let timeInterval = Double(self / 1000)
        let date = Date(timeIntervalSince1970: timeInterval)
        return date
    }


}



extension Date {
    struct Formatter {
        static let utcFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()

            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss'Z'"
            dateFormatter.timeZone = TimeZone(identifier: "GMT")
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            return dateFormatter
        }()
    }

    var dateToUTC: String {
        return Formatter.utcFormatter.string(from: self)
    }

    var hourMinutes: String? {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }

}


extension ObjectDetail {
    func isEqual(to other: ObjectDetail) -> Bool {
        if self.id == other.id {

            return true
        } else {

            return false
        }
    }

    func isNew(to other: ObjectDetail) -> Bool {
        if self.content == other.content {

            return true
        } else {

            return false
        }
    }

    func findIndex(from: [ObjectDetail]) -> Int {
        var index: Int = 0

        for (i, element) in from.enumerated() {
            if self.isEqual(to: element) {
                index = i
                return i
            }
        }


        return index
    }
}

extension InboxController: LiveGQLDelegate {

    public func receivedRawMessage(text: String) {
        do {
       
            if let dataFromString = text.data(using: .utf8, allowLossyConversion: false) {

                let item = try JSONDecoder().decode(ConvSubs.self, from: dataFromString)
//                self.getInbox(limit: self.conversationLimit)
                let result = item.payload?.data?.conversationsChanged


                switch result?.type {

                case "newMessage":
                    self.getLast()

                case "open":
                    print("open")
                case "closed":
                    print("close")
                case "assigneeChanged":
                    print("changed")
                default:
                    print("default")
                }
                self.getUnreadCount()

            }
        }
        catch {
            print(error)
        }
    }
}

extension InboxController: FilterDelegate {
    func passFilterOptions(options: FilterOptions) {
        self.options = options
        self.filterListView.removeAllTags()
        if options.brand != nil {
            let tagView = TagView(title: (options.brand?.name)!)

            tagView.cornerRadius = 6
            tagView.enableRemoveButton = true
            tagView.removeIconLineColor = .white
            tagView.removeIconLineWidth = 0.7

            tagView.tag = 101
            tagView.addTarget(self, action: #selector(removeTag(sender:)), for: .touchUpInside)

            tagView.backgroundColor = Constants.ERXES_COLOR
            tagView.textFont = UIFont(name: "Montserrat-Light", size: 14)!
            tagView.clipsToBounds = false
            self.filterListView.addTagView(tagView)
        }
        if options.channel != nil {
            let tagView = TagView(title: (options.channel?.name)!)
            tagView.cornerRadius = 6
            tagView.enableRemoveButton = true
            tagView.removeIconLineColor = .white
            tagView.removeIconLineWidth = 0.7
            tagView.tag = 102
            tagView.addTarget(self, action: #selector(removeTag(sender:)), for: .touchUpInside)

            tagView.backgroundColor = Constants.ERXES_COLOR
            tagView.textFont = UIFont(name: "Montserrat-Light", size: 14)!
            tagView.clipsToBounds = false
            self.filterListView.addTagView(tagView)
//            self.filterListView.addTag((options.channel?.name)!)
        }
        if options.tag != nil {
            let tagView = TagView(title: (options.tag?.name)!)
            tagView.cornerRadius = 6
            tagView.enableRemoveButton = true
            tagView.removeIconLineColor = .white
            tagView.removeIconLineWidth = 0.7
            tagView.tag = 103
            tagView.addTarget(self, action: #selector(removeTag(sender:)), for: .touchUpInside)

            tagView.backgroundColor = Constants.ERXES_COLOR
            tagView.textFont = UIFont(name: "Montserrat-Light", size: 14)!
            tagView.clipsToBounds = false
            self.filterListView.addTagView(tagView)
        }

        if options.startDate.count != 0 && options.endDate.count != 0 {
            let tagView = TagView(title: options.startDate + " - " + options.endDate)
            tagView.cornerRadius = 6
            tagView.enableRemoveButton = true
            tagView.removeIconLineColor = .white
            tagView.removeIconLineWidth = 0.7
            tagView.tag = 104
            tagView.addTarget(self, action: #selector(removeTag(sender:)), for: .touchUpInside)

            tagView.backgroundColor = Constants.ERXES_COLOR
            tagView.textFont = UIFont(name: "Montserrat-Light", size: 14)!
            tagView.clipsToBounds = false
            self.filterListView.addTagView(tagView)
        }
        if options.status.count != 0 {
            let tagView = TagView(title: options.status)
            tagView.cornerRadius = 6
            tagView.enableRemoveButton = true
            tagView.removeIconLineColor = .white
            tagView.removeIconLineWidth = 0.7
            tagView.tag = 105
            tagView.addTarget(self, action: #selector(removeTag(sender:)), for: .touchUpInside)

            tagView.backgroundColor = Constants.ERXES_COLOR
            tagView.textFont = UIFont(name: "Montserrat-Light", size: 14)!
            tagView.clipsToBounds = false
            self.filterListView.addTagView(tagView)
        }
        if options.participating.count != 0 {
            let tagView = TagView(title: "Participating")
            tagView.cornerRadius = 6
            tagView.enableRemoveButton = true
            tagView.removeIconLineColor = .white
            tagView.removeIconLineWidth = 0.7
            tagView.tag = 106
            tagView.addTarget(self, action: #selector(removeTag(sender:)), for: .touchUpInside)

            tagView.backgroundColor = Constants.ERXES_COLOR
            tagView.textFont = UIFont(name: "Montserrat-Light", size: 14)!
            tagView.clipsToBounds = false
            self.filterListView.addTagView(tagView)
        }
        if options.unassigned.count != 0 {

            let tagView = TagView(title: "Unassigned")
            tagView.cornerRadius = 6
            tagView.enableRemoveButton = true
            tagView.removeIconLineColor = .white
            tagView.removeIconLineWidth = 0.7
            tagView.tag = 107
            tagView.addTarget(self, action: #selector(removeTag(sender:)), for: .touchUpInside)

            tagView.backgroundColor = Constants.ERXES_COLOR
            tagView.textFont = UIFont(name: "Montserrat-Light", size: 14)!
            tagView.clipsToBounds = false
            self.filterListView.addTagView(tagView)
        }
        if options.integrationType.count != 0 {
            let tagView = TagView(title: options.integrationType)
            tagView.cornerRadius = 6
            tagView.enableRemoveButton = true
            tagView.removeIconLineColor = .white
            tagView.removeIconLineWidth = 0.7
            tagView.tag = 108
            tagView.addTarget(self, action: #selector(removeTag(sender:)), for: .touchUpInside)
//
            tagView.backgroundColor = Constants.ERXES_COLOR
            tagView.textFont = UIFont(name: "Montserrat-Light", size: 14)!
            tagView.clipsToBounds = false
            self.filterListView.addTagView(tagView)
        }
        self.getInbox(limit: 10)
    }

    @objc func removeTag(sender: TagView) {
        self.filterListView.removeTagView(sender)
        switch sender.tag {
        case 101:
            self.options?.brand = nil
        case 102:
            self.options?.channel = nil
        case 103:
            self.options?.tag = nil
        case 104:
            self.options?.startDate = ""
            self.options?.endDate = ""
        case 105:
            self.options?.status = ""
        case 106:
            self.options?.participating = ""
        case 107:
            self.options?.unassigned = ""
        case 108:
            self.options?.integrationType = ""
        default:
            print("")
        }
        self.getInbox(limit: 10)
    }
}

extension InboxController: TagListViewDelegate {
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {

    }

    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {

    }
}

extension InboxController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension InboxController: UserControllerDelegate {
    func assignUser(userId:String, conversationId:String){
        let mutation = ConversationsAssignMutation(conversationIds: [conversationId])
        mutation.assignedUserId = userId
        client.perform(mutation: mutation) { [weak self] result, error in
            if let error = error {
                print(error.localizedDescription)
                let alert = FailureAlert(message: error.localizedDescription)
                alert.show(animated: true)
                self?.loader.stopAnimating()
                return
            }
            if let err = result?.errors {
                let alert = FailureAlert(message: err[0].localizedDescription)
                alert.show(animated: true)
                self?.loader.stopAnimating()
            }
            if result?.data != nil {
                self?.getInbox(limit: (self?.conversationLimit)!)
            }
        }
    }
}

extension InboxController {
    func changeStatus(id:String, status:String){
        let mutation = ConversationsChangeStatusMutation(_ids: [id], status: status)
        client.perform(mutation: mutation) { [weak self] result, error in
            if let error = error {
                print(error.localizedDescription)
                let alert = FailureAlert(message: error.localizedDescription)
                alert.show(animated: true)
                self?.loader.stopAnimating()
                return
            }
            if let err = result?.errors {
                let alert = FailureAlert(message: err[0].localizedDescription)
                alert.show(animated: true)
                self?.loader.stopAnimating()
            }
            if result?.data != nil {
                self?.getInbox(limit: (self?.conversationLimit)!)
            }
        }
        
    }
}

