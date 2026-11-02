.class public Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;
.super Ljava/lang/Object;
.source "EMTAndroidPlugin.java"

# interfaces
.implements Lcom/disney/emagine/sdk/delegate/EMTCallbackDelegate;


# static fields
.field static INSTANCE:Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field bleCallbackObj:Ljava/lang/String;

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-class v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    .line 38
    const/4 v0, 0x0

    sput-object v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->INSTANCE:Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;

    return-void
.end method

.method public constructor <init>()V
    .locals 10

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v6

    iput-object v6, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 46
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    move-result-object v6

    iput-object v6, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    .line 47
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v6

    invoke-virtual {v6, p0}, Lcom/disney/emagine/sdk/EMTCallback;->setDelegate(Lcom/disney/emagine/sdk/delegate/EMTCallbackDelegate;)V

    .line 48
    invoke-static {}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v6

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->activate()V

    .line 50
    iget-object v6, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v8, "Android plugin for Unity, version    1.0.67"

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    iget-object v6, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v8, "                          build date September 13, 2016  12:00 PST"

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    iget-object v6, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v8, "                          tag        v1.0.67_20160913-1200"

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    .line 55
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 59
    .local v3, "packageName":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v3, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 61
    .local v2, "pInfo":Landroid/content/pm/PackageInfo;
    iget-object v5, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 62
    .local v5, "versionName":Ljava/lang/String;
    iget v4, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 63
    .local v4, "versionCode":I
    iget-object v6, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "                  Android versionName      "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    iget-object v6, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "                  Android versionCode      "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .end local v2    # "pInfo":Landroid/content/pm/PackageInfo;
    .end local v4    # "versionCode":I
    .end local v5    # "versionName":Ljava/lang/String;
    :goto_0
    return-void

    .line 66
    :catch_0
    move-exception v1

    .line 69
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 70
    iget-object v6, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private beginScan()V
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->isScanning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->beginScanning()V

    .line 123
    :cond_0
    return-void
.end method

.method private callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 835
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "callUnityMethod methodName="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "jsonData="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 837
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->bleCallbackObj:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 839
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->bleCallbackObj:Ljava/lang/String;

    invoke-direct {p0, v0, p1, p2}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->unitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 841
    :cond_0
    return-void
.end method

.method public static instance()Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;
    .locals 1

    .prologue
    .line 76
    sget-object v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->INSTANCE:Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;

    if-nez v0, :cond_0

    .line 78
    new-instance v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->INSTANCE:Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;

    .line 81
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->INSTANCE:Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;

    return-object v0
.end method

.method private unitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "callbackObject"    # Ljava/lang/String;
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 845
    invoke-static {p1, p2, p3}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 846
    return-void
.end method


