class ProfileLoginResultModel {
  String? username;
  String? userId;
  String? sub;
  String? organizeId;
  String? stayLogin;
  String? customToken;
  String? image;
  String? displayName;
  String? expiresIn;
  String? accessToken;
  int? status;
  Chat? profile;

  ProfileLoginResultModel(
      {this.username,
      this.userId,
      this.sub,
      this.organizeId,
      this.stayLogin,
      this.customToken,
      this.image,
      this.displayName,
      this.expiresIn,
      this.accessToken,
      this.status,
      this.profile});

  ProfileLoginResultModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userId = json['userId'];
    sub = json['sub'];
    organizeId = json['organizeId'];
    stayLogin = json['stayLogin'];
    customToken = json['customToken'];
    image = json['image'];
    displayName = json['displayName'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    status = json['status'];
    profile = json['profile'] != null ? Chat.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['userId'] = userId;
    data['sub'] = sub;
    data['organizeId'] = organizeId;
    data['stayLogin'] = stayLogin;
    data['customToken'] = customToken;
    data['image'] = image;
    data['displayName'] = displayName;
    data['expires_in'] = expiresIn;
    data['access_token'] = accessToken;
    data['status'] = status;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? profileName;
  String? firstName;
  String? lastName;
  ModifiedBy? modifiedBy;
  int? maxUsers;
  LastModified? lastModified;
  bool? isSuperAdmin;
  Permission? permission;
  String? lastUpdateName;
  String? parent;
  LastModified? createDate;
  DashboardPermission? dashboardPermission;
  String? type;
  String? name;
  CustomPermission? customPermission;
  String? docId;
  String? status;
  LastModified? createdDate;
  ModifiedBy? createdBy;
  String? id;

  Profile(
      {this.profileName,
      this.firstName,
      this.lastName,
      this.modifiedBy,
      this.maxUsers,
      this.lastModified,
      this.isSuperAdmin,
      this.permission,
      this.lastUpdateName,
      this.parent,
      this.createDate,
      this.dashboardPermission,
      this.type,
      this.name,
      this.customPermission,
      this.docId,
      this.status,
      this.createdDate,
      this.createdBy,
      this.id});

  Profile.fromJson(Map<String, dynamic> json) {
    profileName = json['profileName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    modifiedBy = json['modifiedBy'] != null
        ? ModifiedBy.fromJson(json['modifiedBy'])
        : null;
    maxUsers = json['maxUsers'];
    lastModified = json['lastModified'] != null
        ? LastModified.fromJson(json['lastModified'])
        : null;
    isSuperAdmin = json['isSuperAdmin'];
    permission = json['permission'] != null
        ? Permission.fromJson(json['permission'])
        : null;
    lastUpdateName = json['lastUpdateName'];
    parent = json['parent'];
    createDate = json['createDate'] != null
        ? LastModified.fromJson(json['createDate'])
        : null;
    dashboardPermission = json['dashboardPermission'] != null
        ? DashboardPermission.fromJson(json['dashboardPermission'])
        : null;
    type = json['type'];
    name = json['name'];
    customPermission = json['customPermission'] != null
        ? CustomPermission.fromJson(json['customPermission'])
        : null;
    docId = json['docId'];
    status = json['status'];
    createdDate = json['createdDate'] != null
        ? LastModified.fromJson(json['createdDate'])
        : null;
    createdBy = json['createdBy'] != null
        ? ModifiedBy.fromJson(json['createdBy'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profileName'] = profileName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    if (modifiedBy != null) {
      data['modifiedBy'] = modifiedBy!.toJson();
    }
    data['maxUsers'] = maxUsers;
    if (lastModified != null) {
      data['lastModified'] = lastModified!.toJson();
    }
    data['isSuperAdmin'] = isSuperAdmin;
    if (permission != null) {
      data['permission'] = permission!.toJson();
    }
    data['lastUpdateName'] = lastUpdateName;
    data['parent'] = parent;
    if (createDate != null) {
      data['createDate'] = createDate!.toJson();
    }
    if (dashboardPermission != null) {
      data['dashboardPermission'] = dashboardPermission!.toJson();
    }
    data['type'] = type;
    data['name'] = name;
    if (customPermission != null) {
      data['customPermission'] = customPermission!.toJson();
    }
    data['docId'] = docId;
    data['status'] = status;
    if (createdDate != null) {
      data['createdDate'] = createdDate!.toJson();
    }
    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class ModifiedBy {
  String? label;
  String? value;

  ModifiedBy({this.label, this.value});

  ModifiedBy.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    return data;
  }
}

class LastModified {
  int? iSeconds;
  int? iNanoseconds;

  LastModified({this.iSeconds, this.iNanoseconds});

  LastModified.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
    iNanoseconds = json['_nanoseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_seconds'] = iSeconds;
    data['_nanoseconds'] = iNanoseconds;
    return data;
  }
}

class Permission {
  Chat? chat;
  Chat? tag;
  Chat? taskList;
  Chat? ticketManagement;
  Chat? note;
  Chat? consents;
  Chat? chatbotAi;
  Chat? accountSetting;
  Chat? users;
  Chat? task;
  Chat? advancedSettings;
  Chat? supportedAgent;
  Chat? ticket;
  Chat? postAndComment;
  Chat? filter;
  Chat? knowledge;
  Chat? generalSetting;
  Chat? saQueue;
  Chat? changeStatusAfterClosed;
  Chat? survey;
  Chat? ticketSetting;
  Chat? chatbotTemplate;
  Chat? organizePoint;
  Chat? advertisement;
  Chat? setting;
  Chat? schedulePost;
  Chat? sdkTracking;
  Chat? engagement;
  Chat? emailTemplate;
  Chat? dashboard;
  Chat? audience;
  Chat? publicAnnouncement;
  Chat? objectManager;
  Chat? profile;
  Chat? queue;
  Chat? automation;
  Chat? internalChat;
  Chat? ticketAll;
  Chat? ticketMyQueue;
  Chat? job;

  Permission(
      {this.chat,
      this.tag,
      this.taskList,
      this.ticketManagement,
      this.note,
      this.consents,
      this.chatbotAi,
      this.accountSetting,
      this.users,
      this.task,
      this.advancedSettings,
      this.supportedAgent,
      this.ticket,
      this.postAndComment,
      this.filter,
      this.knowledge,
      this.generalSetting,
      this.saQueue,
      this.changeStatusAfterClosed,
      this.survey,
      this.ticketSetting,
      this.chatbotTemplate,
      this.organizePoint,
      this.advertisement,
      this.setting,
      this.schedulePost,
      this.sdkTracking,
      this.engagement,
      this.emailTemplate,
      this.dashboard,
      this.audience,
      this.publicAnnouncement,
      this.objectManager,
      this.profile,
      this.queue,
      this.automation,
      this.internalChat,
      this.ticketAll,
      this.ticketMyQueue,
      this.job});

  Permission.fromJson(Map<String, dynamic> json) {
    chat = json['chat'] != null ? Chat.fromJson(json['chat']) : null;
    tag = json['tag'] != null ? Chat.fromJson(json['tag']) : null;
    taskList =
        json['taskList'] != null ? Chat.fromJson(json['taskList']) : null;
    ticketManagement = json['ticketManagement'] != null
        ? Chat.fromJson(json['ticketManagement'])
        : null;
    note = json['note'] != null ? Chat.fromJson(json['note']) : null;
    consents =
        json['consents'] != null ? Chat.fromJson(json['consents']) : null;
    chatbotAi =
        json['chatbotAi'] != null ? Chat.fromJson(json['chatbotAi']) : null;
    accountSetting = json['accountSetting'] != null
        ? Chat.fromJson(json['accountSetting'])
        : null;
    users = json['users'] != null ? Chat.fromJson(json['users']) : null;
    task = json['task'] != null ? Chat.fromJson(json['task']) : null;
    advancedSettings = json['advancedSettings'] != null
        ? Chat.fromJson(json['advancedSettings'])
        : null;
    supportedAgent = json['supportedAgent'] != null
        ? Chat.fromJson(json['supportedAgent'])
        : null;
    ticket = json['ticket'] != null ? Chat.fromJson(json['ticket']) : null;
    postAndComment = json['postAndComment'] != null
        ? Chat.fromJson(json['postAndComment'])
        : null;
    filter = json['filter'] != null ? Chat.fromJson(json['filter']) : null;
    knowledge =
        json['knowledge'] != null ? Chat.fromJson(json['knowledge']) : null;
    generalSetting = json['generalSetting'] != null
        ? Chat.fromJson(json['generalSetting'])
        : null;
    saQueue = json['saQueue'] != null ? Chat.fromJson(json['saQueue']) : null;
    changeStatusAfterClosed = json['changeStatusAfterClosed'] != null
        ? Chat.fromJson(json['changeStatusAfterClosed'])
        : null;
    survey = json['survey'] != null ? Chat.fromJson(json['survey']) : null;
    ticketSetting = json['ticketSetting'] != null
        ? Chat.fromJson(json['ticketSetting'])
        : null;
    chatbotTemplate = json['chatbotTemplate'] != null
        ? Chat.fromJson(json['chatbotTemplate'])
        : null;
    organizePoint = json['organizePoint'] != null
        ? Chat.fromJson(json['organizePoint'])
        : null;
    advertisement = json['advertisement'] != null
        ? Chat.fromJson(json['advertisement'])
        : null;
    setting = json['setting'] != null ? Chat.fromJson(json['setting']) : null;
    schedulePost = json['schedulePost'] != null
        ? Chat.fromJson(json['schedulePost'])
        : null;
    sdkTracking =
        json['sdkTracking'] != null ? Chat.fromJson(json['sdkTracking']) : null;
    engagement =
        json['engagement'] != null ? Chat.fromJson(json['engagement']) : null;
    emailTemplate = json['emailTemplate'] != null
        ? Chat.fromJson(json['emailTemplate'])
        : null;
    dashboard =
        json['dashboard'] != null ? Chat.fromJson(json['dashboard']) : null;
    audience =
        json['audience'] != null ? Chat.fromJson(json['audience']) : null;
    publicAnnouncement = json['publicAnnouncement'] != null
        ? Chat.fromJson(json['publicAnnouncement'])
        : null;
    objectManager = json['objectManager'] != null
        ? Chat.fromJson(json['objectManager'])
        : null;
    profile = json['profile'] != null ? Chat.fromJson(json['profile']) : null;
    queue = json['queue'] != null ? Chat.fromJson(json['queue']) : null;
    automation =
        json['automation'] != null ? Chat.fromJson(json['automation']) : null;
    internalChat = json['internalChat'] != null
        ? Chat.fromJson(json['internalChat'])
        : null;
    ticketAll =
        json['ticketAll'] != null ? Chat.fromJson(json['ticketAll']) : null;
    ticketMyQueue = json['ticketMyQueue'] != null
        ? Chat.fromJson(json['ticketMyQueue'])
        : null;
    job = json['job'] != null ? Chat.fromJson(json['job']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chat != null) {
      data['chat'] = chat!.toJson();
    }
    if (tag != null) {
      data['tag'] = tag!.toJson();
    }
    if (taskList != null) {
      data['taskList'] = taskList!.toJson();
    }
    if (ticketManagement != null) {
      data['ticketManagement'] = ticketManagement!.toJson();
    }
    if (note != null) {
      data['note'] = note!.toJson();
    }
    if (consents != null) {
      data['consents'] = consents!.toJson();
    }
    if (chatbotAi != null) {
      data['chatbotAi'] = chatbotAi!.toJson();
    }
    if (accountSetting != null) {
      data['accountSetting'] = accountSetting!.toJson();
    }
    if (users != null) {
      data['users'] = users!.toJson();
    }
    if (task != null) {
      data['task'] = task!.toJson();
    }
    if (advancedSettings != null) {
      data['advancedSettings'] = advancedSettings!.toJson();
    }
    if (supportedAgent != null) {
      data['supportedAgent'] = supportedAgent!.toJson();
    }
    if (ticket != null) {
      data['ticket'] = ticket!.toJson();
    }
    if (postAndComment != null) {
      data['postAndComment'] = postAndComment!.toJson();
    }
    if (filter != null) {
      data['filter'] = filter!.toJson();
    }
    if (knowledge != null) {
      data['knowledge'] = knowledge!.toJson();
    }
    if (generalSetting != null) {
      data['generalSetting'] = generalSetting!.toJson();
    }
    if (saQueue != null) {
      data['saQueue'] = saQueue!.toJson();
    }
    if (changeStatusAfterClosed != null) {
      data['changeStatusAfterClosed'] = changeStatusAfterClosed!.toJson();
    }
    if (survey != null) {
      data['survey'] = survey!.toJson();
    }
    if (ticketSetting != null) {
      data['ticketSetting'] = ticketSetting!.toJson();
    }
    if (chatbotTemplate != null) {
      data['chatbotTemplate'] = chatbotTemplate!.toJson();
    }
    if (organizePoint != null) {
      data['organizePoint'] = organizePoint!.toJson();
    }
    if (advertisement != null) {
      data['advertisement'] = advertisement!.toJson();
    }
    if (setting != null) {
      data['setting'] = setting!.toJson();
    }
    if (schedulePost != null) {
      data['schedulePost'] = schedulePost!.toJson();
    }
    if (sdkTracking != null) {
      data['sdkTracking'] = sdkTracking!.toJson();
    }
    if (engagement != null) {
      data['engagement'] = engagement!.toJson();
    }
    if (emailTemplate != null) {
      data['emailTemplate'] = emailTemplate!.toJson();
    }
    if (dashboard != null) {
      data['dashboard'] = dashboard!.toJson();
    }
    if (audience != null) {
      data['audience'] = audience!.toJson();
    }
    if (publicAnnouncement != null) {
      data['publicAnnouncement'] = publicAnnouncement!.toJson();
    }
    if (objectManager != null) {
      data['objectManager'] = objectManager!.toJson();
    }
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    if (queue != null) {
      data['queue'] = queue!.toJson();
    }
    if (automation != null) {
      data['automation'] = automation!.toJson();
    }
    if (internalChat != null) {
      data['internalChat'] = internalChat!.toJson();
    }
    if (ticketAll != null) {
      data['ticketAll'] = ticketAll!.toJson();
    }
    if (ticketMyQueue != null) {
      data['ticketMyQueue'] = ticketMyQueue!.toJson();
    }
    if (job != null) {
      data['job'] = job!.toJson();
    }
    return data;
  }
}

class Chat {
  bool? isUpdate;
  bool? isDelete;
  bool? isCreate;
  bool? isExport;
  bool? isImport;
  bool? isRead;

  Chat(
      {this.isUpdate,
      this.isDelete,
      this.isCreate,
      this.isExport,
      this.isImport,
      this.isRead});

  Chat.fromJson(Map<String, dynamic> json) {
    isUpdate = json['isUpdate'];
    isDelete = json['isDelete'];
    isCreate = json['isCreate'];
    isExport = json['isExport'];
    isImport = json['isImport'];
    isRead = json['isRead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isUpdate'] = isUpdate;
    data['isDelete'] = isDelete;
    data['isCreate'] = isCreate;
    data['isExport'] = isExport;
    data['isImport'] = isImport;
    data['isRead'] = isRead;
    return data;
  }
}

class DashboardPermission {
  CampaignOverview? campaignOverview;

  DashboardPermission({this.campaignOverview});

  DashboardPermission.fromJson(Map<String, dynamic> json) {
    campaignOverview = json['campaignOverview'] != null
        ? CampaignOverview.fromJson(json['campaignOverview'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (campaignOverview != null) {
      data['campaignOverview'] = campaignOverview!.toJson();
    }
    return data;
  }
}

class CampaignOverview {
  bool? isRead;

  CampaignOverview({this.isRead});

  CampaignOverview.fromJson(Map<String, dynamic> json) {
    isRead = json['isRead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isRead'] = isRead;
    return data;
  }
}

class CustomPermission {
  Chat? threads;
  Chat? customers;
  Chat? deletionLogs;
  Chat? notes;
  Chat? campaign;
  Chat? activities;
  Chat? specialDeal;
  Chat? order;
  Chat? product;
  Chat? task;
  Chat? advertisement;
  Chat? unknownContact;
  Chat? ticket;
  Chat? facebookPost;
  Chat? pageView;
  Chat? agency;
  Chat? address;
  Chat? knowledge;
  Chat? tag;
  Chat? lineSubscriber;
  Chat? behavior;
  Chat? testCoupon;
  Chat? supergun;
  Chat? pantipInbox;
  Chat? orderItem;
  Chat? exportHistory;
  Chat? company;
  Chat? customerSurvey;
  Chat? lead;
  Chat? advertisementView;
  Chat? pantipPost;

  CustomPermission(
      {this.threads,
      this.customers,
      this.deletionLogs,
      this.notes,
      this.campaign,
      this.activities,
      this.specialDeal,
      this.order,
      this.product,
      this.task,
      this.advertisement,
      this.unknownContact,
      this.ticket,
      this.facebookPost,
      this.pageView,
      this.agency,
      this.address,
      this.knowledge,
      this.tag,
      this.lineSubscriber,
      this.behavior,
      this.testCoupon,
      this.supergun,
      this.pantipInbox,
      this.orderItem,
      this.exportHistory,
      this.company,
      this.customerSurvey,
      this.lead,
      this.advertisementView,
      this.pantipPost});

  CustomPermission.fromJson(Map<String, dynamic> json) {
    threads = json['threads'] != null ? Chat.fromJson(json['threads']) : null;
    customers =
        json['customers'] != null ? Chat.fromJson(json['customers']) : null;
    deletionLogs = json['deletionLogs'] != null
        ? Chat.fromJson(json['deletionLogs'])
        : null;
    notes = json['notes'] != null ? Chat.fromJson(json['notes']) : null;
    campaign =
        json['campaign'] != null ? Chat.fromJson(json['campaign']) : null;
    activities =
        json['activities'] != null ? Chat.fromJson(json['activities']) : null;
    specialDeal =
        json['specialDeal'] != null ? Chat.fromJson(json['specialDeal']) : null;
    order = json['order'] != null ? Chat.fromJson(json['order']) : null;
    product = json['product'] != null ? Chat.fromJson(json['product']) : null;
    task = json['task'] != null ? Chat.fromJson(json['task']) : null;
    advertisement = json['advertisement'] != null
        ? Chat.fromJson(json['advertisement'])
        : null;
    unknownContact = json['unknownContact'] != null
        ? Chat.fromJson(json['unknownContact'])
        : null;
    ticket = json['ticket'] != null ? Chat.fromJson(json['ticket']) : null;
    facebookPost = json['facebookPost'] != null
        ? Chat.fromJson(json['facebookPost'])
        : null;
    pageView =
        json['pageView'] != null ? Chat.fromJson(json['pageView']) : null;
    agency = json['agency'] != null ? Chat.fromJson(json['agency']) : null;
    address = json['address'] != null ? Chat.fromJson(json['address']) : null;
    knowledge =
        json['knowledge'] != null ? Chat.fromJson(json['knowledge']) : null;
    tag = json['tag'] != null ? Chat.fromJson(json['tag']) : null;
    lineSubscriber = json['lineSubscriber'] != null
        ? Chat.fromJson(json['lineSubscriber'])
        : null;
    behavior =
        json['behavior'] != null ? Chat.fromJson(json['behavior']) : null;
    testCoupon =
        json['testCoupon'] != null ? Chat.fromJson(json['testCoupon']) : null;
    supergun =
        json['supergun'] != null ? Chat.fromJson(json['supergun']) : null;
    pantipInbox =
        json['pantipInbox'] != null ? Chat.fromJson(json['pantipInbox']) : null;
    orderItem =
        json['orderItem'] != null ? Chat.fromJson(json['orderItem']) : null;
    exportHistory = json['exportHistory'] != null
        ? Chat.fromJson(json['exportHistory'])
        : null;
    company = json['company'] != null ? Chat.fromJson(json['company']) : null;
    customerSurvey = json['customerSurvey'] != null
        ? Chat.fromJson(json['customerSurvey'])
        : null;
    lead = json['lead'] != null ? Chat.fromJson(json['lead']) : null;
    advertisementView = json['advertisementView'] != null
        ? Chat.fromJson(json['advertisementView'])
        : null;
    pantipPost =
        json['pantipPost'] != null ? Chat.fromJson(json['pantipPost']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (threads != null) {
      data['threads'] = threads!.toJson();
    }
    if (customers != null) {
      data['customers'] = customers!.toJson();
    }
    if (deletionLogs != null) {
      data['deletionLogs'] = deletionLogs!.toJson();
    }
    if (notes != null) {
      data['notes'] = notes!.toJson();
    }
    if (campaign != null) {
      data['campaign'] = campaign!.toJson();
    }
    if (activities != null) {
      data['activities'] = activities!.toJson();
    }
    if (specialDeal != null) {
      data['specialDeal'] = specialDeal!.toJson();
    }
    if (order != null) {
      data['order'] = order!.toJson();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (task != null) {
      data['task'] = task!.toJson();
    }
    if (advertisement != null) {
      data['advertisement'] = advertisement!.toJson();
    }
    if (unknownContact != null) {
      data['unknownContact'] = unknownContact!.toJson();
    }
    if (ticket != null) {
      data['ticket'] = ticket!.toJson();
    }
    if (facebookPost != null) {
      data['facebookPost'] = facebookPost!.toJson();
    }
    if (pageView != null) {
      data['pageView'] = pageView!.toJson();
    }
    if (agency != null) {
      data['agency'] = agency!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (knowledge != null) {
      data['knowledge'] = knowledge!.toJson();
    }
    if (tag != null) {
      data['tag'] = tag!.toJson();
    }
    if (lineSubscriber != null) {
      data['lineSubscriber'] = lineSubscriber!.toJson();
    }
    if (behavior != null) {
      data['behavior'] = behavior!.toJson();
    }
    if (testCoupon != null) {
      data['testCoupon'] = testCoupon!.toJson();
    }
    if (supergun != null) {
      data['supergun'] = supergun!.toJson();
    }
    if (pantipInbox != null) {
      data['pantipInbox'] = pantipInbox!.toJson();
    }
    if (orderItem != null) {
      data['orderItem'] = orderItem!.toJson();
    }
    if (exportHistory != null) {
      data['exportHistory'] = exportHistory!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (customerSurvey != null) {
      data['customerSurvey'] = customerSurvey!.toJson();
    }
    if (lead != null) {
      data['lead'] = lead!.toJson();
    }
    if (advertisementView != null) {
      data['advertisementView'] = advertisementView!.toJson();
    }
    if (pantipPost != null) {
      data['pantipPost'] = pantipPost!.toJson();
    }
    return data;
  }
}
