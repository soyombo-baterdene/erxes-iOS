//  This file was automatically generated and should not be edited.

import Apollo

public final class BrandsQuery: GraphQLQuery {
  public static let operationString =
    "query Brands {\n  brands {\n    __typename\n    ...BrandDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(BrandDetail.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("brands", type: .list(.object(Brand.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(brands: [Brand?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "brands": brands.flatMap { (value: [Brand?]) -> [Snapshot?] in value.map { (value: Brand?) -> Snapshot? in value.flatMap { (value: Brand) -> Snapshot in value.snapshot } } }])
    }

    public var brands: [Brand?]? {
      get {
        return (snapshot["brands"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Brand?] in value.map { (value: Snapshot?) -> Brand? in value.flatMap { (value: Snapshot) -> Brand in Brand(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Brand?]) -> [Snapshot?] in value.map { (value: Brand?) -> Snapshot? in value.flatMap { (value: Brand) -> Snapshot in value.snapshot } } }, forKey: "brands")
      }
    }

    public struct Brand: GraphQLSelectionSet {
      public static let possibleTypes = ["Brand"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, name: String? = nil) {
        self.init(snapshot: ["__typename": "Brand", "_id": id, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var brandDetail: BrandDetail {
          get {
            return BrandDetail(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public final class ChannelsQuery: GraphQLQuery {
  public static let operationString =
    "query Channels {\n  channels {\n    __typename\n    ...ChannelDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(ChannelDetail.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("channels", type: .list(.object(Channel.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(channels: [Channel?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "channels": channels.flatMap { (value: [Channel?]) -> [Snapshot?] in value.map { (value: Channel?) -> Snapshot? in value.flatMap { (value: Channel) -> Snapshot in value.snapshot } } }])
    }

    public var channels: [Channel?]? {
      get {
        return (snapshot["channels"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Channel?] in value.map { (value: Snapshot?) -> Channel? in value.flatMap { (value: Snapshot) -> Channel in Channel(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Channel?]) -> [Snapshot?] in value.map { (value: Channel?) -> Snapshot? in value.flatMap { (value: Channel) -> Snapshot in value.snapshot } } }, forKey: "channels")
      }
    }

    public struct Channel: GraphQLSelectionSet {
      public static let possibleTypes = ["Channel"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("integrationIds", type: .list(.scalar(String.self))),
        GraphQLField("memberIds", type: .list(.scalar(String.self))),
        GraphQLField("conversationCount", type: .scalar(Int.self)),
        GraphQLField("openConversationCount", type: .scalar(Int.self)),
        GraphQLField("integrations", type: .list(.object(Integration.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, name: String, description: String? = nil, integrationIds: [String?]? = nil, memberIds: [String?]? = nil, conversationCount: Int? = nil, openConversationCount: Int? = nil, integrations: [Integration?]? = nil) {
        self.init(snapshot: ["__typename": "Channel", "_id": id, "name": name, "description": description, "integrationIds": integrationIds, "memberIds": memberIds, "conversationCount": conversationCount, "openConversationCount": openConversationCount, "integrations": integrations.flatMap { (value: [Integration?]) -> [Snapshot?] in value.map { (value: Integration?) -> Snapshot? in value.flatMap { (value: Integration) -> Snapshot in value.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var integrationIds: [String?]? {
        get {
          return snapshot["integrationIds"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "integrationIds")
        }
      }

      public var memberIds: [String?]? {
        get {
          return snapshot["memberIds"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "memberIds")
        }
      }

      public var conversationCount: Int? {
        get {
          return snapshot["conversationCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "conversationCount")
        }
      }

      public var openConversationCount: Int? {
        get {
          return snapshot["openConversationCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "openConversationCount")
        }
      }

      public var integrations: [Integration?]? {
        get {
          return (snapshot["integrations"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Integration?] in value.map { (value: Snapshot?) -> Integration? in value.flatMap { (value: Snapshot) -> Integration in Integration(snapshot: value) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { (value: [Integration?]) -> [Snapshot?] in value.map { (value: Integration?) -> Snapshot? in value.flatMap { (value: Integration) -> Snapshot in value.snapshot } } }, forKey: "integrations")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var channelDetail: ChannelDetail {
          get {
            return ChannelDetail(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Integration: GraphQLSelectionSet {
        public static let possibleTypes = ["Integration"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("code", type: .scalar(String.self)),
          GraphQLField("formId", type: .scalar(String.self)),
          GraphQLField("formData", type: .scalar(JSON.self)),
          GraphQLField("messengerData", type: .scalar(JSON.self)),
          GraphQLField("twitterData", type: .scalar(JSON.self)),
          GraphQLField("facebookData", type: .scalar(JSON.self)),
          GraphQLField("uiOptions", type: .scalar(JSON.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(code: String? = nil, formId: String? = nil, formData: JSON? = nil, messengerData: JSON? = nil, twitterData: JSON? = nil, facebookData: JSON? = nil, uiOptions: JSON? = nil) {
          self.init(snapshot: ["__typename": "Integration", "code": code, "formId": formId, "formData": formData, "messengerData": messengerData, "twitterData": twitterData, "facebookData": facebookData, "uiOptions": uiOptions])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: String? {
          get {
            return snapshot["code"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "code")
          }
        }

        public var formId: String? {
          get {
            return snapshot["formId"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "formId")
          }
        }

        public var formData: JSON? {
          get {
            return snapshot["formData"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "formData")
          }
        }

        public var messengerData: JSON? {
          get {
            return snapshot["messengerData"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "messengerData")
          }
        }

        public var twitterData: JSON? {
          get {
            return snapshot["twitterData"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "twitterData")
          }
        }

        public var facebookData: JSON? {
          get {
            return snapshot["facebookData"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "facebookData")
          }
        }

        public var uiOptions: JSON? {
          get {
            return snapshot["uiOptions"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "uiOptions")
          }
        }
      }
    }
  }
}

public final class TagsQuery: GraphQLQuery {
  public static let operationString =
    "query tags($type: String) {\n  tags(type: $type) {\n    __typename\n    ...TagDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(TagDetail.fragmentString) }

  public var type: String?

  public init(type: String? = nil) {
    self.type = type
  }

  public var variables: GraphQLMap? {
    return ["type": type]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("tags", arguments: ["type": GraphQLVariable("type")], type: .list(.object(Tag.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(tags: [Tag?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "tags": tags.flatMap { (value: [Tag?]) -> [Snapshot?] in value.map { (value: Tag?) -> Snapshot? in value.flatMap { (value: Tag) -> Snapshot in value.snapshot } } }])
    }

    public var tags: [Tag?]? {
      get {
        return (snapshot["tags"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Tag?] in value.map { (value: Snapshot?) -> Tag? in value.flatMap { (value: Snapshot) -> Tag in Tag(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Tag?]) -> [Snapshot?] in value.map { (value: Tag?) -> Snapshot? in value.flatMap { (value: Tag) -> Snapshot in value.snapshot } } }, forKey: "tags")
      }
    }

    public struct Tag: GraphQLSelectionSet {
      public static let possibleTypes = ["Tag"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("colorCode", type: .scalar(String.self)),
        GraphQLField("objectCount", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, name: String? = nil, type: String? = nil, colorCode: String? = nil, objectCount: Int? = nil) {
        self.init(snapshot: ["__typename": "Tag", "_id": id, "name": name, "type": type, "colorCode": colorCode, "objectCount": objectCount])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var type: String? {
        get {
          return snapshot["type"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "type")
        }
      }

      public var colorCode: String? {
        get {
          return snapshot["colorCode"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "colorCode")
        }
      }

      public var objectCount: Int? {
        get {
          return snapshot["objectCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "objectCount")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var tagDetail: TagDetail {
          get {
            return TagDetail(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  public static let operationString =
    "mutation Login($email: String!, $password: String!) {\n  login(email: $email, password: $password) {\n    __typename\n    token\n    refreshToken\n  }\n}"

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .nonNull(.object(Login.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(login: Login) {
      self.init(snapshot: ["__typename": "Mutation", "login": login.snapshot])
    }

    public var login: Login {
      get {
        return Login(snapshot: snapshot["login"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes = ["AuthPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .nonNull(.scalar(String.self))),
        GraphQLField("refreshToken", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(token: String, refreshToken: String) {
        self.init(snapshot: ["__typename": "AuthPayload", "token": token, "refreshToken": refreshToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return snapshot["token"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "token")
        }
      }

      public var refreshToken: String {
        get {
          return snapshot["refreshToken"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "refreshToken")
        }
      }
    }
  }
}

public final class CurrentUserQuery: GraphQLQuery {
  public static let operationString =
    "query CurrentUser {\n  currentUser {\n    __typename\n    _id\n    username\n    email\n    role\n    details {\n      __typename\n      avatar\n      fullName\n      position\n    }\n    getNotificationByEmail\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("currentUser", type: .object(CurrentUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(currentUser: CurrentUser? = nil) {
      self.init(snapshot: ["__typename": "Query", "currentUser": currentUser.flatMap { (value: CurrentUser) -> Snapshot in value.snapshot }])
    }

    public var currentUser: CurrentUser? {
      get {
        return (snapshot["currentUser"] as? Snapshot).flatMap { CurrentUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "currentUser")
      }
    }

    public struct CurrentUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("role", type: .scalar(String.self)),
        GraphQLField("details", type: .object(Detail.selections)),
        GraphQLField("getNotificationByEmail", type: .scalar(Bool.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, username: String? = nil, email: String? = nil, role: String? = nil, details: Detail? = nil, getNotificationByEmail: Bool? = nil) {
        self.init(snapshot: ["__typename": "User", "_id": id, "username": username, "email": email, "role": role, "details": details.flatMap { (value: Detail) -> Snapshot in value.snapshot }, "getNotificationByEmail": getNotificationByEmail])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var email: String? {
        get {
          return snapshot["email"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var role: String? {
        get {
          return snapshot["role"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "role")
        }
      }

      public var details: Detail? {
        get {
          return (snapshot["details"] as? Snapshot).flatMap { Detail(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "details")
        }
      }

      public var getNotificationByEmail: Bool? {
        get {
          return snapshot["getNotificationByEmail"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "getNotificationByEmail")
        }
      }

      public struct Detail: GraphQLSelectionSet {
        public static let possibleTypes = ["UserDetailsType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .scalar(String.self)),
          GraphQLField("fullName", type: .scalar(String.self)),
          GraphQLField("position", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(avatar: String? = nil, fullName: String? = nil, position: String? = nil) {
          self.init(snapshot: ["__typename": "UserDetailsType", "avatar": avatar, "fullName": fullName, "position": position])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var avatar: String? {
          get {
            return snapshot["avatar"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "avatar")
          }
        }

        public var fullName: String? {
          get {
            return snapshot["fullName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "fullName")
          }
        }

        public var position: String? {
          get {
            return snapshot["position"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "position")
          }
        }
      }
    }
  }
}

public final class ConversationMessageAddMutation: GraphQLMutation {
  public static let operationString =
    "mutation ConversationMessageAdd($conversationId: String!, $content: String!) {\n  conversationMessageAdd(conversationId: $conversationId, content: $content) {\n    __typename\n    _id\n  }\n}"

  public var conversationId: String
  public var content: String

  public init(conversationId: String, content: String) {
    self.conversationId = conversationId
    self.content = content
  }

  public var variables: GraphQLMap? {
    return ["conversationId": conversationId, "content": content]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("conversationMessageAdd", arguments: ["conversationId": GraphQLVariable("conversationId"), "content": GraphQLVariable("content")], type: .object(ConversationMessageAdd.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(conversationMessageAdd: ConversationMessageAdd? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "conversationMessageAdd": conversationMessageAdd.flatMap { (value: ConversationMessageAdd) -> Snapshot in value.snapshot }])
    }

    public var conversationMessageAdd: ConversationMessageAdd? {
      get {
        return (snapshot["conversationMessageAdd"] as? Snapshot).flatMap { ConversationMessageAdd(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "conversationMessageAdd")
      }
    }

    public struct ConversationMessageAdd: GraphQLSelectionSet {
      public static let possibleTypes = ["ConversationMessage"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String) {
        self.init(snapshot: ["__typename": "ConversationMessage", "_id": id])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }
    }
  }
}

public final class ConversationDetailQuery: GraphQLQuery {
  public static let operationString =
    "query ConversationDetail($_id: String!) {\n  conversationDetail(_id: $_id) {\n    __typename\n    messages {\n      __typename\n      ...MessageDetail\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(MessageDetail.fragmentString) }

  public var _id: String

  public init(_id: String) {
    self._id = _id
  }

  public var variables: GraphQLMap? {
    return ["_id": _id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("conversationDetail", arguments: ["_id": GraphQLVariable("_id")], type: .object(ConversationDetail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(conversationDetail: ConversationDetail? = nil) {
      self.init(snapshot: ["__typename": "Query", "conversationDetail": conversationDetail.flatMap { (value: ConversationDetail) -> Snapshot in value.snapshot }])
    }

    public var conversationDetail: ConversationDetail? {
      get {
        return (snapshot["conversationDetail"] as? Snapshot).flatMap { ConversationDetail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "conversationDetail")
      }
    }

    public struct ConversationDetail: GraphQLSelectionSet {
      public static let possibleTypes = ["Conversation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("messages", type: .list(.object(Message.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(messages: [Message?]? = nil) {
        self.init(snapshot: ["__typename": "Conversation", "messages": messages.flatMap { (value: [Message?]) -> [Snapshot?] in value.map { (value: Message?) -> Snapshot? in value.flatMap { (value: Message) -> Snapshot in value.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var messages: [Message?]? {
        get {
          return (snapshot["messages"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Message?] in value.map { (value: Snapshot?) -> Message? in value.flatMap { (value: Snapshot) -> Message in Message(snapshot: value) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { (value: [Message?]) -> [Snapshot?] in value.map { (value: Message?) -> Snapshot? in value.flatMap { (value: Message) -> Snapshot in value.snapshot } } }, forKey: "messages")
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationMessage"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .scalar(String.self)),
          GraphQLField("attachments", type: .list(.scalar(JSON.self))),
          GraphQLField("conversationId", type: .scalar(String.self)),
          GraphQLField("customerId", type: .scalar(String.self)),
          GraphQLField("userId", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(Int.self)),
          GraphQLField("user", type: .object(User.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, content: String? = nil, attachments: [JSON?]? = nil, conversationId: String? = nil, customerId: String? = nil, userId: String? = nil, createdAt: Int? = nil, user: User? = nil) {
          self.init(snapshot: ["__typename": "ConversationMessage", "_id": id, "content": content, "attachments": attachments, "conversationId": conversationId, "customerId": customerId, "userId": userId, "createdAt": createdAt, "user": user.flatMap { (value: User) -> Snapshot in value.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["_id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "_id")
          }
        }

        public var content: String? {
          get {
            return snapshot["content"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "content")
          }
        }

        public var attachments: [JSON?]? {
          get {
            return snapshot["attachments"] as? [JSON?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "attachments")
          }
        }

        public var conversationId: String? {
          get {
            return snapshot["conversationId"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "conversationId")
          }
        }

        public var customerId: String? {
          get {
            return snapshot["customerId"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "customerId")
          }
        }

        public var userId: String? {
          get {
            return snapshot["userId"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "userId")
          }
        }

        public var createdAt: Int? {
          get {
            return snapshot["createdAt"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var user: User? {
          get {
            return (snapshot["user"] as? Snapshot).flatMap { User(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "user")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var messageDetail: MessageDetail {
            get {
              return MessageDetail(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("username", type: .scalar(String.self)),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("role", type: .scalar(String.self)),
            GraphQLField("getNotificationByEmail", type: .scalar(Bool.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(username: String? = nil, email: String? = nil, role: String? = nil, getNotificationByEmail: Bool? = nil) {
            self.init(snapshot: ["__typename": "User", "username": username, "email": email, "role": role, "getNotificationByEmail": getNotificationByEmail])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var username: String? {
            get {
              return snapshot["username"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "username")
            }
          }

          public var email: String? {
            get {
              return snapshot["email"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "email")
            }
          }

          public var role: String? {
            get {
              return snapshot["role"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "role")
            }
          }

          public var getNotificationByEmail: Bool? {
            get {
              return snapshot["getNotificationByEmail"] as? Bool
            }
            set {
              snapshot.updateValue(newValue, forKey: "getNotificationByEmail")
            }
          }
        }
      }
    }
  }
}

public final class CustomersQuery: GraphQLQuery {
  public static let operationString =
    "query Customers($page: Int, $perPage: Int, $segment: String, $tag: String, $ids: [String], $searchValue: String) {\n  customers(page: $page, perPage: $perPage, segment: $segment, tag: $tag, ids: $ids, searchValue: $searchValue) {\n    __typename\n    ...CustomerDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(CustomerDetail.fragmentString) }

  public var page: Int?
  public var perPage: Int?
  public var segment: String?
  public var tag: String?
  public var ids: [String?]?
  public var searchValue: String?

  public init(page: Int? = nil, perPage: Int? = nil, segment: String? = nil, tag: String? = nil, ids: [String?]? = nil, searchValue: String? = nil) {
    self.page = page
    self.perPage = perPage
    self.segment = segment
    self.tag = tag
    self.ids = ids
    self.searchValue = searchValue
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage, "segment": segment, "tag": tag, "ids": ids, "searchValue": searchValue]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("customers", arguments: ["page": GraphQLVariable("page"), "perPage": GraphQLVariable("perPage"), "segment": GraphQLVariable("segment"), "tag": GraphQLVariable("tag"), "ids": GraphQLVariable("ids"), "searchValue": GraphQLVariable("searchValue")], type: .list(.object(Customer.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(customers: [Customer?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "customers": customers.flatMap { (value: [Customer?]) -> [Snapshot?] in value.map { (value: Customer?) -> Snapshot? in value.flatMap { (value: Customer) -> Snapshot in value.snapshot } } }])
    }

    public var customers: [Customer?]? {
      get {
        return (snapshot["customers"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Customer?] in value.map { (value: Snapshot?) -> Customer? in value.flatMap { (value: Snapshot) -> Customer in Customer(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Customer?]) -> [Snapshot?] in value.map { (value: Customer?) -> Snapshot? in value.flatMap { (value: Customer) -> Snapshot in value.snapshot } } }, forKey: "customers")
      }
    }

    public struct Customer: GraphQLSelectionSet {
      public static let possibleTypes = ["Customer"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("firstName", type: .scalar(String.self)),
        GraphQLField("lastName", type: .scalar(String.self)),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("phone", type: .scalar(String.self)),
        GraphQLField("isUser", type: .scalar(Bool.self)),
        GraphQLField("integrationId", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .scalar(Int.self)),
        GraphQLField("remoteAddress", type: .scalar(String.self)),
        GraphQLField("location", type: .scalar(JSON.self)),
        GraphQLField("visitorContactInfo", type: .scalar(JSON.self)),
        GraphQLField("customFieldsData", type: .scalar(JSON.self)),
        GraphQLField("twitterData", type: .scalar(JSON.self)),
        GraphQLField("facebookData", type: .scalar(JSON.self)),
        GraphQLField("ownerId", type: .scalar(String.self)),
        GraphQLField("position", type: .scalar(String.self)),
        GraphQLField("department", type: .scalar(String.self)),
        GraphQLField("leadStatus", type: .scalar(String.self)),
        GraphQLField("lifecycleState", type: .scalar(String.self)),
        GraphQLField("hasAuthority", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("doNotDisturb", type: .scalar(String.self)),
        GraphQLField("links", type: .object(Link.selections)),
        GraphQLField("owner", type: .object(Owner.selections)),
        GraphQLField("tagIds", type: .list(.scalar(String.self))),
        GraphQLField("getTags", type: .list(.object(GetTag.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, firstName: String? = nil, lastName: String? = nil, email: String? = nil, phone: String? = nil, isUser: Bool? = nil, integrationId: String? = nil, createdAt: Int? = nil, remoteAddress: String? = nil, location: JSON? = nil, visitorContactInfo: JSON? = nil, customFieldsData: JSON? = nil, twitterData: JSON? = nil, facebookData: JSON? = nil, ownerId: String? = nil, position: String? = nil, department: String? = nil, leadStatus: String? = nil, lifecycleState: String? = nil, hasAuthority: String? = nil, description: String? = nil, doNotDisturb: String? = nil, links: Link? = nil, owner: Owner? = nil, tagIds: [String?]? = nil, getTags: [GetTag?]? = nil) {
        self.init(snapshot: ["__typename": "Customer", "_id": id, "firstName": firstName, "lastName": lastName, "email": email, "phone": phone, "isUser": isUser, "integrationId": integrationId, "createdAt": createdAt, "remoteAddress": remoteAddress, "location": location, "visitorContactInfo": visitorContactInfo, "customFieldsData": customFieldsData, "twitterData": twitterData, "facebookData": facebookData, "ownerId": ownerId, "position": position, "department": department, "leadStatus": leadStatus, "lifecycleState": lifecycleState, "hasAuthority": hasAuthority, "description": description, "doNotDisturb": doNotDisturb, "links": links.flatMap { (value: Link) -> Snapshot in value.snapshot }, "owner": owner.flatMap { (value: Owner) -> Snapshot in value.snapshot }, "tagIds": tagIds, "getTags": getTags.flatMap { (value: [GetTag?]) -> [Snapshot?] in value.map { (value: GetTag?) -> Snapshot? in value.flatMap { (value: GetTag) -> Snapshot in value.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["firstName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["lastName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "lastName")
        }
      }

      public var email: String? {
        get {
          return snapshot["email"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "email")
        }
      }

      public var phone: String? {
        get {
          return snapshot["phone"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "phone")
        }
      }

      public var isUser: Bool? {
        get {
          return snapshot["isUser"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isUser")
        }
      }

      public var integrationId: String? {
        get {
          return snapshot["integrationId"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "integrationId")
        }
      }

      public var createdAt: Int? {
        get {
          return snapshot["createdAt"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var remoteAddress: String? {
        get {
          return snapshot["remoteAddress"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "remoteAddress")
        }
      }

      public var location: JSON? {
        get {
          return snapshot["location"] as? JSON
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      public var visitorContactInfo: JSON? {
        get {
          return snapshot["visitorContactInfo"] as? JSON
        }
        set {
          snapshot.updateValue(newValue, forKey: "visitorContactInfo")
        }
      }

      public var customFieldsData: JSON? {
        get {
          return snapshot["customFieldsData"] as? JSON
        }
        set {
          snapshot.updateValue(newValue, forKey: "customFieldsData")
        }
      }

      public var twitterData: JSON? {
        get {
          return snapshot["twitterData"] as? JSON
        }
        set {
          snapshot.updateValue(newValue, forKey: "twitterData")
        }
      }

      public var facebookData: JSON? {
        get {
          return snapshot["facebookData"] as? JSON
        }
        set {
          snapshot.updateValue(newValue, forKey: "facebookData")
        }
      }

      public var ownerId: String? {
        get {
          return snapshot["ownerId"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ownerId")
        }
      }

      public var position: String? {
        get {
          return snapshot["position"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "position")
        }
      }

      public var department: String? {
        get {
          return snapshot["department"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "department")
        }
      }

      public var leadStatus: String? {
        get {
          return snapshot["leadStatus"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "leadStatus")
        }
      }

      public var lifecycleState: String? {
        get {
          return snapshot["lifecycleState"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "lifecycleState")
        }
      }

      public var hasAuthority: String? {
        get {
          return snapshot["hasAuthority"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "hasAuthority")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var doNotDisturb: String? {
        get {
          return snapshot["doNotDisturb"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "doNotDisturb")
        }
      }

      public var links: Link? {
        get {
          return (snapshot["links"] as? Snapshot).flatMap { Link(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "links")
        }
      }

      public var owner: Owner? {
        get {
          return (snapshot["owner"] as? Snapshot).flatMap { Owner(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "owner")
        }
      }

      public var tagIds: [String?]? {
        get {
          return snapshot["tagIds"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "tagIds")
        }
      }

      public var getTags: [GetTag?]? {
        get {
          return (snapshot["getTags"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [GetTag?] in value.map { (value: Snapshot?) -> GetTag? in value.flatMap { (value: Snapshot) -> GetTag in GetTag(snapshot: value) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { (value: [GetTag?]) -> [Snapshot?] in value.map { (value: GetTag?) -> Snapshot? in value.flatMap { (value: GetTag) -> Snapshot in value.snapshot } } }, forKey: "getTags")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var customerDetail: CustomerDetail {
          get {
            return CustomerDetail(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Link: GraphQLSelectionSet {
        public static let possibleTypes = ["CustomerLinks"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("linkedIn", type: .scalar(String.self)),
          GraphQLField("twitter", type: .scalar(String.self)),
          GraphQLField("facebook", type: .scalar(String.self)),
          GraphQLField("github", type: .scalar(String.self)),
          GraphQLField("youtube", type: .scalar(String.self)),
          GraphQLField("website", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(linkedIn: String? = nil, twitter: String? = nil, facebook: String? = nil, github: String? = nil, youtube: String? = nil, website: String? = nil) {
          self.init(snapshot: ["__typename": "CustomerLinks", "linkedIn": linkedIn, "twitter": twitter, "facebook": facebook, "github": github, "youtube": youtube, "website": website])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var linkedIn: String? {
          get {
            return snapshot["linkedIn"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "linkedIn")
          }
        }

        public var twitter: String? {
          get {
            return snapshot["twitter"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "twitter")
          }
        }

        public var facebook: String? {
          get {
            return snapshot["facebook"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "facebook")
          }
        }

        public var github: String? {
          get {
            return snapshot["github"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "github")
          }
        }

        public var youtube: String? {
          get {
            return snapshot["youtube"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "youtube")
          }
        }

        public var website: String? {
          get {
            return snapshot["website"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "website")
          }
        }
      }

      public struct Owner: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("details", type: .object(Detail.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(details: Detail? = nil) {
          self.init(snapshot: ["__typename": "User", "details": details.flatMap { (value: Detail) -> Snapshot in value.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var details: Detail? {
          get {
            return (snapshot["details"] as? Snapshot).flatMap { Detail(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "details")
          }
        }

        public struct Detail: GraphQLSelectionSet {
          public static let possibleTypes = ["UserDetailsType"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("fullName", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(fullName: String? = nil) {
            self.init(snapshot: ["__typename": "UserDetailsType", "fullName": fullName])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fullName: String? {
            get {
              return snapshot["fullName"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "fullName")
            }
          }
        }
      }

      public struct GetTag: GraphQLSelectionSet {
        public static let possibleTypes = ["Tag"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("colorCode", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, name: String? = nil, colorCode: String? = nil) {
          self.init(snapshot: ["__typename": "Tag", "_id": id, "name": name, "colorCode": colorCode])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["_id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "_id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var colorCode: String? {
          get {
            return snapshot["colorCode"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "colorCode")
          }
        }
      }
    }
  }
}

public final class CompaniesQuery: GraphQLQuery {
  public static let operationString =
    "query Companies($page: Int, $perPage: Int, $segment: String, $tag: String, $ids: [String], $searchValue: String) {\n  companies(page: $page, perPage: $perPage, segment: $segment, tag: $tag, ids: $ids, searchValue: $searchValue) {\n    __typename\n    ...CompanyDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(CompanyDetail.fragmentString) }

  public var page: Int?
  public var perPage: Int?
  public var segment: String?
  public var tag: String?
  public var ids: [String?]?
  public var searchValue: String?

  public init(page: Int? = nil, perPage: Int? = nil, segment: String? = nil, tag: String? = nil, ids: [String?]? = nil, searchValue: String? = nil) {
    self.page = page
    self.perPage = perPage
    self.segment = segment
    self.tag = tag
    self.ids = ids
    self.searchValue = searchValue
  }

  public var variables: GraphQLMap? {
    return ["page": page, "perPage": perPage, "segment": segment, "tag": tag, "ids": ids, "searchValue": searchValue]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("companies", arguments: ["page": GraphQLVariable("page"), "perPage": GraphQLVariable("perPage"), "segment": GraphQLVariable("segment"), "tag": GraphQLVariable("tag"), "ids": GraphQLVariable("ids"), "searchValue": GraphQLVariable("searchValue")], type: .list(.object(Company.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(companies: [Company?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "companies": companies.flatMap { (value: [Company?]) -> [Snapshot?] in value.map { (value: Company?) -> Snapshot? in value.flatMap { (value: Company) -> Snapshot in value.snapshot } } }])
    }

    public var companies: [Company?]? {
      get {
        return (snapshot["companies"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Company?] in value.map { (value: Snapshot?) -> Company? in value.flatMap { (value: Snapshot) -> Company in Company(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Company?]) -> [Snapshot?] in value.map { (value: Company?) -> Snapshot? in value.flatMap { (value: Company) -> Snapshot in value.snapshot } } }, forKey: "companies")
      }
    }

    public struct Company: GraphQLSelectionSet {
      public static let possibleTypes = ["Company"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("size", type: .scalar(Int.self)),
        GraphQLField("industry", type: .scalar(String.self)),
        GraphQLField("website", type: .scalar(String.self)),
        GraphQLField("plan", type: .scalar(String.self)),
        GraphQLField("customFieldsData", type: .scalar(JSON.self)),
        GraphQLField("tagIds", type: .list(.scalar(String.self))),
        GraphQLField("getTags", type: .list(.object(GetTag.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, name: String? = nil, size: Int? = nil, industry: String? = nil, website: String? = nil, plan: String? = nil, customFieldsData: JSON? = nil, tagIds: [String?]? = nil, getTags: [GetTag?]? = nil) {
        self.init(snapshot: ["__typename": "Company", "_id": id, "name": name, "size": size, "industry": industry, "website": website, "plan": plan, "customFieldsData": customFieldsData, "tagIds": tagIds, "getTags": getTags.flatMap { (value: [GetTag?]) -> [Snapshot?] in value.map { (value: GetTag?) -> Snapshot? in value.flatMap { (value: GetTag) -> Snapshot in value.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var size: Int? {
        get {
          return snapshot["size"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "size")
        }
      }

      public var industry: String? {
        get {
          return snapshot["industry"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "industry")
        }
      }

      public var website: String? {
        get {
          return snapshot["website"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "website")
        }
      }

      public var plan: String? {
        get {
          return snapshot["plan"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "plan")
        }
      }

      public var customFieldsData: JSON? {
        get {
          return snapshot["customFieldsData"] as? JSON
        }
        set {
          snapshot.updateValue(newValue, forKey: "customFieldsData")
        }
      }

      public var tagIds: [String?]? {
        get {
          return snapshot["tagIds"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "tagIds")
        }
      }

      public var getTags: [GetTag?]? {
        get {
          return (snapshot["getTags"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [GetTag?] in value.map { (value: Snapshot?) -> GetTag? in value.flatMap { (value: Snapshot) -> GetTag in GetTag(snapshot: value) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { (value: [GetTag?]) -> [Snapshot?] in value.map { (value: GetTag?) -> Snapshot? in value.flatMap { (value: GetTag) -> Snapshot in value.snapshot } } }, forKey: "getTags")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var companyDetail: CompanyDetail {
          get {
            return CompanyDetail(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct GetTag: GraphQLSelectionSet {
        public static let possibleTypes = ["Tag"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("colorCode", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, name: String? = nil, colorCode: String? = nil) {
          self.init(snapshot: ["__typename": "Tag", "_id": id, "name": name, "colorCode": colorCode])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["_id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "_id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var colorCode: String? {
          get {
            return snapshot["colorCode"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "colorCode")
          }
        }
      }
    }
  }
}

public final class ConversationsQuery: GraphQLQuery {
  public static let operationString =
    "query Conversations {\n  conversations {\n    __typename\n    ...ConversationDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(ConversationDetail.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("conversations", type: .list(.object(Conversation.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(conversations: [Conversation?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "conversations": conversations.flatMap { (value: [Conversation?]) -> [Snapshot?] in value.map { (value: Conversation?) -> Snapshot? in value.flatMap { (value: Conversation) -> Snapshot in value.snapshot } } }])
    }

    public var conversations: [Conversation?]? {
      get {
        return (snapshot["conversations"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Conversation?] in value.map { (value: Snapshot?) -> Conversation? in value.flatMap { (value: Snapshot) -> Conversation in Conversation(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Conversation?]) -> [Snapshot?] in value.map { (value: Conversation?) -> Snapshot? in value.flatMap { (value: Conversation) -> Snapshot in value.snapshot } } }, forKey: "conversations")
      }
    }

    public struct Conversation: GraphQLSelectionSet {
      public static let possibleTypes = ["Conversation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("content", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .scalar(Int.self)),
        GraphQLField("customerId", type: .scalar(String.self)),
        GraphQLField("customer", type: .object(Customer.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, content: String? = nil, createdAt: Int? = nil, customerId: String? = nil, customer: Customer? = nil) {
        self.init(snapshot: ["__typename": "Conversation", "_id": id, "content": content, "createdAt": createdAt, "customerId": customerId, "customer": customer.flatMap { (value: Customer) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }

      public var content: String? {
        get {
          return snapshot["content"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var createdAt: Int? {
        get {
          return snapshot["createdAt"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var customerId: String? {
        get {
          return snapshot["customerId"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "customerId")
        }
      }

      public var customer: Customer? {
        get {
          return (snapshot["customer"] as? Snapshot).flatMap { Customer(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "customer")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var conversationDetail: ConversationDetail {
          get {
            return ConversationDetail(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Customer: GraphQLSelectionSet {
        public static let possibleTypes = ["Customer"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("integrationId", type: .scalar(String.self)),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("isUser", type: .scalar(Bool.self)),
          GraphQLField("createdAt", type: .scalar(Int.self)),
          GraphQLField("remoteAddress", type: .scalar(String.self)),
          GraphQLField("internalNotes", type: .scalar(JSON.self)),
          GraphQLField("location", type: .scalar(JSON.self)),
          GraphQLField("customFieldsData", type: .scalar(JSON.self)),
          GraphQLField("messengerData", type: .scalar(JSON.self)),
          GraphQLField("twitterData", type: .scalar(JSON.self)),
          GraphQLField("facebookData", type: .scalar(JSON.self)),
          GraphQLField("getIntegrationData", type: .scalar(JSON.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(integrationId: String? = nil, firstName: String? = nil, lastName: String? = nil, email: String? = nil, phone: String? = nil, isUser: Bool? = nil, createdAt: Int? = nil, remoteAddress: String? = nil, internalNotes: JSON? = nil, location: JSON? = nil, customFieldsData: JSON? = nil, messengerData: JSON? = nil, twitterData: JSON? = nil, facebookData: JSON? = nil, getIntegrationData: JSON? = nil) {
          self.init(snapshot: ["__typename": "Customer", "integrationId": integrationId, "firstName": firstName, "lastName": lastName, "email": email, "phone": phone, "isUser": isUser, "createdAt": createdAt, "remoteAddress": remoteAddress, "internalNotes": internalNotes, "location": location, "customFieldsData": customFieldsData, "messengerData": messengerData, "twitterData": twitterData, "facebookData": facebookData, "getIntegrationData": getIntegrationData])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var integrationId: String? {
          get {
            return snapshot["integrationId"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "integrationId")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["firstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["lastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "lastName")
          }
        }

        public var email: String? {
          get {
            return snapshot["email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var isUser: Bool? {
          get {
            return snapshot["isUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isUser")
          }
        }

        public var createdAt: Int? {
          get {
            return snapshot["createdAt"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var remoteAddress: String? {
          get {
            return snapshot["remoteAddress"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "remoteAddress")
          }
        }

        public var internalNotes: JSON? {
          get {
            return snapshot["internalNotes"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "internalNotes")
          }
        }

        public var location: JSON? {
          get {
            return snapshot["location"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "location")
          }
        }

        public var customFieldsData: JSON? {
          get {
            return snapshot["customFieldsData"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "customFieldsData")
          }
        }

        public var messengerData: JSON? {
          get {
            return snapshot["messengerData"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "messengerData")
          }
        }

        public var twitterData: JSON? {
          get {
            return snapshot["twitterData"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "twitterData")
          }
        }

        public var facebookData: JSON? {
          get {
            return snapshot["facebookData"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "facebookData")
          }
        }

        public var getIntegrationData: JSON? {
          get {
            return snapshot["getIntegrationData"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "getIntegrationData")
          }
        }
      }
    }
  }
}

public final class ObjectsQuery: GraphQLQuery {
  public static let operationString =
    "query objects($limit: Int, $channelId: String, $status: String, $unassigned: String, $brandId: String, $tag: String, $integrationType: String, $participating: String, $starred: String, $ids: [String], $startDate: String, $endDate: String) {\n  conversations(limit: $limit, channelId: $channelId, status: $status, unassigned: $unassigned, brandId: $brandId, tag: $tag, integrationType: $integrationType, participating: $participating, starred: $starred, ids: $ids, startDate: $startDate, endDate: $endDate) {\n    __typename\n    ...ObjectDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(ObjectDetail.fragmentString) }

  public var limit: Int?
  public var channelId: String?
  public var status: String?
  public var unassigned: String?
  public var brandId: String?
  public var tag: String?
  public var integrationType: String?
  public var participating: String?
  public var starred: String?
  public var ids: [String?]?
  public var startDate: String?
  public var endDate: String?

  public init(limit: Int? = nil, channelId: String? = nil, status: String? = nil, unassigned: String? = nil, brandId: String? = nil, tag: String? = nil, integrationType: String? = nil, participating: String? = nil, starred: String? = nil, ids: [String?]? = nil, startDate: String? = nil, endDate: String? = nil) {
    self.limit = limit
    self.channelId = channelId
    self.status = status
    self.unassigned = unassigned
    self.brandId = brandId
    self.tag = tag
    self.integrationType = integrationType
    self.participating = participating
    self.starred = starred
    self.ids = ids
    self.startDate = startDate
    self.endDate = endDate
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "channelId": channelId, "status": status, "unassigned": unassigned, "brandId": brandId, "tag": tag, "integrationType": integrationType, "participating": participating, "starred": starred, "ids": ids, "startDate": startDate, "endDate": endDate]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("conversations", arguments: ["limit": GraphQLVariable("limit"), "channelId": GraphQLVariable("channelId"), "status": GraphQLVariable("status"), "unassigned": GraphQLVariable("unassigned"), "brandId": GraphQLVariable("brandId"), "tag": GraphQLVariable("tag"), "integrationType": GraphQLVariable("integrationType"), "participating": GraphQLVariable("participating"), "starred": GraphQLVariable("starred"), "ids": GraphQLVariable("ids"), "startDate": GraphQLVariable("startDate"), "endDate": GraphQLVariable("endDate")], type: .list(.object(Conversation.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(conversations: [Conversation?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "conversations": conversations.flatMap { (value: [Conversation?]) -> [Snapshot?] in value.map { (value: Conversation?) -> Snapshot? in value.flatMap { (value: Conversation) -> Snapshot in value.snapshot } } }])
    }

    public var conversations: [Conversation?]? {
      get {
        return (snapshot["conversations"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Conversation?] in value.map { (value: Snapshot?) -> Conversation? in value.flatMap { (value: Snapshot) -> Conversation in Conversation(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Conversation?]) -> [Snapshot?] in value.map { (value: Conversation?) -> Snapshot? in value.flatMap { (value: Conversation) -> Snapshot in value.snapshot } } }, forKey: "conversations")
      }
    }

    public struct Conversation: GraphQLSelectionSet {
      public static let possibleTypes = ["Conversation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("content", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(Int.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("assignedUser", type: .object(AssignedUser.selections)),
        GraphQLField("integration", type: .object(Integration.selections)),
        GraphQLField("customer", type: .object(Customer.selections)),
        GraphQLField("tagIds", type: .list(.scalar(String.self))),
        GraphQLField("tags", type: .list(.object(Tag.selections))),
        GraphQLField("readUserIds", type: .list(.scalar(String.self))),
        GraphQLField("twitterData", type: .object(TwitterDatum.selections)),
        GraphQLField("facebookData", type: .object(FacebookDatum.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, content: String? = nil, updatedAt: Int? = nil, status: String? = nil, assignedUser: AssignedUser? = nil, integration: Integration? = nil, customer: Customer? = nil, tagIds: [String?]? = nil, tags: [Tag?]? = nil, readUserIds: [String?]? = nil, twitterData: TwitterDatum? = nil, facebookData: FacebookDatum? = nil) {
        self.init(snapshot: ["__typename": "Conversation", "_id": id, "content": content, "updatedAt": updatedAt, "status": status, "assignedUser": assignedUser.flatMap { (value: AssignedUser) -> Snapshot in value.snapshot }, "integration": integration.flatMap { (value: Integration) -> Snapshot in value.snapshot }, "customer": customer.flatMap { (value: Customer) -> Snapshot in value.snapshot }, "tagIds": tagIds, "tags": tags.flatMap { (value: [Tag?]) -> [Snapshot?] in value.map { (value: Tag?) -> Snapshot? in value.flatMap { (value: Tag) -> Snapshot in value.snapshot } } }, "readUserIds": readUserIds, "twitterData": twitterData.flatMap { (value: TwitterDatum) -> Snapshot in value.snapshot }, "facebookData": facebookData.flatMap { (value: FacebookDatum) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }

      public var content: String? {
        get {
          return snapshot["content"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var updatedAt: Int? {
        get {
          return snapshot["updatedAt"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var assignedUser: AssignedUser? {
        get {
          return (snapshot["assignedUser"] as? Snapshot).flatMap { AssignedUser(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "assignedUser")
        }
      }

      public var integration: Integration? {
        get {
          return (snapshot["integration"] as? Snapshot).flatMap { Integration(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "integration")
        }
      }

      public var customer: Customer? {
        get {
          return (snapshot["customer"] as? Snapshot).flatMap { Customer(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "customer")
        }
      }

      public var tagIds: [String?]? {
        get {
          return snapshot["tagIds"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "tagIds")
        }
      }

      public var tags: [Tag?]? {
        get {
          return (snapshot["tags"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Tag?] in value.map { (value: Snapshot?) -> Tag? in value.flatMap { (value: Snapshot) -> Tag in Tag(snapshot: value) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { (value: [Tag?]) -> [Snapshot?] in value.map { (value: Tag?) -> Snapshot? in value.flatMap { (value: Tag) -> Snapshot in value.snapshot } } }, forKey: "tags")
        }
      }

      public var readUserIds: [String?]? {
        get {
          return snapshot["readUserIds"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "readUserIds")
        }
      }

      public var twitterData: TwitterDatum? {
        get {
          return (snapshot["twitterData"] as? Snapshot).flatMap { TwitterDatum(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "twitterData")
        }
      }

      public var facebookData: FacebookDatum? {
        get {
          return (snapshot["facebookData"] as? Snapshot).flatMap { FacebookDatum(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "facebookData")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var objectDetail: ObjectDetail {
          get {
            return ObjectDetail(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct AssignedUser: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("details", type: .object(Detail.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, details: Detail? = nil) {
          self.init(snapshot: ["__typename": "User", "_id": id, "details": details.flatMap { (value: Detail) -> Snapshot in value.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["_id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "_id")
          }
        }

        public var details: Detail? {
          get {
            return (snapshot["details"] as? Snapshot).flatMap { Detail(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "details")
          }
        }

        public struct Detail: GraphQLSelectionSet {
          public static let possibleTypes = ["UserDetailsType"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatar", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(avatar: String? = nil) {
            self.init(snapshot: ["__typename": "UserDetailsType", "avatar": avatar])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var avatar: String? {
            get {
              return snapshot["avatar"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "avatar")
            }
          }
        }
      }

      public struct Integration: GraphQLSelectionSet {
        public static let possibleTypes = ["Integration"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("kind", type: .nonNull(.scalar(String.self))),
          GraphQLField("brand", type: .object(Brand.selections)),
          GraphQLField("channels", type: .list(.object(Channel.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, kind: String, brand: Brand? = nil, channels: [Channel?]? = nil) {
          self.init(snapshot: ["__typename": "Integration", "_id": id, "kind": kind, "brand": brand.flatMap { (value: Brand) -> Snapshot in value.snapshot }, "channels": channels.flatMap { (value: [Channel?]) -> [Snapshot?] in value.map { (value: Channel?) -> Snapshot? in value.flatMap { (value: Channel) -> Snapshot in value.snapshot } } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["_id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "_id")
          }
        }

        public var kind: String {
          get {
            return snapshot["kind"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "kind")
          }
        }

        public var brand: Brand? {
          get {
            return (snapshot["brand"] as? Snapshot).flatMap { Brand(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "brand")
          }
        }

        public var channels: [Channel?]? {
          get {
            return (snapshot["channels"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Channel?] in value.map { (value: Snapshot?) -> Channel? in value.flatMap { (value: Snapshot) -> Channel in Channel(snapshot: value) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { (value: [Channel?]) -> [Snapshot?] in value.map { (value: Channel?) -> Snapshot? in value.flatMap { (value: Channel) -> Snapshot in value.snapshot } } }, forKey: "channels")
          }
        }

        public struct Brand: GraphQLSelectionSet {
          public static let possibleTypes = ["Brand"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: String, name: String? = nil) {
            self.init(snapshot: ["__typename": "Brand", "_id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return snapshot["_id"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "_id")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct Channel: GraphQLSelectionSet {
          public static let possibleTypes = ["Channel"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: String, name: String) {
            self.init(snapshot: ["__typename": "Channel", "_id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return snapshot["_id"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "_id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct Customer: GraphQLSelectionSet {
        public static let possibleTypes = ["Customer"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("isUser", type: .scalar(Bool.self)),
          GraphQLField("visitorContactInfo", type: .scalar(JSON.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, firstName: String? = nil, lastName: String? = nil, email: String? = nil, phone: String? = nil, isUser: Bool? = nil, visitorContactInfo: JSON? = nil) {
          self.init(snapshot: ["__typename": "Customer", "_id": id, "firstName": firstName, "lastName": lastName, "email": email, "phone": phone, "isUser": isUser, "visitorContactInfo": visitorContactInfo])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["_id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "_id")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["firstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["lastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "lastName")
          }
        }

        public var email: String? {
          get {
            return snapshot["email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var isUser: Bool? {
          get {
            return snapshot["isUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isUser")
          }
        }

        public var visitorContactInfo: JSON? {
          get {
            return snapshot["visitorContactInfo"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "visitorContactInfo")
          }
        }
      }

      public struct Tag: GraphQLSelectionSet {
        public static let possibleTypes = ["Tag"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, name: String? = nil) {
          self.init(snapshot: ["__typename": "Tag", "_id": id, "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["_id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "_id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct TwitterDatum: GraphQLSelectionSet {
        public static let possibleTypes = ["TwitterData"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("isDirectMessage", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(isDirectMessage: Bool? = nil) {
          self.init(snapshot: ["__typename": "TwitterData", "isDirectMessage": isDirectMessage])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var isDirectMessage: Bool? {
          get {
            return snapshot["isDirectMessage"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isDirectMessage")
          }
        }
      }

      public struct FacebookDatum: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationFacebookData"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("kind", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(kind: String? = nil) {
          self.init(snapshot: ["__typename": "ConversationFacebookData", "kind": kind])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var kind: String? {
          get {
            return snapshot["kind"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "kind")
          }
        }
      }
    }
  }
}

public final class ConversationCountsQuery: GraphQLQuery {
  public static let operationString =
    "query conversationCounts($limit: Int, $channelId: String, $status: String, $unassigned: String, $brandId: String, $tag: String, $integrationType: String, $participating: String, $starred: String, $ids: [String]) {\n  conversationCounts(limit: $limit, channelId: $channelId, status: $status, unassigned: $unassigned, brandId: $brandId, tag: $tag, integrationType: $integrationType, participating: $participating, starred: $starred, ids: $ids)\n}"

  public var limit: Int?
  public var channelId: String?
  public var status: String?
  public var unassigned: String?
  public var brandId: String?
  public var tag: String?
  public var integrationType: String?
  public var participating: String?
  public var starred: String?
  public var ids: [String?]?

  public init(limit: Int? = nil, channelId: String? = nil, status: String? = nil, unassigned: String? = nil, brandId: String? = nil, tag: String? = nil, integrationType: String? = nil, participating: String? = nil, starred: String? = nil, ids: [String?]? = nil) {
    self.limit = limit
    self.channelId = channelId
    self.status = status
    self.unassigned = unassigned
    self.brandId = brandId
    self.tag = tag
    self.integrationType = integrationType
    self.participating = participating
    self.starred = starred
    self.ids = ids
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "channelId": channelId, "status": status, "unassigned": unassigned, "brandId": brandId, "tag": tag, "integrationType": integrationType, "participating": participating, "starred": starred, "ids": ids]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("conversationCounts", arguments: ["limit": GraphQLVariable("limit"), "channelId": GraphQLVariable("channelId"), "status": GraphQLVariable("status"), "unassigned": GraphQLVariable("unassigned"), "brandId": GraphQLVariable("brandId"), "tag": GraphQLVariable("tag"), "integrationType": GraphQLVariable("integrationType"), "participating": GraphQLVariable("participating"), "starred": GraphQLVariable("starred"), "ids": GraphQLVariable("ids")], type: .scalar(JSON.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(conversationCounts: JSON? = nil) {
      self.init(snapshot: ["__typename": "Query", "conversationCounts": conversationCounts])
    }

    public var conversationCounts: JSON? {
      get {
        return snapshot["conversationCounts"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "conversationCounts")
      }
    }
  }
}

public final class UnreadCountQuery: GraphQLQuery {
  public static let operationString =
    "query unreadCount {\n  conversationsTotalUnreadCount\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("conversationsTotalUnreadCount", type: .scalar(Int.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(conversationsTotalUnreadCount: Int? = nil) {
      self.init(snapshot: ["__typename": "Query", "conversationsTotalUnreadCount": conversationsTotalUnreadCount])
    }

    public var conversationsTotalUnreadCount: Int? {
      get {
        return snapshot["conversationsTotalUnreadCount"] as? Int
      }
      set {
        snapshot.updateValue(newValue, forKey: "conversationsTotalUnreadCount")
      }
    }
  }
}

public final class GetLastQuery: GraphQLQuery {
  public static let operationString =
    "query getLast {\n  conversationsGetLast {\n    __typename\n    ...ObjectDetail\n  }\n}"

  public static var requestString: String { return operationString.appending(ObjectDetail.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("conversationsGetLast", type: .object(ConversationsGetLast.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(conversationsGetLast: ConversationsGetLast? = nil) {
      self.init(snapshot: ["__typename": "Query", "conversationsGetLast": conversationsGetLast.flatMap { (value: ConversationsGetLast) -> Snapshot in value.snapshot }])
    }

    public var conversationsGetLast: ConversationsGetLast? {
      get {
        return (snapshot["conversationsGetLast"] as? Snapshot).flatMap { ConversationsGetLast(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "conversationsGetLast")
      }
    }

    public struct ConversationsGetLast: GraphQLSelectionSet {
      public static let possibleTypes = ["Conversation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("content", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(Int.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("assignedUser", type: .object(AssignedUser.selections)),
        GraphQLField("integration", type: .object(Integration.selections)),
        GraphQLField("customer", type: .object(Customer.selections)),
        GraphQLField("tagIds", type: .list(.scalar(String.self))),
        GraphQLField("tags", type: .list(.object(Tag.selections))),
        GraphQLField("readUserIds", type: .list(.scalar(String.self))),
        GraphQLField("twitterData", type: .object(TwitterDatum.selections)),
        GraphQLField("facebookData", type: .object(FacebookDatum.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, content: String? = nil, updatedAt: Int? = nil, status: String? = nil, assignedUser: AssignedUser? = nil, integration: Integration? = nil, customer: Customer? = nil, tagIds: [String?]? = nil, tags: [Tag?]? = nil, readUserIds: [String?]? = nil, twitterData: TwitterDatum? = nil, facebookData: FacebookDatum? = nil) {
        self.init(snapshot: ["__typename": "Conversation", "_id": id, "content": content, "updatedAt": updatedAt, "status": status, "assignedUser": assignedUser.flatMap { (value: AssignedUser) -> Snapshot in value.snapshot }, "integration": integration.flatMap { (value: Integration) -> Snapshot in value.snapshot }, "customer": customer.flatMap { (value: Customer) -> Snapshot in value.snapshot }, "tagIds": tagIds, "tags": tags.flatMap { (value: [Tag?]) -> [Snapshot?] in value.map { (value: Tag?) -> Snapshot? in value.flatMap { (value: Tag) -> Snapshot in value.snapshot } } }, "readUserIds": readUserIds, "twitterData": twitterData.flatMap { (value: TwitterDatum) -> Snapshot in value.snapshot }, "facebookData": facebookData.flatMap { (value: FacebookDatum) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }

      public var content: String? {
        get {
          return snapshot["content"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var updatedAt: Int? {
        get {
          return snapshot["updatedAt"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var status: String? {
        get {
          return snapshot["status"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var assignedUser: AssignedUser? {
        get {
          return (snapshot["assignedUser"] as? Snapshot).flatMap { AssignedUser(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "assignedUser")
        }
      }

      public var integration: Integration? {
        get {
          return (snapshot["integration"] as? Snapshot).flatMap { Integration(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "integration")
        }
      }

      public var customer: Customer? {
        get {
          return (snapshot["customer"] as? Snapshot).flatMap { Customer(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "customer")
        }
      }

      public var tagIds: [String?]? {
        get {
          return snapshot["tagIds"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "tagIds")
        }
      }

      public var tags: [Tag?]? {
        get {
          return (snapshot["tags"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Tag?] in value.map { (value: Snapshot?) -> Tag? in value.flatMap { (value: Snapshot) -> Tag in Tag(snapshot: value) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { (value: [Tag?]) -> [Snapshot?] in value.map { (value: Tag?) -> Snapshot? in value.flatMap { (value: Tag) -> Snapshot in value.snapshot } } }, forKey: "tags")
        }
      }

      public var readUserIds: [String?]? {
        get {
          return snapshot["readUserIds"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "readUserIds")
        }
      }

      public var twitterData: TwitterDatum? {
        get {
          return (snapshot["twitterData"] as? Snapshot).flatMap { TwitterDatum(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "twitterData")
        }
      }

      public var facebookData: FacebookDatum? {
        get {
          return (snapshot["facebookData"] as? Snapshot).flatMap { FacebookDatum(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "facebookData")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var objectDetail: ObjectDetail {
          get {
            return ObjectDetail(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct AssignedUser: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("details", type: .object(Detail.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, details: Detail? = nil) {
          self.init(snapshot: ["__typename": "User", "_id": id, "details": details.flatMap { (value: Detail) -> Snapshot in value.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["_id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "_id")
          }
        }

        public var details: Detail? {
          get {
            return (snapshot["details"] as? Snapshot).flatMap { Detail(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "details")
          }
        }

        public struct Detail: GraphQLSelectionSet {
          public static let possibleTypes = ["UserDetailsType"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatar", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(avatar: String? = nil) {
            self.init(snapshot: ["__typename": "UserDetailsType", "avatar": avatar])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var avatar: String? {
            get {
              return snapshot["avatar"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "avatar")
            }
          }
        }
      }

      public struct Integration: GraphQLSelectionSet {
        public static let possibleTypes = ["Integration"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("kind", type: .nonNull(.scalar(String.self))),
          GraphQLField("brand", type: .object(Brand.selections)),
          GraphQLField("channels", type: .list(.object(Channel.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, kind: String, brand: Brand? = nil, channels: [Channel?]? = nil) {
          self.init(snapshot: ["__typename": "Integration", "_id": id, "kind": kind, "brand": brand.flatMap { (value: Brand) -> Snapshot in value.snapshot }, "channels": channels.flatMap { (value: [Channel?]) -> [Snapshot?] in value.map { (value: Channel?) -> Snapshot? in value.flatMap { (value: Channel) -> Snapshot in value.snapshot } } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["_id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "_id")
          }
        }

        public var kind: String {
          get {
            return snapshot["kind"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "kind")
          }
        }

        public var brand: Brand? {
          get {
            return (snapshot["brand"] as? Snapshot).flatMap { Brand(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "brand")
          }
        }

        public var channels: [Channel?]? {
          get {
            return (snapshot["channels"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Channel?] in value.map { (value: Snapshot?) -> Channel? in value.flatMap { (value: Snapshot) -> Channel in Channel(snapshot: value) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { (value: [Channel?]) -> [Snapshot?] in value.map { (value: Channel?) -> Snapshot? in value.flatMap { (value: Channel) -> Snapshot in value.snapshot } } }, forKey: "channels")
          }
        }

        public struct Brand: GraphQLSelectionSet {
          public static let possibleTypes = ["Brand"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: String, name: String? = nil) {
            self.init(snapshot: ["__typename": "Brand", "_id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return snapshot["_id"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "_id")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct Channel: GraphQLSelectionSet {
          public static let possibleTypes = ["Channel"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("_id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: String, name: String) {
            self.init(snapshot: ["__typename": "Channel", "_id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return snapshot["_id"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "_id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct Customer: GraphQLSelectionSet {
        public static let possibleTypes = ["Customer"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("isUser", type: .scalar(Bool.self)),
          GraphQLField("visitorContactInfo", type: .scalar(JSON.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, firstName: String? = nil, lastName: String? = nil, email: String? = nil, phone: String? = nil, isUser: Bool? = nil, visitorContactInfo: JSON? = nil) {
          self.init(snapshot: ["__typename": "Customer", "_id": id, "firstName": firstName, "lastName": lastName, "email": email, "phone": phone, "isUser": isUser, "visitorContactInfo": visitorContactInfo])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["_id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "_id")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["firstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["lastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "lastName")
          }
        }

        public var email: String? {
          get {
            return snapshot["email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return snapshot["phone"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone")
          }
        }

        public var isUser: Bool? {
          get {
            return snapshot["isUser"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isUser")
          }
        }

        public var visitorContactInfo: JSON? {
          get {
            return snapshot["visitorContactInfo"] as? JSON
          }
          set {
            snapshot.updateValue(newValue, forKey: "visitorContactInfo")
          }
        }
      }

      public struct Tag: GraphQLSelectionSet {
        public static let possibleTypes = ["Tag"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, name: String? = nil) {
          self.init(snapshot: ["__typename": "Tag", "_id": id, "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["_id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "_id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct TwitterDatum: GraphQLSelectionSet {
        public static let possibleTypes = ["TwitterData"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("isDirectMessage", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(isDirectMessage: Bool? = nil) {
          self.init(snapshot: ["__typename": "TwitterData", "isDirectMessage": isDirectMessage])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var isDirectMessage: Bool? {
          get {
            return snapshot["isDirectMessage"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isDirectMessage")
          }
        }
      }

      public struct FacebookDatum: GraphQLSelectionSet {
        public static let possibleTypes = ["ConversationFacebookData"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("kind", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(kind: String? = nil) {
          self.init(snapshot: ["__typename": "ConversationFacebookData", "kind": kind])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var kind: String? {
          get {
            return snapshot["kind"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "kind")
          }
        }
      }
    }
  }
}

public final class ConversationsChangeStatusMutation: GraphQLMutation {
  public static let operationString =
    "mutation conversationsChangeStatus($_ids: [String]!, $status: String!) {\n  conversationsChangeStatus(_ids: $_ids, status: $status) {\n    __typename\n    _id\n  }\n}"

  public var _ids: [String?]
  public var status: String

  public init(_ids: [String?], status: String) {
    self._ids = _ids
    self.status = status
  }

  public var variables: GraphQLMap? {
    return ["_ids": _ids, "status": status]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("conversationsChangeStatus", arguments: ["_ids": GraphQLVariable("_ids"), "status": GraphQLVariable("status")], type: .list(.object(ConversationsChangeStatus.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(conversationsChangeStatus: [ConversationsChangeStatus?]? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "conversationsChangeStatus": conversationsChangeStatus.flatMap { (value: [ConversationsChangeStatus?]) -> [Snapshot?] in value.map { (value: ConversationsChangeStatus?) -> Snapshot? in value.flatMap { (value: ConversationsChangeStatus) -> Snapshot in value.snapshot } } }])
    }

    public var conversationsChangeStatus: [ConversationsChangeStatus?]? {
      get {
        return (snapshot["conversationsChangeStatus"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [ConversationsChangeStatus?] in value.map { (value: Snapshot?) -> ConversationsChangeStatus? in value.flatMap { (value: Snapshot) -> ConversationsChangeStatus in ConversationsChangeStatus(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [ConversationsChangeStatus?]) -> [Snapshot?] in value.map { (value: ConversationsChangeStatus?) -> Snapshot? in value.flatMap { (value: ConversationsChangeStatus) -> Snapshot in value.snapshot } } }, forKey: "conversationsChangeStatus")
      }
    }

    public struct ConversationsChangeStatus: GraphQLSelectionSet {
      public static let possibleTypes = ["Conversation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String) {
        self.init(snapshot: ["__typename": "Conversation", "_id": id])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }
    }
  }
}

public final class ConversationsAssignMutation: GraphQLMutation {
  public static let operationString =
    "mutation conversationsAssign($conversationIds: [String]!, $assignedUserId: String) {\n  conversationsAssign(conversationIds: $conversationIds, assignedUserId: $assignedUserId) {\n    __typename\n    _id\n  }\n}"

  public var conversationIds: [String?]
  public var assignedUserId: String?

  public init(conversationIds: [String?], assignedUserId: String? = nil) {
    self.conversationIds = conversationIds
    self.assignedUserId = assignedUserId
  }

  public var variables: GraphQLMap? {
    return ["conversationIds": conversationIds, "assignedUserId": assignedUserId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("conversationsAssign", arguments: ["conversationIds": GraphQLVariable("conversationIds"), "assignedUserId": GraphQLVariable("assignedUserId")], type: .list(.object(ConversationsAssign.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(conversationsAssign: [ConversationsAssign?]? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "conversationsAssign": conversationsAssign.flatMap { (value: [ConversationsAssign?]) -> [Snapshot?] in value.map { (value: ConversationsAssign?) -> Snapshot? in value.flatMap { (value: ConversationsAssign) -> Snapshot in value.snapshot } } }])
    }

    public var conversationsAssign: [ConversationsAssign?]? {
      get {
        return (snapshot["conversationsAssign"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [ConversationsAssign?] in value.map { (value: Snapshot?) -> ConversationsAssign? in value.flatMap { (value: Snapshot) -> ConversationsAssign in ConversationsAssign(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [ConversationsAssign?]) -> [Snapshot?] in value.map { (value: ConversationsAssign?) -> Snapshot? in value.flatMap { (value: ConversationsAssign) -> Snapshot in value.snapshot } } }, forKey: "conversationsAssign")
      }
    }

    public struct ConversationsAssign: GraphQLSelectionSet {
      public static let possibleTypes = ["Conversation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String) {
        self.init(snapshot: ["__typename": "Conversation", "_id": id])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }
    }
  }
}

public final class GetUsersQuery: GraphQLQuery {
  public static let operationString =
    "query getUsers {\n  users {\n    __typename\n    ...UserData\n  }\n}"

  public static var requestString: String { return operationString.appending(UserData.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("users", type: .list(.object(User.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(users: [User?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "users": users.flatMap { (value: [User?]) -> [Snapshot?] in value.map { (value: User?) -> Snapshot? in value.flatMap { (value: User) -> Snapshot in value.snapshot } } }])
    }

    public var users: [User?]? {
      get {
        return (snapshot["users"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [User?] in value.map { (value: Snapshot?) -> User? in value.flatMap { (value: Snapshot) -> User in User(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [User?]) -> [Snapshot?] in value.map { (value: User?) -> Snapshot? in value.flatMap { (value: User) -> Snapshot in value.snapshot } } }, forKey: "users")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("details", type: .object(Detail.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, details: Detail? = nil) {
        self.init(snapshot: ["__typename": "User", "_id": id, "details": details.flatMap { (value: Detail) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }

      public var details: Detail? {
        get {
          return (snapshot["details"] as? Snapshot).flatMap { Detail(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "details")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var userData: UserData {
          get {
            return UserData(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Detail: GraphQLSelectionSet {
        public static let possibleTypes = ["UserDetailsType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("fullName", type: .scalar(String.self)),
          GraphQLField("avatar", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(fullName: String? = nil, avatar: String? = nil) {
          self.init(snapshot: ["__typename": "UserDetailsType", "fullName": fullName, "avatar": avatar])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fullName: String? {
          get {
            return snapshot["fullName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "fullName")
          }
        }

        public var avatar: String? {
          get {
            return snapshot["avatar"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "avatar")
          }
        }
      }
    }
  }
}

public struct BrandDetail: GraphQLFragment {
  public static let fragmentString =
    "fragment BrandDetail on Brand {\n  __typename\n  _id\n  name\n}"

  public static let possibleTypes = ["Brand"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .scalar(String.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: String, name: String? = nil) {
    self.init(snapshot: ["__typename": "Brand", "_id": id, "name": name])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return snapshot["_id"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "_id")
    }
  }

  public var name: String? {
    get {
      return snapshot["name"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }
}

public struct ChannelDetail: GraphQLFragment {
  public static let fragmentString =
    "fragment ChannelDetail on Channel {\n  __typename\n  _id\n  name\n  description\n  integrationIds\n  memberIds\n  conversationCount\n  openConversationCount\n  integrations {\n    __typename\n    code\n    formId\n    formData\n    messengerData\n    twitterData\n    facebookData\n    uiOptions\n  }\n}"

  public static let possibleTypes = ["Channel"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("description", type: .scalar(String.self)),
    GraphQLField("integrationIds", type: .list(.scalar(String.self))),
    GraphQLField("memberIds", type: .list(.scalar(String.self))),
    GraphQLField("conversationCount", type: .scalar(Int.self)),
    GraphQLField("openConversationCount", type: .scalar(Int.self)),
    GraphQLField("integrations", type: .list(.object(Integration.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: String, name: String, description: String? = nil, integrationIds: [String?]? = nil, memberIds: [String?]? = nil, conversationCount: Int? = nil, openConversationCount: Int? = nil, integrations: [Integration?]? = nil) {
    self.init(snapshot: ["__typename": "Channel", "_id": id, "name": name, "description": description, "integrationIds": integrationIds, "memberIds": memberIds, "conversationCount": conversationCount, "openConversationCount": openConversationCount, "integrations": integrations.flatMap { (value: [Integration?]) -> [Snapshot?] in value.map { (value: Integration?) -> Snapshot? in value.flatMap { (value: Integration) -> Snapshot in value.snapshot } } }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return snapshot["_id"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "_id")
    }
  }

  public var name: String {
    get {
      return snapshot["name"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  public var description: String? {
    get {
      return snapshot["description"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "description")
    }
  }

  public var integrationIds: [String?]? {
    get {
      return snapshot["integrationIds"] as? [String?]
    }
    set {
      snapshot.updateValue(newValue, forKey: "integrationIds")
    }
  }

  public var memberIds: [String?]? {
    get {
      return snapshot["memberIds"] as? [String?]
    }
    set {
      snapshot.updateValue(newValue, forKey: "memberIds")
    }
  }

  public var conversationCount: Int? {
    get {
      return snapshot["conversationCount"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "conversationCount")
    }
  }

  public var openConversationCount: Int? {
    get {
      return snapshot["openConversationCount"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "openConversationCount")
    }
  }

  public var integrations: [Integration?]? {
    get {
      return (snapshot["integrations"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Integration?] in value.map { (value: Snapshot?) -> Integration? in value.flatMap { (value: Snapshot) -> Integration in Integration(snapshot: value) } } }
    }
    set {
      snapshot.updateValue(newValue.flatMap { (value: [Integration?]) -> [Snapshot?] in value.map { (value: Integration?) -> Snapshot? in value.flatMap { (value: Integration) -> Snapshot in value.snapshot } } }, forKey: "integrations")
    }
  }

  public struct Integration: GraphQLSelectionSet {
    public static let possibleTypes = ["Integration"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("code", type: .scalar(String.self)),
      GraphQLField("formId", type: .scalar(String.self)),
      GraphQLField("formData", type: .scalar(JSON.self)),
      GraphQLField("messengerData", type: .scalar(JSON.self)),
      GraphQLField("twitterData", type: .scalar(JSON.self)),
      GraphQLField("facebookData", type: .scalar(JSON.self)),
      GraphQLField("uiOptions", type: .scalar(JSON.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(code: String? = nil, formId: String? = nil, formData: JSON? = nil, messengerData: JSON? = nil, twitterData: JSON? = nil, facebookData: JSON? = nil, uiOptions: JSON? = nil) {
      self.init(snapshot: ["__typename": "Integration", "code": code, "formId": formId, "formData": formData, "messengerData": messengerData, "twitterData": twitterData, "facebookData": facebookData, "uiOptions": uiOptions])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var code: String? {
      get {
        return snapshot["code"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "code")
      }
    }

    public var formId: String? {
      get {
        return snapshot["formId"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "formId")
      }
    }

    public var formData: JSON? {
      get {
        return snapshot["formData"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "formData")
      }
    }

    public var messengerData: JSON? {
      get {
        return snapshot["messengerData"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "messengerData")
      }
    }

    public var twitterData: JSON? {
      get {
        return snapshot["twitterData"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "twitterData")
      }
    }

    public var facebookData: JSON? {
      get {
        return snapshot["facebookData"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "facebookData")
      }
    }

    public var uiOptions: JSON? {
      get {
        return snapshot["uiOptions"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "uiOptions")
      }
    }
  }
}

public struct TagDetail: GraphQLFragment {
  public static let fragmentString =
    "fragment TagDetail on Tag {\n  __typename\n  _id\n  name\n  type\n  colorCode\n  objectCount\n}"

  public static let possibleTypes = ["Tag"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("type", type: .scalar(String.self)),
    GraphQLField("colorCode", type: .scalar(String.self)),
    GraphQLField("objectCount", type: .scalar(Int.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: String, name: String? = nil, type: String? = nil, colorCode: String? = nil, objectCount: Int? = nil) {
    self.init(snapshot: ["__typename": "Tag", "_id": id, "name": name, "type": type, "colorCode": colorCode, "objectCount": objectCount])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return snapshot["_id"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "_id")
    }
  }

  public var name: String? {
    get {
      return snapshot["name"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  public var type: String? {
    get {
      return snapshot["type"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "type")
    }
  }

  public var colorCode: String? {
    get {
      return snapshot["colorCode"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "colorCode")
    }
  }

  public var objectCount: Int? {
    get {
      return snapshot["objectCount"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "objectCount")
    }
  }
}

public struct MessageDetail: GraphQLFragment {
  public static let fragmentString =
    "fragment MessageDetail on ConversationMessage {\n  __typename\n  _id\n  content\n  attachments\n  conversationId\n  customerId\n  userId\n  createdAt\n  user {\n    __typename\n    username\n    email\n    role\n    getNotificationByEmail\n  }\n}"

  public static let possibleTypes = ["ConversationMessage"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("content", type: .scalar(String.self)),
    GraphQLField("attachments", type: .list(.scalar(JSON.self))),
    GraphQLField("conversationId", type: .scalar(String.self)),
    GraphQLField("customerId", type: .scalar(String.self)),
    GraphQLField("userId", type: .scalar(String.self)),
    GraphQLField("createdAt", type: .scalar(Int.self)),
    GraphQLField("user", type: .object(User.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: String, content: String? = nil, attachments: [JSON?]? = nil, conversationId: String? = nil, customerId: String? = nil, userId: String? = nil, createdAt: Int? = nil, user: User? = nil) {
    self.init(snapshot: ["__typename": "ConversationMessage", "_id": id, "content": content, "attachments": attachments, "conversationId": conversationId, "customerId": customerId, "userId": userId, "createdAt": createdAt, "user": user.flatMap { (value: User) -> Snapshot in value.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return snapshot["_id"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "_id")
    }
  }

  public var content: String? {
    get {
      return snapshot["content"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "content")
    }
  }

  public var attachments: [JSON?]? {
    get {
      return snapshot["attachments"] as? [JSON?]
    }
    set {
      snapshot.updateValue(newValue, forKey: "attachments")
    }
  }

  public var conversationId: String? {
    get {
      return snapshot["conversationId"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "conversationId")
    }
  }

  public var customerId: String? {
    get {
      return snapshot["customerId"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "customerId")
    }
  }

  public var userId: String? {
    get {
      return snapshot["userId"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "userId")
    }
  }

  public var createdAt: Int? {
    get {
      return snapshot["createdAt"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var user: User? {
    get {
      return (snapshot["user"] as? Snapshot).flatMap { User(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "user")
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("username", type: .scalar(String.self)),
      GraphQLField("email", type: .scalar(String.self)),
      GraphQLField("role", type: .scalar(String.self)),
      GraphQLField("getNotificationByEmail", type: .scalar(Bool.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(username: String? = nil, email: String? = nil, role: String? = nil, getNotificationByEmail: Bool? = nil) {
      self.init(snapshot: ["__typename": "User", "username": username, "email": email, "role": role, "getNotificationByEmail": getNotificationByEmail])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var username: String? {
      get {
        return snapshot["username"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "username")
      }
    }

    public var email: String? {
      get {
        return snapshot["email"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "email")
      }
    }

    public var role: String? {
      get {
        return snapshot["role"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "role")
      }
    }

    public var getNotificationByEmail: Bool? {
      get {
        return snapshot["getNotificationByEmail"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "getNotificationByEmail")
      }
    }
  }
}

public struct CustomerDetail: GraphQLFragment {
  public static let fragmentString =
    "fragment CustomerDetail on Customer {\n  __typename\n  _id\n  firstName\n  lastName\n  email\n  phone\n  isUser\n  integrationId\n  createdAt\n  remoteAddress\n  location\n  visitorContactInfo\n  customFieldsData\n  twitterData\n  facebookData\n  ownerId\n  position\n  department\n  leadStatus\n  lifecycleState\n  hasAuthority\n  description\n  doNotDisturb\n  links {\n    __typename\n    linkedIn\n    twitter\n    facebook\n    github\n    youtube\n    website\n  }\n  owner {\n    __typename\n    details {\n      __typename\n      fullName\n    }\n  }\n  tagIds\n  getTags {\n    __typename\n    _id\n    name\n    colorCode\n  }\n}"

  public static let possibleTypes = ["Customer"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("firstName", type: .scalar(String.self)),
    GraphQLField("lastName", type: .scalar(String.self)),
    GraphQLField("email", type: .scalar(String.self)),
    GraphQLField("phone", type: .scalar(String.self)),
    GraphQLField("isUser", type: .scalar(Bool.self)),
    GraphQLField("integrationId", type: .scalar(String.self)),
    GraphQLField("createdAt", type: .scalar(Int.self)),
    GraphQLField("remoteAddress", type: .scalar(String.self)),
    GraphQLField("location", type: .scalar(JSON.self)),
    GraphQLField("visitorContactInfo", type: .scalar(JSON.self)),
    GraphQLField("customFieldsData", type: .scalar(JSON.self)),
    GraphQLField("twitterData", type: .scalar(JSON.self)),
    GraphQLField("facebookData", type: .scalar(JSON.self)),
    GraphQLField("ownerId", type: .scalar(String.self)),
    GraphQLField("position", type: .scalar(String.self)),
    GraphQLField("department", type: .scalar(String.self)),
    GraphQLField("leadStatus", type: .scalar(String.self)),
    GraphQLField("lifecycleState", type: .scalar(String.self)),
    GraphQLField("hasAuthority", type: .scalar(String.self)),
    GraphQLField("description", type: .scalar(String.self)),
    GraphQLField("doNotDisturb", type: .scalar(String.self)),
    GraphQLField("links", type: .object(Link.selections)),
    GraphQLField("owner", type: .object(Owner.selections)),
    GraphQLField("tagIds", type: .list(.scalar(String.self))),
    GraphQLField("getTags", type: .list(.object(GetTag.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: String, firstName: String? = nil, lastName: String? = nil, email: String? = nil, phone: String? = nil, isUser: Bool? = nil, integrationId: String? = nil, createdAt: Int? = nil, remoteAddress: String? = nil, location: JSON? = nil, visitorContactInfo: JSON? = nil, customFieldsData: JSON? = nil, twitterData: JSON? = nil, facebookData: JSON? = nil, ownerId: String? = nil, position: String? = nil, department: String? = nil, leadStatus: String? = nil, lifecycleState: String? = nil, hasAuthority: String? = nil, description: String? = nil, doNotDisturb: String? = nil, links: Link? = nil, owner: Owner? = nil, tagIds: [String?]? = nil, getTags: [GetTag?]? = nil) {
    self.init(snapshot: ["__typename": "Customer", "_id": id, "firstName": firstName, "lastName": lastName, "email": email, "phone": phone, "isUser": isUser, "integrationId": integrationId, "createdAt": createdAt, "remoteAddress": remoteAddress, "location": location, "visitorContactInfo": visitorContactInfo, "customFieldsData": customFieldsData, "twitterData": twitterData, "facebookData": facebookData, "ownerId": ownerId, "position": position, "department": department, "leadStatus": leadStatus, "lifecycleState": lifecycleState, "hasAuthority": hasAuthority, "description": description, "doNotDisturb": doNotDisturb, "links": links.flatMap { (value: Link) -> Snapshot in value.snapshot }, "owner": owner.flatMap { (value: Owner) -> Snapshot in value.snapshot }, "tagIds": tagIds, "getTags": getTags.flatMap { (value: [GetTag?]) -> [Snapshot?] in value.map { (value: GetTag?) -> Snapshot? in value.flatMap { (value: GetTag) -> Snapshot in value.snapshot } } }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return snapshot["_id"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "_id")
    }
  }

  public var firstName: String? {
    get {
      return snapshot["firstName"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String? {
    get {
      return snapshot["lastName"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "lastName")
    }
  }

  public var email: String? {
    get {
      return snapshot["email"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "email")
    }
  }

  public var phone: String? {
    get {
      return snapshot["phone"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "phone")
    }
  }

  public var isUser: Bool? {
    get {
      return snapshot["isUser"] as? Bool
    }
    set {
      snapshot.updateValue(newValue, forKey: "isUser")
    }
  }

  public var integrationId: String? {
    get {
      return snapshot["integrationId"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "integrationId")
    }
  }

  public var createdAt: Int? {
    get {
      return snapshot["createdAt"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var remoteAddress: String? {
    get {
      return snapshot["remoteAddress"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "remoteAddress")
    }
  }

  public var location: JSON? {
    get {
      return snapshot["location"] as? JSON
    }
    set {
      snapshot.updateValue(newValue, forKey: "location")
    }
  }

  public var visitorContactInfo: JSON? {
    get {
      return snapshot["visitorContactInfo"] as? JSON
    }
    set {
      snapshot.updateValue(newValue, forKey: "visitorContactInfo")
    }
  }

  public var customFieldsData: JSON? {
    get {
      return snapshot["customFieldsData"] as? JSON
    }
    set {
      snapshot.updateValue(newValue, forKey: "customFieldsData")
    }
  }

  public var twitterData: JSON? {
    get {
      return snapshot["twitterData"] as? JSON
    }
    set {
      snapshot.updateValue(newValue, forKey: "twitterData")
    }
  }

  public var facebookData: JSON? {
    get {
      return snapshot["facebookData"] as? JSON
    }
    set {
      snapshot.updateValue(newValue, forKey: "facebookData")
    }
  }

  public var ownerId: String? {
    get {
      return snapshot["ownerId"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "ownerId")
    }
  }

  public var position: String? {
    get {
      return snapshot["position"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "position")
    }
  }

  public var department: String? {
    get {
      return snapshot["department"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "department")
    }
  }

  public var leadStatus: String? {
    get {
      return snapshot["leadStatus"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "leadStatus")
    }
  }

  public var lifecycleState: String? {
    get {
      return snapshot["lifecycleState"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "lifecycleState")
    }
  }

  public var hasAuthority: String? {
    get {
      return snapshot["hasAuthority"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "hasAuthority")
    }
  }

  public var description: String? {
    get {
      return snapshot["description"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "description")
    }
  }

  public var doNotDisturb: String? {
    get {
      return snapshot["doNotDisturb"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "doNotDisturb")
    }
  }

  public var links: Link? {
    get {
      return (snapshot["links"] as? Snapshot).flatMap { Link(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "links")
    }
  }

  public var owner: Owner? {
    get {
      return (snapshot["owner"] as? Snapshot).flatMap { Owner(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "owner")
    }
  }

  public var tagIds: [String?]? {
    get {
      return snapshot["tagIds"] as? [String?]
    }
    set {
      snapshot.updateValue(newValue, forKey: "tagIds")
    }
  }

  public var getTags: [GetTag?]? {
    get {
      return (snapshot["getTags"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [GetTag?] in value.map { (value: Snapshot?) -> GetTag? in value.flatMap { (value: Snapshot) -> GetTag in GetTag(snapshot: value) } } }
    }
    set {
      snapshot.updateValue(newValue.flatMap { (value: [GetTag?]) -> [Snapshot?] in value.map { (value: GetTag?) -> Snapshot? in value.flatMap { (value: GetTag) -> Snapshot in value.snapshot } } }, forKey: "getTags")
    }
  }

  public struct Link: GraphQLSelectionSet {
    public static let possibleTypes = ["CustomerLinks"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("linkedIn", type: .scalar(String.self)),
      GraphQLField("twitter", type: .scalar(String.self)),
      GraphQLField("facebook", type: .scalar(String.self)),
      GraphQLField("github", type: .scalar(String.self)),
      GraphQLField("youtube", type: .scalar(String.self)),
      GraphQLField("website", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(linkedIn: String? = nil, twitter: String? = nil, facebook: String? = nil, github: String? = nil, youtube: String? = nil, website: String? = nil) {
      self.init(snapshot: ["__typename": "CustomerLinks", "linkedIn": linkedIn, "twitter": twitter, "facebook": facebook, "github": github, "youtube": youtube, "website": website])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var linkedIn: String? {
      get {
        return snapshot["linkedIn"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "linkedIn")
      }
    }

    public var twitter: String? {
      get {
        return snapshot["twitter"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "twitter")
      }
    }

    public var facebook: String? {
      get {
        return snapshot["facebook"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "facebook")
      }
    }

    public var github: String? {
      get {
        return snapshot["github"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "github")
      }
    }

    public var youtube: String? {
      get {
        return snapshot["youtube"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "youtube")
      }
    }

    public var website: String? {
      get {
        return snapshot["website"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "website")
      }
    }
  }

  public struct Owner: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("details", type: .object(Detail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(details: Detail? = nil) {
      self.init(snapshot: ["__typename": "User", "details": details.flatMap { (value: Detail) -> Snapshot in value.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var details: Detail? {
      get {
        return (snapshot["details"] as? Snapshot).flatMap { Detail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "details")
      }
    }

    public struct Detail: GraphQLSelectionSet {
      public static let possibleTypes = ["UserDetailsType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("fullName", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(fullName: String? = nil) {
        self.init(snapshot: ["__typename": "UserDetailsType", "fullName": fullName])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fullName: String? {
        get {
          return snapshot["fullName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "fullName")
        }
      }
    }
  }

  public struct GetTag: GraphQLSelectionSet {
    public static let possibleTypes = ["Tag"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("colorCode", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: String, name: String? = nil, colorCode: String? = nil) {
      self.init(snapshot: ["__typename": "Tag", "_id": id, "name": name, "colorCode": colorCode])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: String {
      get {
        return snapshot["_id"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "_id")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var colorCode: String? {
      get {
        return snapshot["colorCode"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "colorCode")
      }
    }
  }
}

public struct CompanyDetail: GraphQLFragment {
  public static let fragmentString =
    "fragment CompanyDetail on Company {\n  __typename\n  _id\n  name\n  size\n  industry\n  website\n  plan\n  customFieldsData\n  tagIds\n  getTags {\n    __typename\n    _id\n    name\n    colorCode\n  }\n}"

  public static let possibleTypes = ["Company"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("size", type: .scalar(Int.self)),
    GraphQLField("industry", type: .scalar(String.self)),
    GraphQLField("website", type: .scalar(String.self)),
    GraphQLField("plan", type: .scalar(String.self)),
    GraphQLField("customFieldsData", type: .scalar(JSON.self)),
    GraphQLField("tagIds", type: .list(.scalar(String.self))),
    GraphQLField("getTags", type: .list(.object(GetTag.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: String, name: String? = nil, size: Int? = nil, industry: String? = nil, website: String? = nil, plan: String? = nil, customFieldsData: JSON? = nil, tagIds: [String?]? = nil, getTags: [GetTag?]? = nil) {
    self.init(snapshot: ["__typename": "Company", "_id": id, "name": name, "size": size, "industry": industry, "website": website, "plan": plan, "customFieldsData": customFieldsData, "tagIds": tagIds, "getTags": getTags.flatMap { (value: [GetTag?]) -> [Snapshot?] in value.map { (value: GetTag?) -> Snapshot? in value.flatMap { (value: GetTag) -> Snapshot in value.snapshot } } }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return snapshot["_id"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "_id")
    }
  }

  public var name: String? {
    get {
      return snapshot["name"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  public var size: Int? {
    get {
      return snapshot["size"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "size")
    }
  }

  public var industry: String? {
    get {
      return snapshot["industry"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "industry")
    }
  }

  public var website: String? {
    get {
      return snapshot["website"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "website")
    }
  }

  public var plan: String? {
    get {
      return snapshot["plan"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "plan")
    }
  }

  public var customFieldsData: JSON? {
    get {
      return snapshot["customFieldsData"] as? JSON
    }
    set {
      snapshot.updateValue(newValue, forKey: "customFieldsData")
    }
  }

  public var tagIds: [String?]? {
    get {
      return snapshot["tagIds"] as? [String?]
    }
    set {
      snapshot.updateValue(newValue, forKey: "tagIds")
    }
  }

  public var getTags: [GetTag?]? {
    get {
      return (snapshot["getTags"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [GetTag?] in value.map { (value: Snapshot?) -> GetTag? in value.flatMap { (value: Snapshot) -> GetTag in GetTag(snapshot: value) } } }
    }
    set {
      snapshot.updateValue(newValue.flatMap { (value: [GetTag?]) -> [Snapshot?] in value.map { (value: GetTag?) -> Snapshot? in value.flatMap { (value: GetTag) -> Snapshot in value.snapshot } } }, forKey: "getTags")
    }
  }

  public struct GetTag: GraphQLSelectionSet {
    public static let possibleTypes = ["Tag"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("colorCode", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: String, name: String? = nil, colorCode: String? = nil) {
      self.init(snapshot: ["__typename": "Tag", "_id": id, "name": name, "colorCode": colorCode])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: String {
      get {
        return snapshot["_id"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "_id")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var colorCode: String? {
      get {
        return snapshot["colorCode"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "colorCode")
      }
    }
  }
}

public struct ConversationDetail: GraphQLFragment {
  public static let fragmentString =
    "fragment ConversationDetail on Conversation {\n  __typename\n  _id\n  content\n  createdAt\n  customerId\n  customer {\n    __typename\n    integrationId\n    firstName\n    lastName\n    email\n    phone\n    isUser\n    createdAt\n    remoteAddress\n    internalNotes\n    location\n    customFieldsData\n    messengerData\n    twitterData\n    facebookData\n    getIntegrationData\n  }\n}"

  public static let possibleTypes = ["Conversation"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("content", type: .scalar(String.self)),
    GraphQLField("createdAt", type: .scalar(Int.self)),
    GraphQLField("customerId", type: .scalar(String.self)),
    GraphQLField("customer", type: .object(Customer.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: String, content: String? = nil, createdAt: Int? = nil, customerId: String? = nil, customer: Customer? = nil) {
    self.init(snapshot: ["__typename": "Conversation", "_id": id, "content": content, "createdAt": createdAt, "customerId": customerId, "customer": customer.flatMap { (value: Customer) -> Snapshot in value.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return snapshot["_id"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "_id")
    }
  }

  public var content: String? {
    get {
      return snapshot["content"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "content")
    }
  }

  public var createdAt: Int? {
    get {
      return snapshot["createdAt"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var customerId: String? {
    get {
      return snapshot["customerId"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "customerId")
    }
  }

  public var customer: Customer? {
    get {
      return (snapshot["customer"] as? Snapshot).flatMap { Customer(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "customer")
    }
  }

  public struct Customer: GraphQLSelectionSet {
    public static let possibleTypes = ["Customer"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("integrationId", type: .scalar(String.self)),
      GraphQLField("firstName", type: .scalar(String.self)),
      GraphQLField("lastName", type: .scalar(String.self)),
      GraphQLField("email", type: .scalar(String.self)),
      GraphQLField("phone", type: .scalar(String.self)),
      GraphQLField("isUser", type: .scalar(Bool.self)),
      GraphQLField("createdAt", type: .scalar(Int.self)),
      GraphQLField("remoteAddress", type: .scalar(String.self)),
      GraphQLField("internalNotes", type: .scalar(JSON.self)),
      GraphQLField("location", type: .scalar(JSON.self)),
      GraphQLField("customFieldsData", type: .scalar(JSON.self)),
      GraphQLField("messengerData", type: .scalar(JSON.self)),
      GraphQLField("twitterData", type: .scalar(JSON.self)),
      GraphQLField("facebookData", type: .scalar(JSON.self)),
      GraphQLField("getIntegrationData", type: .scalar(JSON.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(integrationId: String? = nil, firstName: String? = nil, lastName: String? = nil, email: String? = nil, phone: String? = nil, isUser: Bool? = nil, createdAt: Int? = nil, remoteAddress: String? = nil, internalNotes: JSON? = nil, location: JSON? = nil, customFieldsData: JSON? = nil, messengerData: JSON? = nil, twitterData: JSON? = nil, facebookData: JSON? = nil, getIntegrationData: JSON? = nil) {
      self.init(snapshot: ["__typename": "Customer", "integrationId": integrationId, "firstName": firstName, "lastName": lastName, "email": email, "phone": phone, "isUser": isUser, "createdAt": createdAt, "remoteAddress": remoteAddress, "internalNotes": internalNotes, "location": location, "customFieldsData": customFieldsData, "messengerData": messengerData, "twitterData": twitterData, "facebookData": facebookData, "getIntegrationData": getIntegrationData])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var integrationId: String? {
      get {
        return snapshot["integrationId"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "integrationId")
      }
    }

    public var firstName: String? {
      get {
        return snapshot["firstName"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "firstName")
      }
    }

    public var lastName: String? {
      get {
        return snapshot["lastName"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "lastName")
      }
    }

    public var email: String? {
      get {
        return snapshot["email"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "email")
      }
    }

    public var phone: String? {
      get {
        return snapshot["phone"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "phone")
      }
    }

    public var isUser: Bool? {
      get {
        return snapshot["isUser"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "isUser")
      }
    }

    public var createdAt: Int? {
      get {
        return snapshot["createdAt"] as? Int
      }
      set {
        snapshot.updateValue(newValue, forKey: "createdAt")
      }
    }

    public var remoteAddress: String? {
      get {
        return snapshot["remoteAddress"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "remoteAddress")
      }
    }

    public var internalNotes: JSON? {
      get {
        return snapshot["internalNotes"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "internalNotes")
      }
    }

    public var location: JSON? {
      get {
        return snapshot["location"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "location")
      }
    }

    public var customFieldsData: JSON? {
      get {
        return snapshot["customFieldsData"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "customFieldsData")
      }
    }

    public var messengerData: JSON? {
      get {
        return snapshot["messengerData"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "messengerData")
      }
    }

    public var twitterData: JSON? {
      get {
        return snapshot["twitterData"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "twitterData")
      }
    }

    public var facebookData: JSON? {
      get {
        return snapshot["facebookData"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "facebookData")
      }
    }

    public var getIntegrationData: JSON? {
      get {
        return snapshot["getIntegrationData"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "getIntegrationData")
      }
    }
  }
}

public struct ObjectDetail: GraphQLFragment {
  public static let fragmentString =
    "fragment ObjectDetail on Conversation {\n  __typename\n  _id\n  content\n  updatedAt\n  status\n  assignedUser {\n    __typename\n    _id\n    details {\n      __typename\n      avatar\n    }\n  }\n  integration {\n    __typename\n    _id\n    kind\n    brand {\n      __typename\n      _id\n      name\n    }\n    channels {\n      __typename\n      _id\n      name\n    }\n  }\n  customer {\n    __typename\n    _id\n    firstName\n    lastName\n    email\n    phone\n    isUser\n    visitorContactInfo\n  }\n  tagIds\n  tags {\n    __typename\n    _id\n    name\n  }\n  readUserIds\n  twitterData {\n    __typename\n    isDirectMessage\n  }\n  facebookData {\n    __typename\n    kind\n  }\n}"

  public static let possibleTypes = ["Conversation"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("content", type: .scalar(String.self)),
    GraphQLField("updatedAt", type: .scalar(Int.self)),
    GraphQLField("status", type: .scalar(String.self)),
    GraphQLField("assignedUser", type: .object(AssignedUser.selections)),
    GraphQLField("integration", type: .object(Integration.selections)),
    GraphQLField("customer", type: .object(Customer.selections)),
    GraphQLField("tagIds", type: .list(.scalar(String.self))),
    GraphQLField("tags", type: .list(.object(Tag.selections))),
    GraphQLField("readUserIds", type: .list(.scalar(String.self))),
    GraphQLField("twitterData", type: .object(TwitterDatum.selections)),
    GraphQLField("facebookData", type: .object(FacebookDatum.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: String, content: String? = nil, updatedAt: Int? = nil, status: String? = nil, assignedUser: AssignedUser? = nil, integration: Integration? = nil, customer: Customer? = nil, tagIds: [String?]? = nil, tags: [Tag?]? = nil, readUserIds: [String?]? = nil, twitterData: TwitterDatum? = nil, facebookData: FacebookDatum? = nil) {
    self.init(snapshot: ["__typename": "Conversation", "_id": id, "content": content, "updatedAt": updatedAt, "status": status, "assignedUser": assignedUser.flatMap { (value: AssignedUser) -> Snapshot in value.snapshot }, "integration": integration.flatMap { (value: Integration) -> Snapshot in value.snapshot }, "customer": customer.flatMap { (value: Customer) -> Snapshot in value.snapshot }, "tagIds": tagIds, "tags": tags.flatMap { (value: [Tag?]) -> [Snapshot?] in value.map { (value: Tag?) -> Snapshot? in value.flatMap { (value: Tag) -> Snapshot in value.snapshot } } }, "readUserIds": readUserIds, "twitterData": twitterData.flatMap { (value: TwitterDatum) -> Snapshot in value.snapshot }, "facebookData": facebookData.flatMap { (value: FacebookDatum) -> Snapshot in value.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return snapshot["_id"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "_id")
    }
  }

  public var content: String? {
    get {
      return snapshot["content"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "content")
    }
  }

  public var updatedAt: Int? {
    get {
      return snapshot["updatedAt"] as? Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "updatedAt")
    }
  }

  public var status: String? {
    get {
      return snapshot["status"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "status")
    }
  }

  public var assignedUser: AssignedUser? {
    get {
      return (snapshot["assignedUser"] as? Snapshot).flatMap { AssignedUser(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "assignedUser")
    }
  }

  public var integration: Integration? {
    get {
      return (snapshot["integration"] as? Snapshot).flatMap { Integration(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "integration")
    }
  }

  public var customer: Customer? {
    get {
      return (snapshot["customer"] as? Snapshot).flatMap { Customer(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "customer")
    }
  }

  public var tagIds: [String?]? {
    get {
      return snapshot["tagIds"] as? [String?]
    }
    set {
      snapshot.updateValue(newValue, forKey: "tagIds")
    }
  }

  public var tags: [Tag?]? {
    get {
      return (snapshot["tags"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Tag?] in value.map { (value: Snapshot?) -> Tag? in value.flatMap { (value: Snapshot) -> Tag in Tag(snapshot: value) } } }
    }
    set {
      snapshot.updateValue(newValue.flatMap { (value: [Tag?]) -> [Snapshot?] in value.map { (value: Tag?) -> Snapshot? in value.flatMap { (value: Tag) -> Snapshot in value.snapshot } } }, forKey: "tags")
    }
  }

  public var readUserIds: [String?]? {
    get {
      return snapshot["readUserIds"] as? [String?]
    }
    set {
      snapshot.updateValue(newValue, forKey: "readUserIds")
    }
  }

  public var twitterData: TwitterDatum? {
    get {
      return (snapshot["twitterData"] as? Snapshot).flatMap { TwitterDatum(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "twitterData")
    }
  }

  public var facebookData: FacebookDatum? {
    get {
      return (snapshot["facebookData"] as? Snapshot).flatMap { FacebookDatum(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "facebookData")
    }
  }

  public struct AssignedUser: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("details", type: .object(Detail.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: String, details: Detail? = nil) {
      self.init(snapshot: ["__typename": "User", "_id": id, "details": details.flatMap { (value: Detail) -> Snapshot in value.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: String {
      get {
        return snapshot["_id"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "_id")
      }
    }

    public var details: Detail? {
      get {
        return (snapshot["details"] as? Snapshot).flatMap { Detail(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "details")
      }
    }

    public struct Detail: GraphQLSelectionSet {
      public static let possibleTypes = ["UserDetailsType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("avatar", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(avatar: String? = nil) {
        self.init(snapshot: ["__typename": "UserDetailsType", "avatar": avatar])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var avatar: String? {
        get {
          return snapshot["avatar"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "avatar")
        }
      }
    }
  }

  public struct Integration: GraphQLSelectionSet {
    public static let possibleTypes = ["Integration"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("kind", type: .nonNull(.scalar(String.self))),
      GraphQLField("brand", type: .object(Brand.selections)),
      GraphQLField("channels", type: .list(.object(Channel.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: String, kind: String, brand: Brand? = nil, channels: [Channel?]? = nil) {
      self.init(snapshot: ["__typename": "Integration", "_id": id, "kind": kind, "brand": brand.flatMap { (value: Brand) -> Snapshot in value.snapshot }, "channels": channels.flatMap { (value: [Channel?]) -> [Snapshot?] in value.map { (value: Channel?) -> Snapshot? in value.flatMap { (value: Channel) -> Snapshot in value.snapshot } } }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: String {
      get {
        return snapshot["_id"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "_id")
      }
    }

    public var kind: String {
      get {
        return snapshot["kind"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "kind")
      }
    }

    public var brand: Brand? {
      get {
        return (snapshot["brand"] as? Snapshot).flatMap { Brand(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "brand")
      }
    }

    public var channels: [Channel?]? {
      get {
        return (snapshot["channels"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Channel?] in value.map { (value: Snapshot?) -> Channel? in value.flatMap { (value: Snapshot) -> Channel in Channel(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Channel?]) -> [Snapshot?] in value.map { (value: Channel?) -> Snapshot? in value.flatMap { (value: Channel) -> Snapshot in value.snapshot } } }, forKey: "channels")
      }
    }

    public struct Brand: GraphQLSelectionSet {
      public static let possibleTypes = ["Brand"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, name: String? = nil) {
        self.init(snapshot: ["__typename": "Brand", "_id": id, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }

    public struct Channel: GraphQLSelectionSet {
      public static let possibleTypes = ["Channel"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, name: String) {
        self.init(snapshot: ["__typename": "Channel", "_id": id, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["_id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "_id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }

  public struct Customer: GraphQLSelectionSet {
    public static let possibleTypes = ["Customer"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("firstName", type: .scalar(String.self)),
      GraphQLField("lastName", type: .scalar(String.self)),
      GraphQLField("email", type: .scalar(String.self)),
      GraphQLField("phone", type: .scalar(String.self)),
      GraphQLField("isUser", type: .scalar(Bool.self)),
      GraphQLField("visitorContactInfo", type: .scalar(JSON.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: String, firstName: String? = nil, lastName: String? = nil, email: String? = nil, phone: String? = nil, isUser: Bool? = nil, visitorContactInfo: JSON? = nil) {
      self.init(snapshot: ["__typename": "Customer", "_id": id, "firstName": firstName, "lastName": lastName, "email": email, "phone": phone, "isUser": isUser, "visitorContactInfo": visitorContactInfo])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: String {
      get {
        return snapshot["_id"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "_id")
      }
    }

    public var firstName: String? {
      get {
        return snapshot["firstName"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "firstName")
      }
    }

    public var lastName: String? {
      get {
        return snapshot["lastName"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "lastName")
      }
    }

    public var email: String? {
      get {
        return snapshot["email"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "email")
      }
    }

    public var phone: String? {
      get {
        return snapshot["phone"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "phone")
      }
    }

    public var isUser: Bool? {
      get {
        return snapshot["isUser"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "isUser")
      }
    }

    public var visitorContactInfo: JSON? {
      get {
        return snapshot["visitorContactInfo"] as? JSON
      }
      set {
        snapshot.updateValue(newValue, forKey: "visitorContactInfo")
      }
    }
  }

  public struct Tag: GraphQLSelectionSet {
    public static let possibleTypes = ["Tag"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: String, name: String? = nil) {
      self.init(snapshot: ["__typename": "Tag", "_id": id, "name": name])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: String {
      get {
        return snapshot["_id"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "_id")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }
  }

  public struct TwitterDatum: GraphQLSelectionSet {
    public static let possibleTypes = ["TwitterData"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("isDirectMessage", type: .scalar(Bool.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(isDirectMessage: Bool? = nil) {
      self.init(snapshot: ["__typename": "TwitterData", "isDirectMessage": isDirectMessage])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var isDirectMessage: Bool? {
      get {
        return snapshot["isDirectMessage"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "isDirectMessage")
      }
    }
  }

  public struct FacebookDatum: GraphQLSelectionSet {
    public static let possibleTypes = ["ConversationFacebookData"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("kind", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(kind: String? = nil) {
      self.init(snapshot: ["__typename": "ConversationFacebookData", "kind": kind])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var kind: String? {
      get {
        return snapshot["kind"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "kind")
      }
    }
  }
}

public struct UserData: GraphQLFragment {
  public static let fragmentString =
    "fragment UserData on User {\n  __typename\n  _id\n  details {\n    __typename\n    fullName\n    avatar\n  }\n}"

  public static let possibleTypes = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("details", type: .object(Detail.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: String, details: Detail? = nil) {
    self.init(snapshot: ["__typename": "User", "_id": id, "details": details.flatMap { (value: Detail) -> Snapshot in value.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return snapshot["_id"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "_id")
    }
  }

  public var details: Detail? {
    get {
      return (snapshot["details"] as? Snapshot).flatMap { Detail(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "details")
    }
  }

  public struct Detail: GraphQLSelectionSet {
    public static let possibleTypes = ["UserDetailsType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("fullName", type: .scalar(String.self)),
      GraphQLField("avatar", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(fullName: String? = nil, avatar: String? = nil) {
      self.init(snapshot: ["__typename": "UserDetailsType", "fullName": fullName, "avatar": avatar])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fullName: String? {
      get {
        return snapshot["fullName"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "fullName")
      }
    }

    public var avatar: String? {
      get {
        return snapshot["avatar"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "avatar")
      }
    }
  }
}