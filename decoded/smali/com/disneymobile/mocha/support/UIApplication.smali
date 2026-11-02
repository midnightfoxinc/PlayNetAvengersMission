.class public Lcom/disneymobile/mocha/support/UIApplication;
.super Lcom/disneymobile/mocha/NSObject;
.source "UIApplication.java"


# static fields
.field public static final DidEnterBackgroundNotification:Ljava/lang/String; = "UIApplicationDidEnterBackgroundNotification"

.field public static final DidFinishLaunchingNotification:Ljava/lang/String; = "UIApplicationDidFinishLaunchingNotification"

.field public static final LaunchOptionsRemoteNotificationKey:Ljava/lang/String; = "UIApplicationLaunchOptionsRemoteNotificationKey"

.field public static final PREFS_DEVICETOKEN:Ljava/lang/String; = "prefs_device_token"

.field private static final PREFS_NOTIFICATIONS:Ljava/lang/String; = "prefs_notifications_enabled"

.field public static final WillEnterForegroundNotification:Ljava/lang/String; = "UIApplicationWillEnterForegroundNotification"

.field public static final WillTerminateNotification:Ljava/lang/String; = "UIApplicationWillTerminateNotification"

.field private static sharedApplication:Lcom/disneymobile/mocha/support/UIApplication;


# instance fields
.field private activity:Landroid/app/Activity;

.field private delegate:Lcom/disneymobile/mocha/support/UIApplicationDelegate;

.field private haveToldDelegate:Z

.field private idleTimerDisabled:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 156
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disneymobile/mocha/support/UIApplication;->haveToldDelegate:Z

    .line 47
    sput-object p0, Lcom/disneymobile/mocha/support/UIApplication;->sharedApplication:Lcom/disneymobile/mocha/support/UIApplication;

    .line 48
    return-void
.end method

.method public static sharedApplication()Lcom/disneymobile/mocha/support/UIApplication;
    .locals 2

    .prologue
    .line 33
    sget-object v0, Lcom/disneymobile/mocha/support/UIApplication;->sharedApplication:Lcom/disneymobile/mocha/support/UIApplication;

    if-nez v0, :cond_0

    .line 34
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Application has not yet been created"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_0
    sget-object v0, Lcom/disneymobile/mocha/support/UIApplication;->sharedApplication:Lcom/disneymobile/mocha/support/UIApplication;

    return-object v0
.end method

.method public static unsafeSharedApplication()Lcom/disneymobile/mocha/support/UIApplication;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/disneymobile/mocha/support/UIApplication;->sharedApplication:Lcom/disneymobile/mocha/support/UIApplication;

    return-object v0
.end method


# virtual methods
.method public applicationIconBadgeNumber()I
    .locals 1

    .prologue
    .line 109
    const/4 v0, 0x0

    return v0
.end method

.method public delegate()Lcom/disneymobile/mocha/support/UIApplicationDelegate;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/disneymobile/mocha/support/UIApplication;->delegate:Lcom/disneymobile/mocha/support/UIApplicationDelegate;

    return-object v0
.end method

.method public enabledRemoteNotificationTypes()I
    .locals 2

    .prologue
    .line 150
    invoke-static {}, Lcom/disneymobile/mocha/NSUserDefaults;->standardUserDefaults()Lcom/disneymobile/mocha/NSUserDefaults;

    move-result-object v0

    const-string v1, "prefs_notifications_enabled"

    invoke-virtual {v0, v1}, Lcom/disneymobile/mocha/NSUserDefaults;->boolForKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    const/4 v0, 0x7

    .line 153
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/disneymobile/mocha/support/UIApplication;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method public idleTimerDisabled()Z
    .locals 1

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/disneymobile/mocha/support/UIApplication;->idleTimerDisabled:Z

    return v0
.end method

.method public init()Lcom/disneymobile/mocha/support/UIApplication;
    .locals 0

    .prologue
    .line 71
    return-object p0
.end method

.method public onNotificationSettingChange()V
    .locals 4

    .prologue
    .line 159
    iget-boolean v2, p0, Lcom/disneymobile/mocha/support/UIApplication;->haveToldDelegate:Z

    if-eqz v2, :cond_1

    .line 173
    :cond_0
    :goto_0
    return-void

    .line 162
    :cond_1
    invoke-static {}, Lcom/disneymobile/mocha/NSUserDefaults;->standardUserDefaults()Lcom/disneymobile/mocha/NSUserDefaults;

    move-result-object v0

    .line 163
    .local v0, "defaults":Lcom/disneymobile/mocha/NSUserDefaults;
    const-string v2, "prefs_device_token"

    invoke-virtual {v0, v2}, Lcom/disneymobile/mocha/NSUserDefaults;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "prefs_notifications_enabled"

    invoke-virtual {v0, v2}, Lcom/disneymobile/mocha/NSUserDefaults;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 166
    const-string v2, "prefs_device_token"

    invoke-virtual {v0, v2}, Lcom/disneymobile/mocha/NSUserDefaults;->stringForKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 167
    .local v1, "deviceToken":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disneymobile/mocha/support/UIApplication;->enabledRemoteNotificationTypes()I

    move-result v2

    if-eqz v2, :cond_2

    if-eqz v1, :cond_2

    .line 168
    iget-object v2, p0, Lcom/disneymobile/mocha/support/UIApplication;->delegate:Lcom/disneymobile/mocha/support/UIApplicationDelegate;

    invoke-interface {v2, p0, v1}, Lcom/disneymobile/mocha/support/UIApplicationDelegate;->applicationDidRegisterForRemoteNotificationsWithDeviceToken(Lcom/disneymobile/mocha/support/UIApplication;Ljava/lang/String;)V

    .line 172
    :goto_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/disneymobile/mocha/support/UIApplication;->haveToldDelegate:Z

    goto :goto_0

    .line 170
    :cond_2
    iget-object v2, p0, Lcom/disneymobile/mocha/support/UIApplication;->delegate:Lcom/disneymobile/mocha/support/UIApplicationDelegate;

    const/4 v3, 0x0

    invoke-interface {v2, p0, v3}, Lcom/disneymobile/mocha/support/UIApplicationDelegate;->applicationDidFailToRegisterForRemoteNotificationsWithError(Lcom/disneymobile/mocha/support/UIApplication;Lcom/disneymobile/mocha/NSError;)V

    goto :goto_1