# virtual methods
.method public BLECallback(ILjava/lang/String;)V
    .locals 20
    .param p1, "event"    # I
    .param p2, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 510
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "BLECallback event="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "jsonData="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 512
    packed-switch p1, :pswitch_data_0

    .line 826
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "Unknown Event = %d, json = %s"

    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x1

    aput-object p2, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 831
    :goto_0
    return-void

    .line 516
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v15, "BLE_DEVICE_FOUND [%04d] : [%s]"

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    aput-object p2, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 518
    const-string v13, "deviceFound"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 525
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v15, "BLE_DEVICE_CONNECT"

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 527
    const-string v13, "deviceConnected"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 534
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v15, "BLE_DEVICE_DISCONNECT"

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 536
    const-string v13, "deviceDisconnected"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 543
    :pswitch_4
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v15, "BLE_DEVICE_LEFT"

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 545
    const-string v13, "deviceLeft"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 552
    :pswitch_5
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Received custom Lua Event with payload "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 554
    invoke-static/range {p2 .. p2}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromJsonString(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v6

    .line 555
    .local v6, "jsonDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v13, "from"

    invoke-virtual {v6, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 556
    .local v5, "from":I
    const-string v13, "event"

    invoke-virtual {v6, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->shortValue()S

    move-result v2

    .line 557
    .local v2, "anEvent":S
    const-string v13, "payload"

    invoke-virtual {v6, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 559
    .local v8, "payload":Ljava/lang/Object;
    const/16 v13, 0x233a

    move/from16 v0, p1

    if-ne v0, v13, :cond_0

    .line 561
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Received a playerdata.dat file with path = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 566
    :cond_0
    if-nez v8, :cond_1

    .line 568
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v15, "There is no payload, therefore not echoing the command"

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 573
    :cond_1
    instance-of v13, v8, Ljava/util/ArrayList;

    if-nez v13, :cond_2

    instance-of v13, v8, Ljava/util/HashMap;

    if-eqz v13, :cond_3

    .line 575
    :cond_2
    new-instance v9, Ljava/util/ArrayList;

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v8, v13, v14

    invoke-static {v13}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v13

    invoke-direct {v9, v13}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .local v9, "payload":Ljava/util/ArrayList;
    move-object v8, v9

    .line 578
    .end local v9    # "payload":Ljava/util/ArrayList;
    :cond_3
    invoke-static {v8}, Lcom/disney/emagine/sdk/json/EMTJson;->bytesFromJavaObject(Ljava/lang/Object;)[B

    move-result-object v10

    .line 579
    .local v10, "payloadData":[B
    const/4 v11, 0x0

    .line 583
    .local v11, "payloadString":Ljava/lang/String;
    :try_start_0
    new-instance v12, Ljava/lang/String;

    const-string v13, "UTF-8"

    invoke-direct {v12, v10, v13}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 585
    .end local v11    # "payloadString":Ljava/lang/String;
    .local v12, "payloadString":Ljava/lang/String;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v15, "Sending event: [%d], to device: [%d], with payload:[%s]"

    const/16 v16, 0x3

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x2

    aput-object v12, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 587
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    move-result-object v13

    invoke-virtual {v13, v5, v2, v12}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->SendDataEvent(ISLjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v11, v12

    .line 594
    .end local v12    # "payloadString":Ljava/lang/String;
    .restart local v11    # "payloadString":Ljava/lang/String;
    :goto_1
    const-string v13, "dataReceived"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 589
    :catch_0
    move-exception v4

    .line 591
    .local v4, "e":Ljava/io/UnsupportedEncodingException;
    :goto_2
    invoke-virtual {v4}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_1

    .line 601
    .end local v2    # "anEvent":S
    .end local v4    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v5    # "from":I
    .end local v6    # "jsonDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v8    # "payload":Ljava/lang/Object;
    .end local v10    # "payloadData":[B
    .end local v11    # "payloadString":Ljava/lang/String;
    :pswitch_6
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Device joined is Deprecated"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 608
    :pswitch_7
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Device left is Deprecated"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 615
    :pswitch_8
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Device Content = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 617
    const-string v13, "deviceContent"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 624
    :pswitch_9
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Download Content = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 626
    const-string v13, "download"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 633
    :pswitch_a
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "RTO Error = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 635
    const-string v13, "rtoError"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 642
    :pswitch_b
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v15, "REGISTRATION_STATUS [%04d] : [%s]"

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    aput-object p2, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 644
    const-string v13, "registrationStatus"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 651
    :pswitch_c
    invoke-static/range {p2 .. p2}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromJsonString(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v6

    .line 653
    .restart local v6    # "jsonDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v6, :cond_4

    .line 655
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "Device %s has available space = %s bytes"

    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    const-string v19, "from"

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x1

    const-string v19, "space_available"

    move-object/from16 v0, v19

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 658
    :cond_4
    const-string v13, "spaceAvailable"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 665
    .end local v6    # "jsonDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :pswitch_d
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Content present = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 667
    const-string v13, "contentPresentOnToy"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 674
    :pswitch_e
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Content deleted = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 676
    const-string v13, "contentDeleted"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 683
    :pswitch_f
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Sync App = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 685
    const-string v13, "synchDevice"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 692
    :pswitch_10
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Manfest transfer event = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 694
    const-string v13, "manifestUpdate"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 701
    :pswitch_11
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Firmware transfer event = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 703
    invoke-static/range {p2 .. p2}, Lcom/disney/emagine/sdk/EMTData;->stringToUTF8String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 704
    .local v7, "jsonString":Ljava/lang/String;
    invoke-static {v7}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromJsonString(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v6

    .line 705
    .restart local v6    # "jsonDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v13

    invoke-virtual {v13}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDeviceId()J

    move-result-wide v14

    long-to-int v3, v14

    .line 707
    .local v3, "deviceId":I
    const-string v13, "event"

    invoke-virtual {v6, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    packed-switch v13, :pswitch_data_1

    .line 724
    :pswitch_12
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Unrecognized FIRMWARE_TRANSFER event: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 728
    :goto_3
    const-string v13, "firmwareUpdate"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 710
    :pswitch_13
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "FW_AVAILABLE:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 714
    :pswitch_14
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "FW_RECIEVED:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 718
    :pswitch_15
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "FW_UPLOAD_STATUS: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 721
    :pswitch_16
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "FW_METADATA_ERROR "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 735
    .end local v3    # "deviceId":I
    .end local v6    # "jsonDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v7    # "jsonString":Ljava/lang/String;
    :pswitch_17
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Package transfer event = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 737
    const-string v13, "packageTransfer"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 744
    :pswitch_18
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v15, "PLAYER_DAT [%04d] : [%s]"

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    aput-object p2, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 746
    const-string v13, "gearDataUpdate"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 753
    :pswitch_19
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v15, "IM_HERE_RECEIVED [%04d] : [%s]"

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    aput-object p2, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 755
    const-string v13, "devicePingUpdate"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 762
    :pswitch_1a
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v15, "Don\'t call UPDATE_TOKENS! [%04d] : [%s]"

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    aput-object p2, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 769
    :pswitch_1b
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "Event = SDK_VERSION, json = %s"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object p2, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 771
    const-string v13, "sdkVersion"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 778
    :pswitch_1c
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "Event = RECEIVE_PACKAGE_EVENT, json = %s"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object p2, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 780
    const-string v13, "onRecievePackageToMobileSuccess"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 787
    :pswitch_1d
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "Event = CACHED_PACKAGES, json = %s"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object p2, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 789
    const-string v13, "onCachedPackageEvent"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 796
    :pswitch_1e
    const-string v13, "entiledContentAvailable"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 803
    :pswitch_1f
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "Event = CACHED_PACKAGES_CLEARED, json = %s"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object p2, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 812
    :pswitch_20
    const-string v13, "blueToothDisabled"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 819
    :pswitch_21
    const-string v13, "blueToothEnabled"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v13, v1}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->callUnityMethod(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 589
    .restart local v2    # "anEvent":S
    .restart local v5    # "from":I
    .restart local v6    # "jsonDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v8    # "payload":Ljava/lang/Object;
    .restart local v10    # "payloadData":[B
    .restart local v12    # "payloadString":Ljava/lang/String;
    :catch_1
    move-exception v4

    move-object v11, v12

    .end local v12    # "payloadString":Ljava/lang/String;
    .restart local v11    # "payloadString":Ljava/lang/String;
    goto/16 :goto_2

    .line 512
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_7
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_8
        :pswitch_0
        :pswitch_9
        :pswitch_1
        :pswitch_4
        :pswitch_2
        :pswitch_3
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_19
        :pswitch_17
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_18
        :pswitch_0
        :pswitch_1a
        :pswitch_21
        :pswitch_20
        :pswitch_0
        :pswitch_0
        :pswitch_1b
        :pswitch_0
        :pswitch_1c
        :pswitch_1d
        :pswitch_1e
        :pswitch_1f
    .end packed-switch

    .line 707
    :pswitch_data_1
    .packed-switch 0x65
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_12
        :pswitch_16
    .end packed-switch
.end method

.method public bleController()Lcom/disney/emagine/sdk/ble/EMTController;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v0

    return-object v0
.end method

.method public bluetoothPopup()V
    .locals 3

    .prologue
    .line 883
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "bluetoothPopup is not implemented"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 884
    return-void
.end method

.method public clearContent(ILjava/lang/String;I)V
    .locals 4
    .param p1, "deviceId"    # I
    .param p2, "contentId"    # Ljava/lang/String;
    .param p3, "version"    # I

    .prologue
    .line 347
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "clearContent deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " contentId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " version:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 349
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1, p2, p3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->ClearContent(ILjava/lang/String;I)V

    .line 351
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "clearContent end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 352
    return-void
.end method

.method public connectToDevice(I)V
    .locals 5
    .param p1, "deviceId"    # I

    .prologue
    .line 136
    :try_start_0
    iget-object v1, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "connectToDevice device_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    iget-object v1, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    if-eqz v1, :cond_0

    .line 139
    iget-object v1, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v1, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->Connect(I)Z

    .line 141
    iget-object v1, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v3, "connectToDevice end"

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 147
    :cond_0
    return-void

    .line 143
    :catch_0
    move-exception v0

    .line 144
    .local v0, "ex":Ljava/lang/RuntimeException;
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->printStackTrace()V

    .line 145
    throw v0
.end method

.method crash()V
    .locals 3

    .prologue
    .line 249
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "crash"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "Not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    return-void
.end method

.method public disconnectFromDevice()V
    .locals 3

    .prologue
    .line 231
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "disconnectFromDevice"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->Disconnect()V

    .line 235
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "disconnectFromDevice end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    return-void
.end method

.method displayPopup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "button"    # Ljava/lang/String;
    .param p4, "callbackObject"    # Ljava/lang/String;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "displayPopup title="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " message="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " button="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " callbackObject"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "Not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    return-void
.end method

.method public downloadContent(ILjava/lang/String;)V
    .locals 4
    .param p1, "deviceId"    # I
    .param p2, "contentId"    # Ljava/lang/String;

    .prologue
    .line 186
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "downloadContent deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " contentId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    iget-object v1, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->DownloadContent(IILjava/lang/String;)V

    .line 190
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "downloadContent end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    return-void
.end method

.method public downloadZip(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 195
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "downloadContent deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->testReceiveZip(I)V

    .line 199
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "downloadContent end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    return-void
.end method

.method public enterKeyMask(ILjava/lang/String;)V
    .locals 4
    .param p1, "deviceId"    # I
    .param p2, "keyedInput"    # Ljava/lang/String;

    .prologue
    .line 435
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "enterKeyMask deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "keyedInput="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->EnterKeyMask(ILjava/lang/String;)V

    .line 439
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "enterKeyMask end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 440
    return-void
.end method

.method public getAvailableSpace(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 295
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getAvailableSpace deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->GetAvailableSpace(I)V

    .line 299
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "getAvailableSpace end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    return-void
.end method

.method public getBuildNumber(Ljava/lang/String;)V
    .locals 9
    .param p1, "callbackObj"    # Ljava/lang/String;

    .prologue
    .line 374
    iget-object v5, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getBuildNumber callbackObj="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    .line 379
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 383
    .local v2, "packageName":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v2, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    iget-object v4, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 392
    .local v4, "versionName":Ljava/lang/String;
    const-string v5, "buildNumber"

    invoke-direct {p0, p1, v5, v4}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->unitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    iget-object v5, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getBuildNumber versionName="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    return-void

    .line 384
    .end local v4    # "versionName":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 385
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "error"

    .line 386
    .restart local v4    # "versionName":Ljava/lang/String;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v5, "unable to fetch package name of this application"

    invoke-direct {v3, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 387
    .local v3, "rte":Ljava/lang/RuntimeException;
    invoke-virtual {v3, v1}, Ljava/lang/RuntimeException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 388
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 389
    throw v3
.end method

.method public getCachedPackages(I)V
    .locals 6
    .param p1, "deviceId"    # I

    .prologue
    .line 920
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "GetCachedPackages for device:[%d]"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 921
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->GetCachedPackages(I)V

    .line 922
    return-void
.end method

.method public getContentEntitlements(I)V
    .locals 6
    .param p1, "deviceId"    # I

    .prologue
    .line 908
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "GetContentEntitlements for device:[%d]"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 909
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->GetContentEntitlements(I)V

    .line 910
    return-void
.end method

.method public getContentList(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 204
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getContentList deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->GetContentList(I)V

    .line 208
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "getContentList end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    return-void
.end method

.method public getContentOnToy(I)V
    .locals 6
    .param p1, "deviceId"    # I

    .prologue
    .line 903
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "GetContentOnToy: [%d]"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 904
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->GetContentOnToy(I)V

    .line 905
    return-void
.end method

.method public getDeviceContentList(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 356
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDeviceContentList deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 358
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->GetDeviceContentList(I)V

    .line 360
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "getDeviceContentList end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    return-void
.end method

.method public getDevices()V
    .locals 3

    .prologue
    .line 213
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "getDevices"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->GetAvailableDevices()V

    .line 217
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "getDevices end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    return-void
.end method

.method getEncryptionKey(Ljava/lang/String;)V
    .locals 4
    .param p1, "callbackObj"    # Ljava/lang/String;

    .prologue
    .line 285
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getEncryptionKey callbackObj="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "Not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    return-void
.end method

.method getLogs()V
    .locals 3

    .prologue
    .line 222
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "getLogs"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "Not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    return-void
.end method

.method public getOwnerKey()V
    .locals 3

    .prologue
    .line 489
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "getOwnerKey"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 491
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->GetOwnerKey()V

    .line 493
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "getOwnerKey end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 494
    return-void
.end method

.method imHereMessageReceived(Ljava/lang/String;)V
    .locals 0
    .param p1, "callbackObj"    # Ljava/lang/String;

    .prologue
    .line 168
    return-void
.end method

.method public initializeDMO()V
    .locals 3

    .prologue
    .line 172
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "Initializing DMO from SDK"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->InitializeDMO()V

    .line 175
    return-void
.end method

.method public invalidateAccessToken()V
    .locals 3

    .prologue
    .line 313
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "invalidateAccessToken"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->InvalidateAccessToken()V

    .line 316
    return-void
.end method

.method public isBluetoothRadioOn()V
    .locals 5

    .prologue
    .line 859
    invoke-static {}, Lcom/disney/emagine/sdk/ble/EMTController;->radioEnabled()Z

    move-result v0

    .line 861
    .local v0, "enabled":Z
    iget-object v2, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isBluetoothRadioOn result="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz v0, :cond_0

    const-string v1, "BLE_RADIO_ENABLED"

    :goto_0
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 864
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v2

    if-eqz v0, :cond_1

    const/16 v1, 0x19

    :goto_1
    const-string v3, "[]"

    invoke-virtual {v2, v1, v3}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 867
    return-void

    .line 861
    :cond_0
    const-string v1, "BLE_RADIO_DISABLED"

    goto :goto_0

    .line 864
    :cond_1
    const/16 v1, 0x1a

    goto :goto_1
.end method

.method public isLocationServiceOn()V
    .locals 1

    .prologue
    .line 870
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->IsLocationServiceOn()V

    .line 871
    return-void
.end method

.method public launchDisIdLoginPage()V
    .locals 3

    .prologue
    .line 887
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "launchDisIdLoginPage is not implemented"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 888
    return-void
.end method

.method public libraryVersion()V
    .locals 3

    .prologue
    .line 179
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "SDK Version requested: 1.0.67"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->LibraryVersion()V

    .line 182
    return-void
.end method

.method public loginWithAccessToken(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "accessToken"    # Ljava/lang/String;
    .param p2, "proxyToken"    # Ljava/lang/String;

    .prologue
    .line 304
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "loginWithAccessToken accessToken="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " proxyToken="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->LoginWithAccessToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "loginWithAccessToken end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    return-void
.end method

.method public logout()V
    .locals 3

    .prologue
    .line 320
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "logout"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->Logout()V

    .line 324
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "logout end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    return-void
.end method

.method public negotiateSessionKey(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 426
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "negotiateSessionKey deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->NegotiateSessionKey(I)V

    .line 430
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "negotiateSessionKey end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    return-void
.end method

.method public onDisidLogout()V
    .locals 3

    .prologue
    .line 899
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "onDisidLogout is not implemented"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 900
    return-void
.end method

.method public onForceRefreshToken()V
    .locals 3

    .prologue
    .line 895
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "onForceRefreshToken is not implemented"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 896
    return-void
.end method

.method public onSilentLogin()V
    .locals 3

    .prologue
    .line 891
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "onSilentLogin is not implemented"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 892
    return-void
.end method

.method optOutPersonlization(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 417
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "optOutPersonlization deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 421
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "Not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    return-void
.end method

.method personlizeDevice(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 408
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "personlizeDevice deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "Not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    return-void
.end method

.method public receivePackageToMobile(ILjava/lang/String;I)V
    .locals 6
    .param p1, "deviceId"    # I
    .param p2, "packageId"    # Ljava/lang/String;
    .param p3, "version"    # I

    .prologue
    .line 914
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "ReceivePackageToMobile for device:[%d] packageId:[%s], version:[%d]"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 915
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1, p2, p3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->ReceivePackageToMobile(ILjava/lang/String;I)V

    .line 916
    return-void
.end method

.method public registerDevice(Ljava/lang/String;I)V
    .locals 4
    .param p1, "ownerId"    # Ljava/lang/String;
    .param p2, "deviceId"    # I

    .prologue
    .line 258
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "registerDevice ownerId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->RegisterDevice(Ljava/lang/String;I)V

    .line 262
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "registerDevice end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    return-void
.end method

.method public removeAllCachedPackages(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 935
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "removeAllCachedPackages for device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 936
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->RemoveAllCachedPackages(I)V

    .line 937
    return-void
.end method

.method public requestDisplayName(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 365
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestDisplayName deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->RequestDisplayName(I)V

    .line 369
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "requestDisplayName end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    return-void
.end method

.method public requestFirmware(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 462
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestFirmware deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->RequestFirmware(I)V

    .line 466
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "requestFirmware end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    return-void
.end method

.method public requestFirmwareVersion(IZ)V
    .locals 4
    .param p1, "deviceId"    # I
    .param p2, "sendHeartbeat"    # Z

    .prologue
    .line 849
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestFirmwareVersion deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; sendHeartbeat="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 851
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->RequestFirmwareVersion(IZ)V

    .line 853
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "requestFirmwareVersion end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 854
    return-void
.end method

.method public resetDownload(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 480
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "resetDownload deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->ResetDownload(I)V

    .line 484
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "resetDownload end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    return-void
.end method

.method public sendData(ISLjava/lang/String;)V
    .locals 4
    .param p1, "deviceId"    # I
    .param p2, "eventType"    # S
    .param p3, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendData deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " eventType="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " jsonData="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1, p2, p3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->SendDataEvent(ISLjava/lang/String;)V

    .line 155
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "sendData end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    return-void
.end method

.method public sendMission(ILjava/lang/String;)V
    .locals 3
    .param p1, "deviceId"    # I
    .param p2, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 879
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "sendMission is not implemented"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 880
    return-void
.end method

.method public sendPackageToToy(ILjava/lang/String;I)V
    .locals 6
    .param p1, "deviceId"    # I
    .param p2, "packageId"    # Ljava/lang/String;
    .param p3, "version"    # I

    .prologue
    .line 926
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "SendPackageToToy for device:[%d] packageId:[%s], version:[%d]"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 927
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1, p2, p3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->SendPackageToToy(ILjava/lang/String;I)V

    .line 928
    return-void
.end method

.method sendPersonlizationRequest(Ljava/lang/String;)V
    .locals 4
    .param p1, "fname"    # Ljava/lang/String;

    .prologue
    .line 399
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendPersonlizationRequest fname="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "Not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 404
    return-void
.end method

.method public sendRebootRequest(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 338
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendRebootRequest deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->SendRebootRequest(I)V

    .line 342
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "sendRebootRequest end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 343
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "setContext is deprecated. Call ignored."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    return-void
.end method

.method setEncryptionKey(Ljava/lang/String;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 276
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setEncryptionKey key="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "Not implemented."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    return-void
.end method

.method public setRTOHost(Ljava/lang/String;)V
    .locals 4
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 444
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setRTOHost url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->SetRTOHost(Ljava/lang/String;)V

    .line 448
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "setRTOHost end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 449
    return-void
.end method

.method public setupBLE(Ljava/lang/String;)V
    .locals 4
    .param p1, "callbackObject"    # Ljava/lang/String;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setupBLE callbackObject="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    iput-object p1, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->bleCallbackObj:Ljava/lang/String;

    .line 129
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "setupBLE end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->getDevices()V

    .line 131
    return-void
.end method

.method public setupDisneyId(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 875
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "setupDisneyId is not implemented"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 876
    return-void
.end method

.method public test()V
    .locals 3

    .prologue
    .line 86
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "Test from Java layer."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    return-void
.end method

.method public transferManifest(ILjava/lang/String;)V
    .locals 4
    .param p1, "deviceId"    # I
    .param p2, "packageId"    # Ljava/lang/String;

    .prologue
    .line 453
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "transferManifest deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " packageId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 455
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->TransferManifest(ILjava/lang/String;)V

    .line 457
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "transferManifest end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 458
    return-void
.end method

.method public unityLog(Ljava/lang/String;)V
    .locals 3
    .param p1, "log"    # Ljava/lang/String;

    .prologue
    .line 931
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "unityLog is not implemented"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 932
    return-void
.end method

.method unregisterBLE()V
    .locals 3

    .prologue
    .line 240
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "unregisterBLE"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->bleCallbackObj:Ljava/lang/String;

    .line 244
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "unregisterBLE end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    return-void
.end method

.method public unregisterDevice(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 267
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unregisterDevice deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 269
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->UnregisterDevice(I)V

    .line 271
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "unregisterDevice end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    return-void
.end method

.method public uploadAnalytics(I)V
    .locals 3
    .param p1, "deviceId"    # I

    .prologue
    .line 329
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "uploadAnalytics"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->UploadAnalytics(I)V

    .line 333
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "uploadAnalytics end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    return-void
.end method

.method public uploadFirmware(ILjava/lang/String;)V
    .locals 4
    .param p1, "deviceId"    # I
    .param p2, "fwpFilename"    # Ljava/lang/String;

    .prologue
    .line 471
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "uploadFirmware deviceId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " fwpFilename="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mPortalLibrary:Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->UploadFirmware(ILjava/lang/String;)V

    .line 475
    iget-object v0, p0, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/plugin/EMTAndroidPlugin;->TAG:Ljava/lang/String;

    const-string v2, "uploadFirmware end"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    return-void
.end method
