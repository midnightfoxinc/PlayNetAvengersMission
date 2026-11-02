.class public Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;
.super Ljava/lang/Object;
.source "EMTPortalLibrary.java"

# interfaces
.implements Lcom/disney/emagine/sdk/portal/EMTEvent;


# static fields
.field public static final AMBIANT:I = 0x8a3

.field public static final ANALYTICS:I = 0x0

.field public static final FIRMWARE:I = 0x1

.field public static final MISSION:I = 0x0

.field public static final REGISTRATION:I = 0x1

.field public static final REPULSER_BLASTER:I = 0x835

.field private static final TAG:Ljava/lang/String;

.field private static instance:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;


# instance fields
.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private mController:Lcom/disney/emagine/sdk/ble/EMTController;

.field private mMainController:Lcom/disney/emagine/sdk/EMTMainController;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 62
    invoke-direct {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->init()V

    .line 63
    return-void
.end method

.method private init()V
    .locals 6

    .prologue
    .line 67
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v3, "EMTPortalLibrary"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "EMTController : "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    if-nez v1, :cond_0

    const-string v1, "null"

    .line 68
    :goto_0
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 67
    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    :try_start_0
    new-instance v1, Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-direct {v1}, Lcom/disney/emagine/sdk/ble/EMTController;-><init>()V

    iput-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    .line 72
    new-instance v1, Lcom/disney/emagine/sdk/EMTMainController;

    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-direct {v1, v2}, Lcom/disney/emagine/sdk/EMTMainController;-><init>(Lcom/disney/emagine/sdk/ble/EMTController;)V

    iput-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mMainController:Lcom/disney/emagine/sdk/EMTMainController;

    .line 73
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    return-void

    .line 67
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "opened: "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    .line 68
    invoke-virtual {v5}, Lcom/disney/emagine/sdk/ble/EMTController;->isConnected()Z

    move-result v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 74
    :catch_0
    move-exception v0

    .line 76
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v1

    const/16 v2, 0xc

    const-string v3, "IOException"

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 77
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
    .locals 1

    .prologue
    .line 111
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    return-object v0
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;
    .locals 1

    .prologue
    .line 82
    sget-object v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->instance:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    if-nez v0, :cond_0

    .line 83
    new-instance v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->instance:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    .line 86
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->instance:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    return-object v0
.end method


# virtual methods
.method public AbilityPreview(I[I)V
    .locals 3
    .param p1, "deviceId"    # I
    .param p2, "ability"    # [I

    .prologue
    .line 290
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->TAG:Ljava/lang/String;

    const-string v2, "AbilityPreview(int deviceId, int[] ability) is not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    return-void
.end method

.method public ClearAnalyticsData()V
    .locals 1

    .prologue
    .line 333
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->clearAnalyticsData()V

    .line 334
    return-void
.end method

.method public ClearContent(ILjava/lang/String;I)V
    .locals 1
    .param p1, "deviceId"    # I
    .param p2, "contentId"    # Ljava/lang/String;
    .param p3, "version"    # I

    .prologue
    .line 185
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p2, p1, p3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deletePackageForDevice(Ljava/lang/String;II)V

    .line 186
    return-void
.end method

.method public Connect(I)Z
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 156
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 157
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->connect(I)Z

    move-result v0

    .line 159
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public Disconnect()V
    .locals 2

    .prologue
    .line 164
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->disconnect(I)V

    .line 165
    return-void
.end method

.method public DownloadContent(IILjava/lang/String;)V
    .locals 1
    .param p1, "deviceId"    # I
    .param p2, "contentType"    # I
    .param p3, "contentId"    # Ljava/lang/String;

    .prologue
    .line 190
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p3, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->downloadContent(Ljava/lang/String;I)V

    .line 191
    return-void
.end method

.method public EnterKeyMask(ILjava/lang/String;)V
    .locals 1
    .param p1, "deviceId"    # I
    .param p2, "keyedInputAsAscii"    # Ljava/lang/String;

    .prologue
    .line 305
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p2, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->enterKeyMask(Ljava/lang/String;I)V

    .line 306
    return-void
.end method

.method public FileTransferRequest(ILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "deviceId"    # I
    .param p2, "sourcePath"    # Ljava/lang/String;
    .param p3, "destPath"    # Ljava/lang/String;

    .prologue
    .line 237
    const/4 v3, 0x0

    .line 238
    .local v3, "source":Ljava/lang/String;
    const/4 v0, 0x0

    .line 242
    .local v0, "dest":Ljava/lang/String;
    :try_start_0
    new-instance v4, Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v4, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 243
    .end local v3    # "source":Ljava/lang/String;
    .local v4, "source":Ljava/lang/String;
    :try_start_1
    new-instance v1, Ljava/lang/String;

    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v1, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 245
    .end local v0    # "dest":Ljava/lang/String;
    .local v1, "dest":Ljava/lang/String;
    :try_start_2
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v5

    invoke-virtual {v5, p1, v4, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packageFileTransferRequest(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_2

    move-object v0, v1

    .end local v1    # "dest":Ljava/lang/String;
    .restart local v0    # "dest":Ljava/lang/String;
    move-object v3, v4

    .line 251
    .end local v4    # "source":Ljava/lang/String;
    .restart local v3    # "source":Ljava/lang/String;
    :goto_0
    return-void

    .line 247
    :catch_0
    move-exception v2

    .line 249
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    :goto_1
    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0

    .line 247
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v3    # "source":Ljava/lang/String;
    .restart local v4    # "source":Ljava/lang/String;
    :catch_1
    move-exception v2

    move-object v3, v4

    .end local v4    # "source":Ljava/lang/String;
    .restart local v3    # "source":Ljava/lang/String;
    goto :goto_1

    .end local v0    # "dest":Ljava/lang/String;
    .end local v3    # "source":Ljava/lang/String;
    .restart local v1    # "dest":Ljava/lang/String;
    .restart local v4    # "source":Ljava/lang/String;
    :catch_2
    move-exception v2

    move-object v0, v1

    .end local v1    # "dest":Ljava/lang/String;
    .restart local v0    # "dest":Ljava/lang/String;
    move-object v3, v4

    .end local v4    # "source":Ljava/lang/String;
    .restart local v3    # "source":Ljava/lang/String;
    goto :goto_1
.end method

.method public GetAvailableDevices()V
    .locals 1

    .prologue
    .line 151
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->getAvailableDevices()V

    .line 152
    return-void
.end method

.method public GetAvailableSpace(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 255
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packageGetAvailableSpace(I)V

    .line 256
    return-void
.end method

.method public GetCachedPackages(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 405
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sharedInstance()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->getCachedPackages(I)V

    .line 406
    return-void
.end method

.method public GetContentEntitlements(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 395
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->getContentEntitlements(I)V

    .line 396
    return-void
.end method

.method public GetContentList(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 220
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->getContentList(I)V

    .line 221
    return-void
.end method

.method public GetContentOnToy(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 390
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->getContentOnToy(I)V

    .line 391
    return-void
.end method

.method public GetDeviceContentList(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 225
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->getDeviceContentList(I)V

    .line 226
    return-void
.end method

.method public GetLibraryFeature(I)Z
    .locals 1
    .param p1, "feature"    # I

    .prologue
    .line 318
    packed-switch p1, :pswitch_data_0

    .line 327
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 321
    :pswitch_0
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    iget-boolean v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->analytics:Z

    goto :goto_0

    .line 324
    :pswitch_1
    const/4 v0, 0x1

    goto :goto_0

    .line 318
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public GetOwnerKey()V
    .locals 1

    .prologue
    .line 370
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->getOwnerKey()V

    .line 371
    return-void
.end method

.method public IdentifyToy(I)V
    .locals 3
    .param p1, "deviceId"    # I

    .prologue
    .line 275
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->TAG:Ljava/lang/String;

    const-string v2, "IdentifyToy(int deviceId) is not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    return-void
.end method

.method public InitializeDMO()V
    .locals 1

    .prologue
    .line 141
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->initializeDMO()V

    .line 142
    return-void
.end method

.method public InvalidateAccessToken()V
    .locals 1

    .prologue
    .line 175
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->invalidateAccessToken()V

    .line 176
    return-void
.end method

.method public IsBluetoothRadioOn()Z
    .locals 1

    .prologue
    .line 380
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->isBLERadioEnabled()Z

    move-result v0

    return v0
.end method

.method public IsLocationServiceOn()V
    .locals 1

    .prologue
    .line 385
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->checkLocationServiceEnabled()V

    .line 386
    return-void
.end method

.method public LibraryVersion()V
    .locals 1

    .prologue
    .line 146
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sendSDKVersionToApp()V

    .line 147
    return-void
.end method

.method public LoginWithAccessToken(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "accessToken"    # Ljava/lang/String;
    .param p2, "proxyToken"    # Ljava/lang/String;

    .prologue
    .line 169
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->updateAccessToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->GetOwnerKey()V

    .line 171
    return-void
.end method

.method public Logout()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 180
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->updateAccessToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    return-void
.end method

.method public NegotiateSessionKey(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 300
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->negotiateSessionKey(I)V

    .line 301
    return-void
.end method

.method public ReceivePackageToMobile(ILjava/lang/String;I)V
    .locals 1
    .param p1, "deviceId"    # I
    .param p2, "packageId"    # Ljava/lang/String;
    .param p3, "version"    # I

    .prologue
    .line 400
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sharedInstance()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->receivePackageToMobile(ILjava/lang/String;I)V

    .line 401
    return-void
.end method

.method public RegisterDevice(Ljava/lang/String;I)V
    .locals 1
    .param p1, "ownerId"    # Ljava/lang/String;
    .param p2, "deviceId"    # I

    .prologue
    .line 265
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p2, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->getVerifyTokenForDeviceId(ILjava/lang/String;)V

    .line 266
    return-void
.end method

.method public RemoveAllCachedPackages(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 410
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sharedInstance()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->removeAllCachedPackages(I)V

    .line 411
    return-void
.end method

.method public RequestDisplayName(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 280
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->requestDisplayNameForDeviceId(I)V

    .line 281
    return-void
.end method

.method public RequestFirmware(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 343
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->requestFirmwareMetadata(I)V

    .line 344
    return-void
.end method

.method public RequestFirmwareVersion(IZ)V
    .locals 1
    .param p1, "deviceId"    # I
    .param p2, "sendHeartbeat"    # Z

    .prologue
    .line 338
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->requestFirmwareVersion(IZ)V

    .line 339
    return-void
.end method

.method public ResetDownload(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 260
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->resetDownloadPartition(I)V

    .line 261
    return-void
.end method

.method public ResetToy(I)V
    .locals 3
    .param p1, "deviceId"    # I

    .prologue
    .line 215
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->TAG:Ljava/lang/String;

    const-string v2, "ResetToy(int deviceId) is not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    return-void
.end method

.method public SendDataEvent(ISLjava/lang/String;)V
    .locals 1
    .param p1, "deviceId"    # I
    .param p2, "eventId"    # S
    .param p3, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 285
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p2, p1, p3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sendDataEvent(SILjava/lang/String;)V

    .line 286
    return-void
.end method

.method public SendOwnerId(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 360
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sendOwnerIdToDevice(I)V

    .line 361
    return-void
.end method

.method public SendPackageToToy(ILjava/lang/String;I)V
    .locals 1
    .param p1, "deviceId"    # I
    .param p2, "packageId"    # Ljava/lang/String;
    .param p3, "version"    # I

    .prologue
    .line 415
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sharedInstance()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sendPackageToToy(ILjava/lang/String;I)V

    .line 416
    return-void
.end method

.method public SendRebootRequest(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 295
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->rebootDeviceId(I)V

    .line 296
    return-void
.end method

.method public SetActiveAbilities(I[I)V
    .locals 3
    .param p1, "deviceId"    # I
    .param p2, "ability"    # [I

    .prologue
    .line 205
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->TAG:Ljava/lang/String;

    const-string v2, "SetActiveAbilities(int deviceId, int[] ability) is not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    return-void
.end method

.method public SetBotAbilities(I[I)V
    .locals 3
    .param p1, "botType"    # I
    .param p2, "ability"    # [I

    .prologue
    .line 210
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->TAG:Ljava/lang/String;

    const-string v2, "SetBotAbilities(int botType, int[] ability) is not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    return-void
.end method

.method public SetEnvironment(ILjava/lang/String;)V
    .locals 3
    .param p1, "deviceID"    # I
    .param p2, "environmentId"    # Ljava/lang/String;

    .prologue
    .line 200
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->TAG:Ljava/lang/String;

    const-string v2, "SetEnvironment(int deviceID, String environmentId) is not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    return-void
.end method

.method public SetLibraryFeature(IZ)V
    .locals 1
    .param p1, "feature"    # I
    .param p2, "setting"    # Z

    .prologue
    .line 310
    if-nez p1, :cond_0

    .line 312
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    iput-boolean p2, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->analytics:Z

    .line 314
    :cond_0
    return-void
.end method

.method public SetRTOHost(Ljava/lang/String;)V
    .locals 1
    .param p1, "baseHost"    # Ljava/lang/String;

    .prologue
    .line 355
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    iput-object p1, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    .line 356
    return-void
.end method

.method public TransferManifest(ILjava/lang/String;)V
    .locals 2
    .param p1, "deviceId"    # I
    .param p2, "packageId"    # Ljava/lang/String;

    .prologue
    .line 230
    invoke-static {p2}, Lcom/disney/emagine/sdk/EMTFileManager;->utf8StringFromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 232
    .local v0, "experienceId":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->getManifestMetadata(Ljava/lang/String;I)V

    .line 233
    return-void
.end method

.method public UnregisterDevice(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 270
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->unregisterFromRTODeviceId(I)V

    .line 271
    return-void
.end method

.method public UploadAnalytics(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 365
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packageAnalyticsFileTransferRequest(I)V

    .line 366
    return-void
.end method

.method public UploadFirmware(ILjava/lang/String;)V
    .locals 3
    .param p1, "deviceId"    # I
    .param p2, "fwpFilename"    # Ljava/lang/String;

    .prologue
    .line 348
    const-string v1, "\\"

    const-string v2, ""

    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 350
    .local v0, "fwp":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->uploadFirmware(Ljava/lang/String;I)V

    .line 351
    return-void
.end method

.method public bleController()Lcom/disney/emagine/sdk/ble/EMTController;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    return-object v0
.end method

.method public getProxyKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 375
    invoke-static {}, Lcom/disney/emagine/sdk/crypto/AESjni;->sharedInstance()Lcom/disney/emagine/sdk/crypto/AESjni;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/crypto/AESjni;->getProxyKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
    .locals 1

    .prologue
    .line 106
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->sharedInstance()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    return-object v0
.end method

.method public resetBluetoothManager()V
    .locals 3

    .prologue
    .line 120
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    if-nez v1, :cond_1

    .line 137
    :cond_0
    :goto_0
    return-void

    .line 124
    :cond_1
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 131
    :try_start_0
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v1

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->reconnectDeviceId:Ljava/lang/Integer;

    .line 132
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->disconnectDevice()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 134
    :catch_0
    move-exception v0

    .line 135
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setConsoleDelegate(Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;)V
    .locals 1
    .param p1, "delegate"    # Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;

    .prologue
    .line 91
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/EMTConsole;->setDelegate(Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;)V

    .line 92
    return-void
.end method

.method public setControllerDelegate(Lcom/disney/emagine/sdk/delegate/EMTActivityDelegate;)V
    .locals 1
    .param p1, "delegate"    # Lcom/disney/emagine/sdk/delegate/EMTActivityDelegate;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->mMainController:Lcom/disney/emagine/sdk/EMTMainController;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/EMTMainController;->setDelegate(Lcom/disney/emagine/sdk/delegate/EMTActivityDelegate;)V

    .line 97
    return-void
.end method

.method public testReceiveZip(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 195
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->portalLibraryController()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->testReceiveZip(I)V

    .line 196
    return-void
.end method