.end method

.method public openURL(Lcom/disneymobile/mocha/NSURL;)V
    .locals 6
    .param p1, "url"    # Lcom/disneymobile/mocha/NSURL;

    .prologue
    .line 91
    iget-object v3, p0, Lcom/disneymobile/mocha/support/UIApplication;->delegate:Lcom/disneymobile/mocha/support/UIApplicationDelegate;

    invoke-interface {v3, p0, p1}, Lcom/disneymobile/mocha/support/UIApplicationDelegate;->applicationHandleOpenURL(Lcom/disneymobile/mocha/support/UIApplication;Lcom/disneymobile/mocha/NSURL;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 93
    :try_start_0
    invoke-virtual {p1}, Lcom/disneymobile/mocha/NSURL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 94
    .local v2, "uri":Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v1, v3, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 95
    .local v1, "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/disneymobile/mocha/support/UIApplication;->activity:Landroid/app/Activity;

    invoke-virtual {v3, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "uri":Landroid/net/Uri;
    :cond_0
    :goto_0
    return-void

    .line 96
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/disneymobile/mocha/support/UIApplication;->activity:Landroid/app/Activity;

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v4, "App name goes here"

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not open "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/disneymobile/mocha/NSURL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x104000a

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method public registerForRemoteNotificationTypes(I)V
    .locals 5
    .param p1, "notificationTypes"    # I

    .prologue
    .line 116
    invoke-static {}, Lcom/disneymobile/mocha/NSUserDefaults;->standardUserDefaults()Lcom/disneymobile/mocha/NSUserDefaults;

    move-result-object v2

    const-string v3, "prefs_notifications_enabled"

    invoke-virtual {v2, v3}, Lcom/disneymobile/mocha/NSUserDefaults;->booleanForKey(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 117
    .local v0, "areNotificationsEnabled":Ljava/lang/Boolean;
    if-nez v0, :cond_0

    .line 120
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/disneymobile/mocha/support/UIApplication;->activity:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "App name goes here"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "May we send you push notifications? These can be configured in Settings."

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x1040013

    new-instance v4, Lcom/disneymobile/mocha/support/UIApplication$2;

    invoke-direct {v4, p0}, Lcom/disneymobile/mocha/support/UIApplication$2;-><init>(Lcom/disneymobile/mocha/support/UIApplication;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x1040009

    new-instance v4, Lcom/disneymobile/mocha/support/UIApplication$1;

    invoke-direct {v4, p0}, Lcom/disneymobile/mocha/support/UIApplication$1;-><init>(Lcom/disneymobile/mocha/support/UIApplication;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 137
    .local v1, "dialog":Landroid/app/Dialog;
    new-instance v2, Lcom/disneymobile/mocha/support/UIApplication$3;

    invoke-direct {v2, p0}, Lcom/disneymobile/mocha/support/UIApplication$3;-><init>(Lcom/disneymobile/mocha/support/UIApplication;)V

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 143
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 147
    .end local v1    # "dialog":Landroid/app/Dialog;
    :goto_0
    return-void

    .line 146
    :cond_0
    invoke-virtual {p0}, Lcom/disneymobile/mocha/support/UIApplication;->onNotificationSettingChange()V

    goto :goto_0
.end method

.method public setActivity(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/disneymobile/mocha/support/UIApplication;->activity:Landroid/app/Activity;

    .line 55
    return-void
.end method

.method public setApplicationIconBadgeNumber(I)V
    .locals 0
    .param p1, "i"    # I

    .prologue
    .line 113
    return-void
.end method

.method public setDelegate(Lcom/disneymobile/mocha/support/UIApplicationDelegate;)V
    .locals 0
    .param p1, "delegate"    # Lcom/disneymobile/mocha/support/UIApplicationDelegate;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/disneymobile/mocha/support/UIApplication;->delegate:Lcom/disneymobile/mocha/support/UIApplicationDelegate;

    .line 68
    return-void
.end method

.method public setIdleTimerDisabled(Z)V
    .locals 1
    .param p1, "idleTimerDisabled"    # Z

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/disneymobile/mocha/support/UIApplication;->idleTimerDisabled:Z

    if-ne v0, p1, :cond_0

    .line 84
    :goto_0
    return-void

    .line 82
    :cond_0
    iput-boolean p1, p0, Lcom/disneymobile/mocha/support/UIApplication;->idleTimerDisabled:Z

    goto :goto_0
.end method

.method public setNetworkActivityIndicatorVisible(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 176
    return-void
.end method

.method public setStatusBarHidden(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 88
    return-void
.end method
