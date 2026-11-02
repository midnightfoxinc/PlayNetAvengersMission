.class public Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
.super Ljava/lang/Object;
.source "EMTPortalLibraryController.java"

# interfaces
.implements Lcom/disney/emagine/sdk/transitionkit/TKConstants;
.implements Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;
.implements Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;
.implements Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    }
.end annotation


# static fields
.field public static final ANALYTICS_READY_FOR_UPLOAD:I = 0x2

.field public static final ANALYTICS_TOY_REGISTERED:I = 0x1

.field public static final BLE_DEVICE_ADDRESS:I = -0x3

.field public static final BLE_DEVICE_BROADCAST:I = -0x2

.field public static final BLE_PORTAL_APP_TYPE_ID:I = 0x1

.field public static final DISCONNECT_TIME_IN_SECONDS:I = 0xf

.field public static final FILES_READY_FOR_UPLOAD:I = 0x4

.field public static final FILE_TRANSFER_ALLOWED:I = 0x8

.field private static final INVALID_ACCESS_TOKEN:Ljava/lang/String; = "0123456789ABCDEF"

.field public static final PLAYER_DAT_TIMEOUT:I = 0x8

.field private static final TAG:Ljava/lang/String;

.field public static final TIMER_INTERVAL:I = 0x1

.field private static instance:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;


# instance fields
.field private accessToken:Ljava/lang/String;

.field public analytics:Z

.field private analyticsStringMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private deviceIdPending:Ljava/lang/Integer;

.field private dmoAnalytics:Lcom/disneymobile/analytics/DMOAnalytics;

.field private drtDeviceList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;",
            ">;"
        }
    .end annotation
.end field

.field private foreground:Lcom/disney/emagine/sdk/foreground/Foreground;

.field foregroundListener:Lcom/disney/emagine/sdk/foreground/Foreground$Listener;

.field private isBLERadioEnabled:Z

.field private keycodeTimer:Ljava/util/Timer;

.field private keycodeTimerTask:Ljava/util/TimerTask;

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private mLoginClient:Lcom/disney/emagine/sdk/networking/EMTRestClient;

.field private maskedKey:[B

.field private missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

.field private networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

.field private ownerId:Ljava/lang/String;

.field private packagesPresent:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public reconnectDeviceId:Ljava/lang/Integer;

.field public reconnectTransition:Lcom/disney/emagine/sdk/transitionkit/TKTransition;

.field private semaphore:Ljava/util/concurrent/Semaphore;

.field private sendHeartbeatOnFWResponse:Z

.field private sessionKey:[B

.field private stateTimer:Ljava/util/Timer;

.field private stateTimerTask:Ljava/util/TimerTask;

.field private timer:Ljava/util/Timer;

.field private timerTask:Ljava/util/TimerTask;

.field private tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

.field private toyStringMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private uploadingAnalytics:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 98
    const/4 v0, 0x0

    sput-object v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->instance:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .line 100
    const-class v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 105
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sendHeartbeatOnFWResponse:Z

    .line 3446
    new-instance v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$9;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$9;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->foregroundListener:Lcom/disney/emagine/sdk/foreground/Foreground$Listener;

    .line 197
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 198
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->drtDeviceList:Ljava/util/ArrayList;

    .line 199
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->semaphore:Ljava/util/concurrent/Semaphore;

    .line 200
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->sharedInstance()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    .line 202
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sharedInstance()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    .line 203
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->analytics:Z

    .line 204
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->uploadingAnalytics:Z

    .line 205
    invoke-static {}, Lcom/disney/emagine/sdk/dmo/EMTAnalytics;->generateToyStringMap()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->toyStringMap:Ljava/util/HashMap;

    .line 206
    invoke-static {}, Lcom/disney/emagine/sdk/dmo/EMTAnalytics;->generateAnalyticsStringMap()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->analyticsStringMap:Ljava/util/HashMap;

    .line 207
    return-void
.end method

.method static synthetic access$000(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    sget-object v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/EMTConsole;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-object v0
.end method

.method static synthetic access$300(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->accessToken:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$302(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->accessToken:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;[B[B)I
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
    .param p1, "x1"    # [B
    .param p2, "x2"    # [B

    .prologue
    .line 96
    invoke-direct {p0, p1, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->searchForBytePattern([B[B)I

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->analyticsStringMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$600(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->toyStringMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$700(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    return-object v0
.end method

.method public static isMatch([B[BI)Z
    .locals 3
    .param p0, "pattern"    # [B
    .param p1, "input"    # [B
    .param p2, "pos"    # I

    .prologue
    .line 1083
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 1085
    aget-byte v1, p0, v0

    add-int v2, p2, v0

    aget-byte v2, p1, v2

    if-eq v1, v2, :cond_0

    .line 1087
    const/4 v1, 0x0

    .line 1091
    :goto_1
    return v1

    .line 1083
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1091
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private searchForBytePattern([B[B)I
    .locals 6
    .param p1, "bytes"    # [B
    .param p2, "pattern"    # [B

    .prologue
    .line 1049
    const/4 v3, 0x0

    .line 1051
    .local v3, "matches":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, p1

    if-ge v0, v4, :cond_3

    .line 1053
    const/4 v4, 0x0

    aget-byte v4, p2, v4

    aget-byte v5, p1, v0

    if-ne v4, v5, :cond_2

    array-length v4, p1

    sub-int/2addr v4, v0

    array-length v5, p2

    if-lt v4, v5, :cond_2

    .line 1055
    const/4 v1, 0x1

    .line 1057
    .local v1, "ismatch":Z
    const/4 v2, 0x1

    .local v2, "j":I
    :goto_1
    array-length v4, p2

    if-ge v2, v4, :cond_1

    const/4 v4, 0x1

    if-ne v1, v4, :cond_1

    .line 1059
    add-int v4, v0, v2

    aget-byte v4, p1, v4

    aget-byte v5, p2, v2

    if-eq v4, v5, :cond_0

    .line 1061
    const/4 v1, 0x0

    .line 1057
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1065
    :cond_1
    if-eqz v1, :cond_2

    .line 1067
    add-int/lit8 v3, v3, 0x1

    .line 1068
    array-length v4, p2

    add-int/lit8 v4, v4, -0x1

    add-int/2addr v0, v4

    .line 1051
    .end local v1    # "ismatch":Z
    .end local v2    # "j":I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1073
    :cond_3
    return v3
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
    .locals 1

    .prologue
    .line 216
    sget-object v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->instance:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    if-nez v0, :cond_0

    .line 218
    new-instance v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->instance:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .line 220
    sget-object v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->instance:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateMachineInit()V

    .line 223
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->instance:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    return-object v0
.end method

.method public static split([B[B)Ljava/util/List;
    .locals 4
    .param p0, "input"    # [B
    .param p1, "pattern"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B[B)",
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 1101
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 1102
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v0, 0x0

    .line 1104
    .local v0, "blockStart":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p0

    if-ge v1, v3, :cond_1

    .line 1106
    invoke-static {p1, p0, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->isMatch([B[BI)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1108
    invoke-static {p0, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1110
    array-length v3, p1

    add-int v0, v1, v3

    .line 1111
    move v1, v0

    .line 1104
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1115
    :cond_1
    array-length v3, p0

    invoke-static {p0, v0, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1117
    return-object v2
.end method


# virtual methods
.method public TAG()Ljava/lang/String;
    .locals 1

    .prologue
    .line 3549
    sget-object v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public addLineToConsole(Ljava/lang/String;)V
    .locals 0
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 3590
    return-void
.end method

.method public bleController()Lcom/disney/emagine/sdk/ble/EMTController;
    .locals 1

    .prologue
    .line 235
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->portalLibrary()Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v0

    return-object v0
.end method

.method public cachePackagesPresent(Ljava/util/HashMap;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2983
    .local p1, "packageDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iput-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packagesPresent:Ljava/util/HashMap;

    .line 2985
    const-string v6, "INSTALLED"

    invoke-virtual {p1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2987
    .local v1, "installedContainer":Ljava/lang/Object;
    if-eqz v1, :cond_2

    instance-of v6, v1, Ljava/util/ArrayList;

    if-eqz v6, :cond_2

    move-object v0, v1

    .line 2989
    check-cast v0, Ljava/util/ArrayList;

    .line 2991
    .local v0, "installedArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/ArrayList<Ljava/lang/Object;>;>;"
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "New style packes: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 2993
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    .line 2995
    .local v4, "packagePair":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v8, 0x2

    if-ne v6, v8, :cond_0

    .line 2997
    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 2998
    .local v3, "packageName":Ljava/lang/String;
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    .line 3000
    .local v5, "version":Ljava/lang/Number;
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packagesPresent:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_1

    .line 3001
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packagesPresent:Ljava/util/HashMap;

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v6, v3, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3003
    :cond_1
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packagesPresent:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 3007
    .end local v0    # "installedArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/ArrayList<Ljava/lang/Object;>;>;"
    .end local v3    # "packageName":Ljava/lang/String;
    .end local v4    # "packagePair":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v5    # "version":Ljava/lang/Number;
    :cond_2
    if-eqz v1, :cond_5

    instance-of v6, v1, Ljava/util/HashMap;

    if-eqz v6, :cond_5

    move-object v2, v1

    .line 3011
    check-cast v2, Ljava/util/HashMap;

    .line 3013
    .local v2, "installedMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Number;>;"
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Old style packages: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 3015
    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_3
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 3017
    .restart local v3    # "packageName":Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    .line 3019
    .restart local v5    # "version":Ljava/lang/Number;
    if-eqz v5, :cond_3

    .line 3021
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packagesPresent:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_4

    .line 3022
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packagesPresent:Ljava/util/HashMap;

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v6, v3, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3024
    :cond_4
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packagesPresent:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 3029
    .end local v2    # "installedMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Number;>;"
    .end local v3    # "packageName":Ljava/lang/String;
    .end local v5    # "version":Ljava/lang/Number;
    :cond_5
    const-string v6, "INSTALLED"

    iget-object v7, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packagesPresent:Ljava/util/HashMap;

    invoke-virtual {p1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3030
    return-void
.end method

.method public cancelLogin()V
    .locals 1

    .prologue
    .line 923
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mLoginClient:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    if-eqz v0, :cond_0

    .line 924
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mLoginClient:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->cancel()V

    .line 925
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mLoginClient:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    .line 927
    :cond_0
    return-void
.end method

.method public checkLocationServiceEnabled()V
    .locals 5

    .prologue
    .line 308
    invoke-static {}, Lcom/disney/emagine/sdk/ble/EMTController;->locationServiceEnabled()Z

    move-result v0

    .line 310
    .local v0, "enabled":Z
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isLocationServiceOn result="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz v0, :cond_0

    const-string v1, "LOCATION_SERVICE_ENABLED"

    :goto_0
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v2

    if-eqz v0, :cond_1

    const/16 v1, 0x24

    :goto_1
    const-string v3, "[]"

    invoke-virtual {v2, v1, v3}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 315
    return-void

    .line 310
    :cond_0
    const-string v1, "LOCATION_SERVICE_DISABLED"

    goto :goto_0

    .line 313
    :cond_1
    const/16 v1, 0x25

    goto :goto_1
.end method

.method public cleanupAfterDisconnect(Ljava/lang/Integer;)V
    .locals 6
    .param p1, "deviceId"    # Ljava/lang/Integer;

    .prologue
    .line 1551
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v5, "cleanupAfterDisconnect(); called."

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1552
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->cleanupDRTDeviceList()V

    .line 1553
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eqz v3, :cond_0

    .line 1555
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "{\"device_id\": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", \"state\": \"disconnected\"}"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1558
    .local v1, "jsonObject":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 1560
    .local v0, "data":[B
    if-eqz v0, :cond_0

    .line 1562
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTFileManager;->utf8StringFromBytes([B)Ljava/lang/String;

    move-result-object v2

    .line 1564
    .local v2, "jsonString":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 1566
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v3

    const/16 v4, 0xb

    invoke-virtual {v3, v4, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 1570
    .end local v0    # "data":[B
    .end local v1    # "jsonObject":Ljava/lang/String;
    .end local v2    # "jsonString":Ljava/lang/String;
    :cond_0
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    const/4 v4, 0x0

    iput-object v4, v3, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    .line 1572
    return-void
.end method

.method public cleanupDRTDeviceList()V
    .locals 2

    .prologue
    .line 2542
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->drtDeviceList:Ljava/util/ArrayList;

    monitor-enter v1

    .line 2544
    :try_start_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->drtDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2545
    monitor-exit v1

    .line 2546
    return-void

    .line 2545
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public clearAnalyticsData()V
    .locals 1

    .prologue
    .line 2752
    const-string v0, "EM_ANALYTICS_SERVICE"

    invoke-static {v0}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->removeAllItemsForService(Ljava/lang/String;)Z

    .line 2753
    return-void
.end method

.method public connect(I)Z
    .locals 8
    .param p1, "deviceId"    # I

    .prologue
    .line 370
    const/4 v2, 0x0

    .line 372
    .local v2, "found":Z
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v4, "Scanning"

    invoke-virtual {v3, v4}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isInState(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 374
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/ble/EMTController;->knownDevices()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 376
    .local v0, "bleDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/emagine/sdk/ble/EMTDevice;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disney/emagine/sdk/ble/EMTDevice;

    .line 378
    .local v1, "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v1, :cond_0

    iget-wide v4, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    int-to-long v6, p1

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    .line 380
    invoke-virtual {p0, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deviceConnect(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    .line 382
    const/4 v2, 0x1

    .line 385
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->startTimer(I)V

    .line 392
    .end local v0    # "bleDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/emagine/sdk/ble/EMTDevice;>;"
    .end local v1    # "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    :cond_1
    return v2
.end method

.method public console()Lcom/disney/emagine/sdk/EMTConsole;
    .locals 1

    .prologue
    .line 3544
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-object v0
.end method

.method public convertFirmwareVersionToString(I)Ljava/lang/String;
    .locals 7
    .param p1, "firmwareVersion"    # I

    .prologue
    .line 2523
    and-int/lit16 v2, p1, 0xff

    if-lez v2, :cond_0

    const-string v0, "-DIRTY"

    .line 2524
    .local v0, "dirtyString":Ljava/lang/String;
    :goto_0
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%d.%d.%d%s"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const/high16 v6, -0x1000000

    and-int/2addr v6, p1

    shr-int/lit8 v6, v6, 0x18

    .line 2525
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const/high16 v6, 0xff0000

    and-int/2addr v6, p1

    shr-int/lit8 v6, v6, 0x10

    .line 2526
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const v6, 0xff00

    and-int/2addr v6, p1

    shr-int/lit8 v6, v6, 0x8

    .line 2527
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    aput-object v0, v4, v5

    .line 2524
    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 2531
    .local v1, "fwVersionString":Ljava/lang/String;
    return-object v1

    .line 2523
    .end local v0    # "dirtyString":Ljava/lang/String;
    .end local v1    # "fwVersionString":Ljava/lang/String;
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public createEMTDictionaryUsing(Lcom/disney/emagine/sdk/ble/EMTDevice;)Ljava/util/HashMap;
    .locals 4
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/emagine/sdk/ble/EMTDevice;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 816
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 818
    .local v0, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "device_id"

    iget-wide v2, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    long-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 819
    const-string v1, "type"

    iget v2, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 820
    const-string v1, "flags"

    iget-byte v2, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceFlags:B

    invoke-static {v2}, Lcom/disney/emagine/sdk/EMTData;->byteToByteObject(B)Ljava/lang/Byte;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 822
    return-object v0
.end method

.method public currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;
    .locals 1

    .prologue
    .line 276
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    return-object v0
.end method

.method public currentDeviceId()J
    .locals 2

    .prologue
    .line 325
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    iget-wide v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    goto :goto_0
.end method

.method public decryptVerifyAndStoreOwnerKey([BLjava/lang/String;[B)I
    .locals 12
    .param p1, "ivPlusEncryptedOwnerKey"    # [B
    .param p2, "swid"    # Ljava/lang/String;
    .param p3, "ownerKeyHash"    # [B

    .prologue
    .line 2796
    array-length v8, p1

    const/16 v9, 0x30

    if-eq v8, v9, :cond_0

    .line 2798
    iget-object v8, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v10, "Error: the encrypted owner key is too small. Should be 48 bytes in size"

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2800
    const/4 v8, -0x1

    .line 2864
    :goto_0
    return v8

    .line 2803
    :cond_0
    array-length v8, p3

    const/16 v9, 0x14

    if-eq v8, v9, :cond_1

    .line 2805
    iget-object v8, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v10, "Error: the owner key hash is wrong size."

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2807
    const/4 v8, -0x2

    goto :goto_0

    .line 2810
    :cond_1
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    move-result-object v5

    .line 2812
    .local v5, "keyStore":Lcom/disney/emagine/sdk/keystore/EMTKeyStore;
    iget-object v8, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "swid              = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2814
    invoke-virtual {v5, p2}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->setSwid(Ljava/lang/String;)Z

    .line 2816
    iget-object v8, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "ownerKeyHash      = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {p3}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2818
    const/4 v8, 0x0

    const/16 v9, 0x10

    invoke-static {p1, v8, v9}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v4

    .line 2820
    .local v4, "iv":[B
    iget-object v8, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "iv                = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v4}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2822
    invoke-virtual {v5}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->generateAppKey()[B

    move-result-object v0

    .line 2824
    .local v0, "appKey":[B
    iget-object v8, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "appKey            = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2826
    const/16 v8, 0x10

    const/16 v9, 0x30

    invoke-static {p1, v8, v9}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v3

    .line 2828
    .local v3, "encryptedOwnerKey":[B
    iget-object v8, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "encryptedOwnerKey = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2830
    invoke-static {v3, v4, v0}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->aesCBCDecrypt([B[B[B)[B

    move-result-object v1

    .line 2832
    .local v1, "decryptedOwnerKey":[B
    if-nez v1, :cond_2

    .line 2834
    iget-object v8, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v10, "Error: unable to decrypt the owner key"

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2835
    const/4 v8, -0x3

    goto/16 :goto_0

    .line 2838
    :cond_2
    iget-object v8, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "ownerKey          = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2840
    const/4 v6, 0x0

    .line 2841
    .local v6, "md":Ljava/security/MessageDigest;
    const/4 v7, 0x0

    .line 2845
    .local v7, "mdBytes":[B
    :try_start_0
    const-string v8, "SHA1"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v6

    .line 2847
    invoke-virtual {v6, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 2849
    invoke-virtual {v6}, Ljava/security/MessageDigest;->digest()[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 2856
    :goto_1
    if-eqz v7, :cond_3

    const/16 v8, 0x14

    invoke-static {v7, p3, v8}, Lcom/disney/emagine/sdk/EMTData;->isEqual([B[BI)Z

    move-result v8

    if-nez v8, :cond_4

    .line 2858
    :cond_3
    iget-object v8, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v10, "Error: the calculated key hash does not match expected key hash"

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2859
    const/4 v8, -0x4

    goto/16 :goto_0

    .line 2851
    :catch_0
    move-exception v2

    .line 2853
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v2}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_1

    .line 2862
    .end local v2    # "e":Ljava/security/NoSuchAlgorithmException;
    :cond_4
    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->setOwnerKey(Ljava/lang/String;)Z

    .line 2864
    const/4 v8, 0x0

    goto/16 :goto_0
.end method

.method public deletePackageForDevice(Ljava/lang/String;II)V
    .locals 0
    .param p1, "packageId"    # Ljava/lang/String;
    .param p2, "deviceId"    # I
    .param p3, "version"    # I

    .prologue
    .line 964
    invoke-virtual {p0, p1, p2, p3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packageDeleteForDevice(Ljava/lang/String;II)V

    .line 965
    return-void
.end method

.method public deviceConnect(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 5
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 1512
    invoke-static {}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v2

    const-string v3, "Connect"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 1513
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v0

    .line 1514
    .local v0, "controller":Lcom/disney/emagine/sdk/ble/EMTController;
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->stopScanning()V

    .line 1516
    if-eqz p1, :cond_1

    .line 1520
    :try_start_0
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->isConnected()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1521
    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/ble/EMTController;->openDevice(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    .line 1522
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->connect()V

    .line 1526
    :cond_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iput-object p1, v2, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1532
    :cond_1
    return-void

    .line 1527
    :catch_0
    move-exception v1

    .line 1528
    .local v1, "ex":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public deviceDidBecomeAvailable(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 14
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 1457
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "deviceDidBecomeAvailable device %d (type %d, flags %d)"

    new-array v7, v13, [Ljava/lang/Object;

    iget-wide v8, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v10

    iget v8, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceType:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v11

    iget-byte v8, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceFlags:B

    invoke-static {v8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v8

    aput-object v8, v7, v12

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1460
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->reconnectDeviceId:Ljava/lang/Integer;

    if-eqz v3, :cond_1

    iget-wide v4, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->reconnectDeviceId:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->longValue()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-nez v3, :cond_1

    .line 1461
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "Attempt to reconnect device %d (type %d, flags %d)"

    new-array v7, v13, [Ljava/lang/Object;

    iget-wide v8, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v10

    iget v8, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceType:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v11

    iget-byte v8, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceFlags:B

    invoke-static {v8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v8

    aput-object v8, v7, v12

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1462
    iget-wide v4, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    long-to-int v3, v4

    invoke-virtual {p0, v3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->connect(I)Z

    .line 1463
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->reconnectDeviceId:Ljava/lang/Integer;

    .line 1479
    :cond_0
    :goto_0
    return-void

    .line 1467
    :cond_1
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->createEMTDictionaryUsing(Lcom/disney/emagine/sdk/ble/EMTDevice;)Ljava/util/HashMap;

    move-result-object v1

    .line 1468
    .local v1, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {v1}, Lcom/disney/emagine/sdk/json/EMTJson;->bytesFromJavaObject(Ljava/lang/Object;)[B

    move-result-object v0

    .line 1470
    .local v0, "data":[B
    if-eqz v0, :cond_0

    .line 1472
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTFileManager;->utf8StringFromBytes([B)Ljava/lang/String;

    move-result-object v2

    .line 1474
    .local v2, "jsonString":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 1476
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto :goto_0
.end method

.method public deviceDidDisconnectWithError(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 3
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "error"    # Lcom/disney/emagine/sdk/apple/NSError;

    .prologue
    .line 3615
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EMTPortalLibrary"

    const-string v2, "deviceDidDisconnectWithError"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 3617
    return-void
.end method

.method public deviceDidExperienceProtocolError(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 8
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "error"    # Lcom/disney/emagine/sdk/apple/NSError;

    .prologue
    .line 1605
    const/4 v0, 0x0

    .line 1607
    .local v0, "title":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v1

    if-ne p1, v1, :cond_0

    .line 1609
    invoke-virtual {p2}, Lcom/disney/emagine/sdk/apple/NSError;->domain()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.disney.eMagine"

    if-ne v1, v2, :cond_1

    .line 1611
    const-string v0, "eMagine Error"

    .line 1619
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%s: %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v6, 0x1

    invoke-virtual {p2}, Lcom/disney/emagine/sdk/apple/NSError;->description()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1620
    return-void

    .line 1615
    :cond_1
    const-string v0, "Core Bluetooth Error"

    goto :goto_0
.end method

.method public deviceDidFailToConnectWithError(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 3
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "error"    # Lcom/disney/emagine/sdk/apple/NSError;

    .prologue
    .line 3609
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EMTPortalLibrary"

    const-string v2, "deviceDidFailToConnectWithError"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 3611
    return-void
.end method

.method public deviceDidLeave(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 5
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 1488
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->createEMTDictionaryUsing(Lcom/disney/emagine/sdk/ble/EMTDevice;)Ljava/util/HashMap;

    move-result-object v1

    .line 1490
    .local v1, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {v1}, Lcom/disney/emagine/sdk/json/EMTJson;->bytesFromJavaObject(Ljava/lang/Object;)[B

    move-result-object v0

    .line 1492
    .local v0, "data":[B
    if-eqz v0, :cond_0

    .line 1494
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToUTF8String([B)Ljava/lang/String;

    move-result-object v2

    .line 1496
    .local v2, "jsonString":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 1498
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v3

    const/16 v4, 0x9

    invoke-virtual {v3, v4, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 1501
    .end local v2    # "jsonString":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public deviceDidReceiveBroadcastEvent(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V
    .locals 20
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "payload"    # [B
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 1630
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v14, "deviceDidReceiveBroadcastEvent() called."

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1631
    if-nez p1, :cond_1

    .line 1633
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v14, "device is null.  Returning."

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1769
    :cond_0
    :goto_0
    return-void

    .line 1636
    :cond_1
    const/4 v12, 0x0

    const/4 v13, 0x4

    move-object/from16 v0, p2

    invoke-static {v0, v12, v13}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v10

    .line 1639
    .local v10, "toAddress":I
    const/4 v12, -0x2

    if-eq v10, v12, :cond_2

    int-to-long v12, v10

    const-wide v14, 0xfffffffdL

    cmp-long v12, v12, v14

    if-nez v12, :cond_0

    .line 1642
    :cond_2
    const/4 v12, 0x4

    const/16 v13, 0x8

    move-object/from16 v0, p2

    invoke-static {v0, v12, v13}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v4

    .line 1643
    .local v4, "deviceID":I
    const/16 v12, 0x8

    const/16 v13, 0xa

    move-object/from16 v0, p2

    invoke-static {v0, v12, v13}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v2

    .line 1645
    .local v2, "commandEvent":S
    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 1649
    :pswitch_0
    const/4 v7, 0x0

    .line 1652
    .local v7, "found":Z
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->drtDeviceList:Ljava/util/ArrayList;

    monitor-enter v13

    .line 1656
    :try_start_0
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->drtDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_3
    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_e

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;

    .line 1658
    .local v5, "drtDevice":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    iget v12, v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->deviceId:I

    if-ne v12, v4, :cond_3

    .line 1661
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    move-wide/from16 v0, v16

    iput-wide v0, v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->lastTimeBeaconReceived:J

    .line 1662
    const/16 v12, 0x10

    const/16 v15, 0x12

    .line 1663
    move-object/from16 v0, p2

    invoke-static {v0, v12, v15}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v12

    .line 1662
    invoke-static {v12}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Short;->shortValue()S

    move-result v12

    iput-short v12, v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->imHereFlags:S

    .line 1665
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v3

    .line 1667
    .local v3, "currentDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    iget-wide v0, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    move-wide/from16 v16, v0

    iget v12, v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->deviceId:I

    int-to-long v0, v12

    move-wide/from16 v18, v0

    cmp-long v12, v16, v18

    if-nez v12, :cond_4

    .line 1669
    iget-short v12, v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->imHereFlags:S

    iput-short v12, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->imHereFlags:S

    .line 1672
    iget-short v12, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->imHereFlags:S

    and-int/lit8 v12, v12, 0x8

    if-lez v12, :cond_5

    iget-boolean v12, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->nonceEstablished:Z

    if-eqz v12, :cond_5

    const/4 v12, 0x1

    :goto_2
    iput-boolean v12, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->fileTransferAllowed:Z

    .line 1674
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 1676
    .local v11, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v12, "device"

    move-object/from16 v0, p1

    invoke-virtual {v11, v12, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1678
    const/4 v6, 0x0

    .line 1680
    .local v6, "error":Lcom/disney/emagine/sdk/apple/NSError;
    iget-short v12, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->imHereFlags:S

    and-int/lit8 v12, v12, 0x4

    if-lez v12, :cond_6

    .line 1682
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v15, "Ready"

    invoke-virtual {v12, v15}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isInState(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 1683
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v15, "Player Data Available"

    invoke-virtual {v12, v15, v11}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    move-result-object v6

    .line 1684
    if-eqz v6, :cond_4

    .line 1686
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v15, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v16, "Already transfering Player Data"

    move-object/from16 v0, v16

    invoke-virtual {v12, v15, v0}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1687
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v15, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "domain: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/apple/NSError;->domain()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v12, v15, v0}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1688
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v15, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "code: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/apple/NSError;->code()I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v12, v15, v0}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1689
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v15, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "description: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/apple/NSError;->description()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v12, v15, v0}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1732
    .end local v6    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    .end local v11    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_4
    :goto_3
    const/4 v7, 0x1

    .line 1733
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v15, "Ready"

    invoke-virtual {v12, v15}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isInState(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 1735
    const-string v15, "{\"device_id\":%d,\"toy_registered\":%d,\"analytics_ready_for_upload\":%d,\"files_ready_for_upload\":%d,\"file_transfer_allowed\":%d}"

    const/4 v12, 0x5

    new-array v0, v12, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/4 v12, 0x0

    .line 1736
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v16, v12

    const/16 v17, 0x1

    iget-short v12, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->imHereFlags:S

    and-int/lit8 v12, v12, 0x1

    if-lez v12, :cond_a

    const/4 v12, 0x1

    .line 1737
    :goto_4
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v16, v17

    const/16 v17, 0x2

    iget-short v12, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->imHereFlags:S

    and-int/lit8 v12, v12, 0x2

    if-lez v12, :cond_b

    const/4 v12, 0x1

    .line 1738
    :goto_5
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v16, v17

    const/16 v17, 0x3

    iget-short v12, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->imHereFlags:S

    and-int/lit8 v12, v12, 0x4

    if-lez v12, :cond_c

    const/4 v12, 0x1

    .line 1739
    :goto_6
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v16, v17

    const/16 v17, 0x4

    iget-short v12, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->imHereFlags:S

    and-int/lit8 v12, v12, 0x8

    if-lez v12, :cond_d

    const/4 v12, 0x1

    .line 1740
    :goto_7
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v16, v17

    .line 1735
    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 1741
    .local v8, "jsonString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v12

    const/16 v15, 0x11

    invoke-virtual {v12, v15, v8}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_1

    .line 1760
    .end local v3    # "currentDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .end local v5    # "drtDevice":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    .end local v8    # "jsonString":Ljava/lang/String;
    :catchall_0
    move-exception v12

    monitor-exit v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v12

    .line 1672
    .restart local v3    # "currentDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .restart local v5    # "drtDevice":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    :cond_5
    const/4 v12, 0x0

    goto/16 :goto_2

    .line 1694
    .restart local v6    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    .restart local v11    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_6
    :try_start_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v15, "Player Data"

    invoke-virtual {v12, v15}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isInState(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 1696
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v15, "Player Data Done"

    invoke-virtual {v12, v15, v11}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    move-result-object v6

    .line 1698
    if-eqz v6, :cond_4

    .line 1700
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v15, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v16, "Stuck in Player Data state with no files to transfer"

    move-object/from16 v0, v16

    invoke-virtual {v12, v15, v0}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 1703
    :cond_7
    iget-short v12, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->imHereFlags:S

    and-int/lit8 v12, v12, 0x2

    if-lez v12, :cond_9

    .line 1705
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v15, "Ready"

    invoke-virtual {v12, v15}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isInState(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_8

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v15, "Analytics"

    invoke-virtual {v12, v15}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isInState(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 1707
    :cond_8
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v15, "Analytics Available"

    invoke-virtual {v12, v15, v11}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    move-result-object v6

    .line 1709
    if-eqz v6, :cond_4

    .line 1711
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v15, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v16, "Already transferring Analytics"

    move-object/from16 v0, v16

    invoke-virtual {v12, v15, v0}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 1715
    :cond_9
    iget-short v12, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->imHereFlags:S

    and-int/lit8 v12, v12, 0x2

    if-nez v12, :cond_4

    .line 1717
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v15, "Analytics"

    invoke-virtual {v12, v15}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isInState(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 1719
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v15, "Analytics Done"

    invoke-virtual {v12, v15, v11}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    move-result-object v6

    .line 1721
    if-nez v6, :cond_4

    .line 1723
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v15, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v16, "Analytics Upload Done!"

    move-object/from16 v0, v16

    invoke-virtual {v12, v15, v0}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 1736
    .end local v6    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    .end local v11    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_a
    const/4 v12, 0x0

    goto/16 :goto_4

    .line 1737
    :cond_b
    const/4 v12, 0x0

    goto/16 :goto_5

    .line 1738
    :cond_c
    const/4 v12, 0x0

    goto/16 :goto_6

    .line 1739
    :cond_d
    const/4 v12, 0x0

    goto/16 :goto_7

    .line 1746
    .end local v3    # "currentDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .end local v5    # "drtDevice":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    :cond_e
    if-nez v7, :cond_f

    .line 1748
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "Im here payload: [%s]"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1750
    new-instance v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;

    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V

    .line 1752
    .local v9, "newDevice":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    const/16 v12, 0xc

    const/16 v14, 0x10

    move-object/from16 v0, p2

    invoke-static {v0, v12, v14}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v12

    iput v12, v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->deviceType:I

    .line 1753
    const/16 v12, 0x10

    const/16 v14, 0x12

    move-object/from16 v0, p2

    invoke-static {v0, v12, v14}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v12

    iput-short v12, v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->imHereFlags:S

    .line 1754
    const/16 v12, 0x14

    const/16 v14, 0x16

    move-object/from16 v0, p2

    invoke-static {v0, v12, v14}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v12

    iput-short v12, v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->deviceHSwid:S

    .line 1755
    iput v4, v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->deviceId:I

    .line 1756
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    iput-wide v14, v9, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->lastTimeBeaconReceived:J

    .line 1758
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->drtDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v12, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1760
    .end local v9    # "newDevice":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    :cond_f
    monitor-exit v13
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 1645
    :pswitch_data_0
    .packed-switch 0x138b
        :pswitch_0
    .end packed-switch
.end method

.method public deviceDidReceiveComplexPayload(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V
    .locals 10
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "payload"    # [B

    .prologue
    const/4 v9, 0x4

    .line 1830
    const/4 v7, 0x0

    invoke-static {p2, v7, v9}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v7

    invoke-static {v7}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v7

    invoke-static {v7}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v6

    .line 1831
    .local v6, "src_device_id":I
    const/4 v7, 0x6

    invoke-static {p2, v9, v7}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v7

    invoke-static {v7}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v7

    invoke-static {v7}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v2

    .line 1832
    .local v2, "event":S
    const/16 v7, 0x8

    array-length v8, p2

    invoke-static {p2, v7, v8}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v0

    .line 1833
    .local v0, "data":[B
    new-instance v5, Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-direct {v5}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;-><init>()V

    .line 1834
    .local v5, "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    const/4 v4, 0x0

    .line 1836
    .local v4, "pmpObj":Ljava/lang/Object;
    invoke-virtual {v5, v0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeWithData([B)Ljava/lang/Object;

    move-result-object v4

    .line 1838
    if-eqz v2, :cond_0

    if-lez v6, :cond_0

    if-eqz v4, :cond_0

    .line 1840
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1842
    .local v1, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v7, "from"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1843
    const-string v7, "event"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1844
    const-string v7, "payload"

    invoke-virtual {v1, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1847
    invoke-virtual {p0, v2, v6, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->handleDRTCommand(SILjava/util/HashMap;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1856
    .end local v1    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    :goto_0
    return-void

    .line 1852
    .restart local v1    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    invoke-static {v1}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1854
    .local v3, "json":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v7

    invoke-virtual {v7, v9, v3}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto :goto_0
.end method

.method public deviceDidReceiveSimplePayload(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V
    .locals 13
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "payload"    # [B

    .prologue
    const/4 v8, 0x6

    const/4 v7, 0x4

    const/4 v9, 0x2

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 1778
    invoke-static {p2, v11, v7}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v6

    invoke-static {v6}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v6

    invoke-static {v6}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v2

    .line 1779
    .local v2, "src_device_id":I
    invoke-static {p2, v7, v8}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v6

    invoke-static {v6}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v6

    invoke-static {v6}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v1

    .line 1780
    .local v1, "event":S
    const/4 v6, 0x7

    invoke-static {p2, v8, v6}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v6

    aget-byte v3, v6, v11

    .line 1781
    .local v3, "verWords":B
    and-int/lit16 v6, v3, 0xf0

    shr-int/lit8 v6, v6, 0x4

    and-int/lit8 v6, v6, 0x3

    int-to-byte v5, v6

    .line 1782
    .local v5, "words":B
    and-int/lit8 v6, v3, 0xf

    int-to-byte v4, v6

    .line 1784
    .local v4, "version":B
    if-eqz v4, :cond_0

    .line 1786
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "Trying to deserialize non-simple message as simple"

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1789
    :cond_0
    const/4 v0, 0x0

    .line 1791
    .local v0, "data":[B
    if-eqz v5, :cond_1

    if-eqz p2, :cond_1

    .line 1793
    const/16 v6, 0x8

    mul-int/lit8 v7, v5, 0x4

    invoke-static {p2, v6, v7}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v0

    .line 1808
    :cond_1
    invoke-virtual {p0, v1, v2, v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->handleDRTCommandWithSimpleData(SI[B)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1821
    :goto_0
    return-void

    .line 1813
    :cond_2
    if-eqz v0, :cond_3

    .line 1815
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "Unhandled simple command: [%d], withData: [%s]"

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1819
    :cond_3
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "Unhandled simple command: [%d], withData: [%s]"

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v10

    aput-object v10, v9, v11

    const-string v10, "<null>"

    aput-object v10, v9, v12

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public deviceIsReadyForApplication(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 6
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 1581
    if-nez p1, :cond_1

    .line 1596
    :cond_0
    :goto_0
    return-void

    .line 1584
    :cond_1
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "The Device is now ready for use by application."

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1586
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1588
    .local v1, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "device_id"

    iget-wide v4, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    long-to-int v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1590
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v3, "Device Ready"

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    move-result-object v0

    .line 1592
    .local v0, "error":Lcom/disney/emagine/sdk/apple/NSError;
    if-eqz v0, :cond_0

    .line 1594
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "Error: Device Ready Event not expected"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public deviceRequestedFileTransfer(Lcom/disney/emagine/sdk/ble/EMTDevice;Ljava/lang/String;)V
    .locals 4
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    .line 1985
    const/4 v0, 0x1

    new-instance v1, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;

    iget-wide v2, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    long-to-int v2, v2

    invoke-direct {v1, p0, p2, v2}, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;Ljava/lang/String;I)V

    invoke-virtual {p1, v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->acceptFile(ZLcom/disney/emagine/sdk/delegate/EMTAcceptCompletionDelegate;)V

    .line 1986
    return-void
.end method

.method public didConnectDevice(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 8
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 1541
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "didConnectDevice device %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-wide v6, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1542
    return-void
.end method

.method public disconnect(I)V
    .locals 7
    .param p1, "deviceId"    # I

    .prologue
    .line 398
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "disconnect called with deviceId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    const/4 v1, 0x0

    .line 400
    .local v1, "currentDeviceId":I
    if-nez p1, :cond_2

    .line 402
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 403
    .local v0, "currentDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_1

    .line 405
    iget-wide v4, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    long-to-int v1, v4

    .line 406
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v5, "currentDeviceID != null"

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    .end local v0    # "currentDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    :goto_0
    const/4 v2, 0x0

    .line 414
    .local v2, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v1, :cond_0

    .line 416
    new-instance v2, Ljava/util/HashMap;

    .end local v2    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 417
    .restart local v2    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "device_id"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "userInfo = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 421
    :cond_0
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v4, "Disconnect"

    invoke-virtual {v3, v4, v2}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 422
    return-void

    .line 408
    .end local v2    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v0    # "currentDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    :cond_1
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v5, "currentDeviceID == null"

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 411
    .end local v0    # "currentDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    :cond_2
    move v1, p1

    goto :goto_0
.end method

.method public downloadContent(Ljava/lang/String;I)V
    .locals 7
    .param p1, "contentId"    # Ljava/lang/String;
    .param p2, "deviceId"    # I

    .prologue
    .line 647
    if-nez p1, :cond_1

    .line 649
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v5, "Error: contentId parameter is null"

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 680
    :cond_0
    :goto_0
    return-void

    .line 654
    :cond_1
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTFileManager;->utf8StringFromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 656
    .local v0, "contentIdString":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 661
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->manifestFromPackageId(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v2

    .line 663
    .local v2, "manifestItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v2, :cond_0

    .line 668
    const-string v3, "device_id"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 670
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v4, "Send Mission"

    invoke-virtual {v3, v4, v2}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireOrQueueEvent(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    move-result-object v1

    .line 672
    .local v1, "error":Lcom/disney/emagine/sdk/apple/NSError;
    if-nez v1, :cond_2

    .line 674
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "success transitioning on Send Mission event for manifestItem: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 678
    :cond_2
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v5, "Cannot begin transferring mission. Player data upload probably in progress."

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public enterKeyMask(Ljava/lang/String;I)V
    .locals 15
    .param p1, "keyedInputAsAscii"    # Ljava/lang/String;
    .param p2, "deviceId"    # I

    .prologue
    .line 1196
    const/4 v9, 0x2

    new-array v7, v9, [B

    .line 1197
    .local v7, "maskWord":[B
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 1199
    .local v8, "valueAsInt":I
    const/4 v9, 0x1

    shr-int/lit8 v10, v8, 0x8

    and-int/lit16 v10, v10, 0xff

    int-to-byte v10, v10

    aput-byte v10, v7, v9

    .line 1200
    const/4 v9, 0x0

    and-int/lit16 v10, v8, 0xff

    int-to-byte v10, v10

    aput-byte v10, v7, v9

    .line 1202
    const/4 v9, 0x0

    new-array v9, v9, [B

    iput-object v9, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sessionKey:[B

    .line 1204
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v9, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->maskedKey:[B

    array-length v9, v9

    if-ge v3, v9, :cond_0

    .line 1206
    rem-int/lit8 v9, v3, 0x2

    aget-byte v6, v7, v9

    .line 1207
    .local v6, "maskByte":B
    iget-object v9, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->maskedKey:[B

    aget-byte v9, v9, v3

    xor-int/2addr v9, v6

    int-to-byte v5, v9

    .line 1209
    .local v5, "keyByte":B
    iget-object v9, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sessionKey:[B

    const/4 v10, 0x1

    new-array v10, v10, [B

    const/4 v11, 0x0

    aput-byte v5, v10, v11

    invoke-static {v9, v10}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v9

    iput-object v9, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sessionKey:[B

    .line 1211
    iget-object v9, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v10, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v11, "maskByte: [%02x] keyByte: [%02x] = outputByte: [%02x]"

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static {v6}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    iget-object v14, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->maskedKey:[B

    aget-byte v14, v14, v3

    invoke-static {v14}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x2

    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1204
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1222
    .end local v5    # "keyByte":B
    .end local v6    # "maskByte":B
    :cond_0
    iget-object v9, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sessionKey:[B

    invoke-static {v9}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    .line 1229
    .local v2, "hexSessionKey":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTUserDefaults;->sharedInstance()Lcom/disney/emagine/sdk/EMTUserDefaults;

    move-result-object v9

    const-string v10, "sessionKey"

    invoke-virtual {v9, v2, v10}, Lcom/disney/emagine/sdk/EMTUserDefaults;->setStringForKey(Ljava/lang/String;Ljava/lang/String;)V

    .line 1232
    const-string v9, "[\"%s\"]"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v2, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 1234
    .local v4, "jsonString":Ljava/lang/String;
    iget-object v9, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v10, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "json: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1236
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    move-result-object v9

    iget-object v10, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sessionKey:[B

    const/4 v11, 0x3

    invoke-virtual {v9, v10, v11}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->setKeyForSlot([BB)V

    .line 1238
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v1

    .line 1239
    .local v1, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v1, :cond_1

    .line 1240
    const/16 v9, 0x158d

    const/4 v10, 0x3

    move/from16 v0, p2

    invoke-virtual {v1, v9, v0, v4, v10}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;B)V

    .line 1242
    :cond_1
    const/4 v9, 0x1

    invoke-virtual {p0, v9}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->startKeycodeTimer(I)V

    .line 1244
    iget-object v9, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v10, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "json: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1245
    return-void
.end method

.method public fetchOwnerKey()V
    .locals 1

    .prologue
    .line 2903
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->portalLibrary()Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->GetOwnerKey()V

    .line 2904
    return-void
.end method

.method public getAvailableDevices()V
    .locals 4

    .prologue
    .line 568
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/ble/EMTController;->knownDevices()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 570
    .local v0, "bleDeviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/emagine/sdk/ble/EMTDevice;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disney/emagine/sdk/ble/EMTDevice;

    .line 572
    .local v1, "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    invoke-virtual {p0, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deviceDidBecomeAvailable(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    goto :goto_0

    .line 574
    .end local v1    # "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    :cond_0
    return-void
.end method

.method public getContentEntitlements(I)V
    .locals 8
    .param p1, "deviceId"    # I

    .prologue
    const/4 v7, 0x0

    .line 3492
    const-string v3, "https://%s/runtimeorchestrator/v1/entitlement/content/%d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v6, v6, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 3493
    .local v2, "url":Ljava/lang/String;
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getContentEntitlements: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3495
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 3497
    .local v1, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 3499
    new-instance v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$10;

    invoke-direct {v0, p0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$10;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;I)V

    .line 3539
    .local v0, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v3, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v3, v7}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v3, v2, v7, v4, v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getFuture(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 3540
    return-void
.end method

.method public getContentList(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 936
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->getDRTDeviceFromDeviceId(I)Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;

    move-result-object v0

    .line 938
    .local v0, "device":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    if-nez v0, :cond_0

    .line 940
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v3, "ERROR: getContentList requires a device to be connected"

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 945
    :goto_0
    return-void

    .line 944
    :cond_0
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sharedInstance()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v1

    iget v2, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->deviceType:I

    int-to-short v2, v2

    new-instance v3, Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;

    invoke-direct {v3, p0}, Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V

    invoke-virtual {v1, p1, v2, v3}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->getEntitlements(ISLcom/disney/emagine/sdk/completion/EMTManifestSuccess;)V

    goto :goto_0
.end method

.method public getContentOnToy(I)V
    .locals 0
    .param p1, "deviceId"    # I

    .prologue
    .line 3487
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packageQuery(I)V

    .line 3488
    return-void
.end method

.method public getCurrentSystemTimestamp()Ljava/lang/String;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SimpleDateFormat"
        }
    .end annotation

    .prologue
    .line 504
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd hh:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 506
    .local v0, "formatter":Ljava/text/SimpleDateFormat;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getDRTDeviceFromDeviceId(I)Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    .locals 3
    .param p1, "deviceId"    # I

    .prologue
    .line 835
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->drtDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;

    .line 837
    .local v0, "device":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    iget v2, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->deviceId:I

    if-ne v2, p1, :cond_0

    .line 843
    .end local v0    # "device":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDeviceContentList(I)V
    .locals 0
    .param p1, "deviceId"    # I

    .prologue
    .line 954
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packageQuery(I)V

    .line 955
    return-void
.end method

.method public getManifestMetadata(Ljava/lang/String;I)V
    .locals 2
    .param p1, "experienceId"    # Ljava/lang/String;
    .param p2, "deviceId"    # I

    .prologue
    .line 2874
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    new-instance v1, Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;

    invoke-direct {v1, p2}, Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;-><init>(I)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->getContentMetadata(Ljava/lang/String;ILcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;)V

    .line 2875
    return-void
.end method

.method public getVerifyTokenForDeviceId(ILjava/lang/String;)V
    .locals 10
    .param p1, "deviceId"    # I
    .param p2, "ownerId"    # Ljava/lang/String;

    .prologue
    .line 765
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->getDRTDeviceFromDeviceId(I)Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;

    move-result-object v1

    .line 768
    .local v1, "device":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    invoke-virtual {p0, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->isDeviceRegistered(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 770
    iget-object v7, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v8, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v9, "Error: Device is already registered"

    invoke-virtual {v7, v8, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 772
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 774
    .local v0, "appEvent":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v7, "event"

    const/16 v8, 0x54

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 775
    const-string v7, "device_id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 777
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/disney/emagine/sdk/EMTData;->stringToUTF8String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 779
    .local v4, "jsonString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v7

    const/16 v8, 0xd

    invoke-virtual {v7, v8, v4}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 797
    .end local v0    # "appEvent":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "jsonString":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 784
    :cond_1
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 786
    .local v6, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v7, "Register Start"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 788
    iget-object v7, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v8, "Register Start"

    invoke-virtual {v7, v8, v6}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireOrQueueEvent(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    move-result-object v3

    .line 790
    .local v3, "error":Lcom/disney/emagine/sdk/apple/NSError;
    if-nez v3, :cond_0

    .line 792
    invoke-static {p2}, Lcom/disney/emagine/sdk/EMTFileManager;->utf8StringFromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 793
    .local v5, "ownerString":Ljava/lang/String;
    iget v7, v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->deviceType:I

    int-to-short v2, v7

    .line 795
    .local v2, "deviceType":S
    iget-object v7, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    new-instance v8, Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;

    invoke-direct {v8, p0, p1}, Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;I)V

    invoke-virtual {v7, v5, p1, v2, v8}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->getRegisterUserTokenWithOwnerId(Ljava/lang/String;ISLcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;)V

    goto :goto_0
.end method

.method public handleAnalyticsFile(Ljava/lang/String;J[B)V
    .locals 8
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "deviceId"    # J
    .param p4, "data"    # [B

    .prologue
    .line 1123
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/app/EmagineApplication;->analyticsHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;

    move-object v2, p0

    move-object v3, p4

    move-wide v4, p2

    move-object v6, p1

    invoke-direct/range {v1 .. v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$3;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;[BJLjava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1166
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v1, "Analytics Done"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 1167
    return-void
.end method

.method public handleDRTCommand(SILjava/util/HashMap;)Z
    .locals 54
    .param p1, "command"    # S
    .param p2, "deviceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(SI",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 2125
    .local p3, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/16 v47, 0x1

    .line 2127
    .local v47, "wasHandled":Z
    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    const-string v49, "{\"event\": "

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v49

    const-string v48, "event"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Ljava/lang/Integer;

    invoke-virtual/range {v48 .. v48}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v48

    move-object/from16 v0, v49

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    const-string v49, ",\"from\": "

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    const-string v49, "from"

    .line 2128
    move-object/from16 v0, p3

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v49

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v48

    const-string v49, "}"

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v39

    .line 2129
    .local v39, "simpleJson":Ljava/lang/String;
    sparse-switch p1, :sswitch_data_0

    .line 2505
    const/16 v47, 0x0

    .line 2511
    :cond_0
    :goto_0
    return v47

    .line 2133
    :sswitch_0
    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    const-string v49, "{\"event\": 2,\"from\": "

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    const-string v49, "from"

    .line 2134
    move-object/from16 v0, p3

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v49

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v48

    const-string v49, "}"

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    .line 2136
    .local v28, "jsonString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0xd

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 2138
    const-string v48, "payload"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Ljava/util/ArrayList;

    .line 2139
    .local v33, "payload":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    const/16 v48, 0x1

    move-object/from16 v0, v33

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, [B

    move-object/from16 v21, v48

    check-cast v21, [B

    .line 2141
    .local v21, "hashData":[B
    const/16 v48, 0x0

    const/16 v49, 0x4

    move-object/from16 v0, v21

    move/from16 v1, v48

    move/from16 v2, v49

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v48

    invoke-static/range {v48 .. v48}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v48

    invoke-static/range {v48 .. v48}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v40

    .line 2143
    .local v40, "size":I
    new-instance v49, Lcom/disney/emagine/sdk/apple/NSAssert;

    const/16 v48, 0x30

    move/from16 v0, v40

    move/from16 v1, v48

    if-ne v0, v1, :cond_1

    const/16 v48, 0x1

    :goto_1
    const-string v50, "Size should be equal to IV + AES KEY Length + AES_PADDING = 48"

    move-object/from16 v0, v49

    move/from16 v1, v48

    move-object/from16 v2, v50

    invoke-direct {v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSAssert;-><init>(ZLjava/lang/String;)V

    .line 2145
    const/16 v48, 0x4

    add-int/lit8 v49, v40, 0x4

    move-object/from16 v0, v21

    move/from16 v1, v48

    move/from16 v2, v49

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v22

    .line 2146
    .local v22, "hashData2":[B
    invoke-static/range {v22 .. v22}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v23

    .line 2148
    .local v23, "hashString":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string v51, "hashString = "

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    move-object/from16 v0, v50

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2150
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-object/from16 v48, v0

    new-instance v49, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;

    move-object/from16 v0, v49

    move-object/from16 v1, p0

    move/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;I)V

    move-object/from16 v0, v48

    move-object/from16 v1, v23

    move/from16 v2, p2

    move-object/from16 v3, v49

    invoke-virtual {v0, v1, v2, v3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->sendRegisterHashToken(Ljava/lang/String;ILcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;)V

    goto/16 :goto_0

    .line 2143
    .end local v22    # "hashData2":[B
    .end local v23    # "hashString":Ljava/lang/String;
    :cond_1
    const/16 v48, 0x0

    goto :goto_1

    .line 2157
    .end local v21    # "hashData":[B
    .end local v28    # "jsonString":Ljava/lang/String;
    .end local v33    # "payload":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    .end local v40    # "size":I
    :sswitch_1
    invoke-static/range {p3 .. p3}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v24

    .line 2159
    .local v24, "json":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string v51, "Delete package with response = "

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    const-string v51, "payload"

    move-object/from16 v0, p3

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v51

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2161
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0x10

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2168
    .end local v24    # "json":Ljava/lang/String;
    :sswitch_2
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->getCurrentSystemTimestamp()Ljava/lang/String;

    move-result-object v45

    .line 2169
    .local v45, "timestamp":Ljava/lang/String;
    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    const-string v49, "[\""

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    move-object/from16 v0, v48

    move-object/from16 v1, v45

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    const-string v49, "\"]"

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    .line 2170
    .local v26, "jsonObject":Ljava/lang/String;
    invoke-static/range {v26 .. v26}, Lcom/disney/emagine/sdk/EMTFileManager;->utf8StringFromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    .line 2172
    .restart local v28    # "jsonString":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v13

    .line 2173
    .local v13, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v13, :cond_0

    .line 2174
    const/16 v48, 0x1f4a

    move/from16 v0, v48

    move/from16 v1, p2

    move-object/from16 v2, v28

    invoke-virtual {v13, v0, v1, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    goto/16 :goto_0

    .line 2181
    .end local v13    # "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .end local v26    # "jsonObject":Ljava/lang/String;
    .end local v28    # "jsonString":Ljava/lang/String;
    .end local v45    # "timestamp":Ljava/lang/String;
    :sswitch_3
    const-string v48, "payload"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v36

    check-cast v36, Ljava/util/HashMap;

    .line 2183
    .local v36, "response":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->cachePackagesPresent(Ljava/util/HashMap;)V

    .line 2185
    invoke-static/range {p3 .. p3}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v24

    .line 2186
    .restart local v24    # "json":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0xf

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2193
    .end local v24    # "json":Ljava/lang/String;
    .end local v36    # "response":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :sswitch_4
    const-string v48, "payload"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Ljava/util/ArrayList;

    .line 2194
    .local v35, "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string v48, "from"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v42

    check-cast v42, Ljava/lang/Number;

    .line 2195
    .local v42, "src_device_id":Ljava/lang/Number;
    const/16 v48, 0x0

    move-object/from16 v0, v35

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Ljava/lang/Number;

    .line 2197
    .local v41, "spaceAvailable":Ljava/lang/Number;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string v51, "Remaining Space = "

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v41 .. v41}, Ljava/lang/Number;->longValue()J

    move-result-wide v52

    move-object/from16 v0, v50

    move-wide/from16 v1, v52

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v50

    const-string v51, " bytes"

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2199
    new-instance v25, Ljava/util/HashMap;

    invoke-direct/range {v25 .. v25}, Ljava/util/HashMap;-><init>()V

    .line 2201
    .local v25, "jsonDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v48, "from"

    move-object/from16 v0, v25

    move-object/from16 v1, v48

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2202
    const-string v48, "space_available"

    move-object/from16 v0, v25

    move-object/from16 v1, v48

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2204
    invoke-static/range {v25 .. v25}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v28

    .line 2206
    .restart local v28    # "jsonString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0xe

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2213
    .end local v25    # "jsonDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v28    # "jsonString":Ljava/lang/String;
    .end local v35    # "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v41    # "spaceAvailable":Ljava/lang/Number;
    .end local v42    # "src_device_id":Ljava/lang/Number;
    :sswitch_5
    const-string v48, "payload"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Ljava/util/ArrayList;

    .line 2214
    .restart local v35    # "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string v48, "from"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Ljava/lang/Integer;

    invoke-virtual/range {v48 .. v48}, Ljava/lang/Integer;->intValue()I

    move-result v42

    .line 2216
    .local v42, "src_device_id":I
    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v48

    const/16 v49, 0x3

    move/from16 v0, v48

    move/from16 v1, v49

    if-eq v0, v1, :cond_2

    .line 2218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "Error: the payload count from PACKAGE_TRANSFER_ACCEPT is the wrong size"

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2223
    :cond_2
    const/16 v48, 0x0

    move-object/from16 v0, v35

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/String;

    .line 2224
    .local v29, "packageName":Ljava/lang/String;
    const/16 v48, 0x1

    move-object/from16 v0, v35

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Ljava/lang/Integer;

    invoke-virtual/range {v48 .. v48}, Ljava/lang/Integer;->intValue()I

    move-result v46

    .line 2225
    .local v46, "version":I
    const/16 v48, 0x2

    move-object/from16 v0, v35

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Ljava/lang/Integer;

    invoke-virtual/range {v48 .. v48}, Ljava/lang/Integer;->intValue()I

    move-result v48

    if-eqz v48, :cond_3

    const/16 v44, 0x1

    .line 2227
    .local v44, "success":Z
    :goto_2
    if-eqz v44, :cond_4

    .line 2229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "<----- PACKAGE_TRANSFER_ACCEPT(SUCCESS) Package(%s, %d)"

    const/16 v51, 0x2

    move/from16 v0, v51

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v51, v0

    const/16 v52, 0x0

    aput-object v29, v51, v52

    const/16 v52, 0x1

    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v53

    aput-object v53, v51, v52

    invoke-static/range {v50 .. v51}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2231
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->transferContent(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 2225
    .end local v44    # "success":Z
    :cond_3
    const/16 v44, 0x0

    goto :goto_2

    .line 2235
    .restart local v44    # "success":Z
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "<----- PACKAGE_TRANSFER_ACCEPT(FAILED)"

    const/16 v51, 0x0

    move/from16 v0, v51

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v51, v0

    invoke-static/range {v50 .. v51}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-object/from16 v48, v0

    const-string v49, "Send Mission Done"

    const/16 v50, 0x0

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    goto/16 :goto_0

    .line 2245
    .end local v29    # "packageName":Ljava/lang/String;
    .end local v35    # "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v42    # "src_device_id":I
    .end local v44    # "success":Z
    .end local v46    # "version":I
    :sswitch_6
    const/4 v9, 0x0

    .line 2246
    .local v9, "SUCCESS":I
    const/4 v4, 0x1

    .line 2247
    .local v4, "MANIFEST_FAILURE":I
    const/4 v10, 0x2

    .line 2248
    .local v10, "VALIDATION_FAILURE":I
    const/4 v6, 0x3

    .line 2250
    .local v6, "PREINSTALL_FAILURE":I
    const-string v48, "payload"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Ljava/util/ArrayList;

    .line 2251
    .restart local v35    # "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string v48, "from"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Ljava/lang/Number;

    invoke-virtual/range {v48 .. v48}, Ljava/lang/Number;->intValue()I

    move-result v42

    .line 2253
    .restart local v42    # "src_device_id":I
    invoke-virtual/range {v35 .. v35}, Ljava/util/ArrayList;->size()I

    move-result v48

    const/16 v49, 0x3

    move/from16 v0, v48

    move/from16 v1, v49

    if-eq v0, v1, :cond_5

    .line 2255
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "Error: the payload count from PACKAGE_TRANSFER_COMPLETE_RESPONSE is the wrong size"

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2260
    :cond_5
    const/16 v48, 0x0

    move-object/from16 v0, v35

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/String;

    .line 2261
    .restart local v29    # "packageName":Ljava/lang/String;
    const/16 v48, 0x1

    move-object/from16 v0, v35

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Ljava/lang/Number;

    invoke-virtual/range {v48 .. v48}, Ljava/lang/Number;->intValue()I

    move-result v30

    .line 2262
    .local v30, "packageVersion":I
    const/16 v48, 0x2

    move-object/from16 v0, v35

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Ljava/lang/Number;

    invoke-virtual/range {v48 .. v48}, Ljava/lang/Number;->intValue()I

    move-result v43

    .line 2264
    .local v43, "status":I
    packed-switch v43, :pswitch_data_0

    .line 2283
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "Error: Undefined error code for PACKAGE_TRANSFER_RESPONSE"

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2287
    :goto_3
    invoke-static/range {p3 .. p3}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v24

    .line 2289
    .restart local v24    # "json":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0x12

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2267
    .end local v24    # "json":Ljava/lang/String;
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "Success in sending package %s with version %d to device %d"

    const/16 v51, 0x3

    move/from16 v0, v51

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v51, v0

    const/16 v52, 0x0

    aput-object v29, v51, v52

    const/16 v52, 0x1

    invoke-static/range {v30 .. v30}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v53

    aput-object v53, v51, v52

    const/16 v52, 0x2

    invoke-static/range {v42 .. v42}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v53

    aput-object v53, v51, v52

    invoke-static/range {v50 .. v51}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 2271
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string v51, "Error:  MANIFEST_FAILURE for package"

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 2275
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string v51, "Error: VALIDATION_FAILURE for package "

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 2279
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string v51, "Error: PREINSTALL_FAILURE for package "

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 2296
    .end local v4    # "MANIFEST_FAILURE":I
    .end local v6    # "PREINSTALL_FAILURE":I
    .end local v9    # "SUCCESS":I
    .end local v10    # "VALIDATION_FAILURE":I
    .end local v29    # "packageName":Ljava/lang/String;
    .end local v30    # "packageVersion":I
    .end local v35    # "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v42    # "src_device_id":I
    .end local v43    # "status":I
    :sswitch_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "received SYNC_APP_PROMPT"

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2298
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0x13

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2305
    :sswitch_8
    const-string v48, "payload"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, [B

    move-object/from16 v31, v48

    check-cast v31, [B

    .line 2307
    .local v31, "payload":[B
    const/16 v48, 0x4

    const/16 v49, 0x14

    move-object/from16 v0, v31

    move/from16 v1, v48

    move/from16 v2, v49

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v48

    move-object/from16 v0, v48

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->maskedKey:[B

    .line 2316
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0x13

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2323
    .end local v31    # "payload":[B
    :sswitch_9
    const-string v48, "payload"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, [B

    check-cast v48, [B

    const/16 v49, 0x4

    const/16 v50, 0x14

    invoke-static/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v48

    move-object/from16 v0, v48

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sessionKey:[B

    .line 2325
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string v51, "received SYNC_SET_SESSION_KEY:  sessionKey = "

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sessionKey:[B

    move-object/from16 v51, v0

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2327
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0x13

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2334
    :sswitch_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "received SYNC_APP_INITIATE"

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2336
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0x13

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2343
    :sswitch_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "received SYNC_APP_CONFIRM"

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2345
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0x13

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2352
    :sswitch_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "received SYNC_APP_SUCCESS"

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2354
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stopKeycodeTimer()V

    .line 2356
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0x13

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2363
    :sswitch_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "received SYNC_APP_PROMPT_FAIL"

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2365
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0x13

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2372
    :sswitch_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "received SYNC_APP_FAIL"

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2374
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0x13

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2381
    :sswitch_f
    const-string v48, "payload"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Ljava/util/ArrayList;

    .line 2382
    .local v34, "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/16 v48, 0x0

    move-object/from16 v0, v34

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Ljava/lang/Integer;

    invoke-virtual/range {v48 .. v48}, Ljava/lang/Integer;->intValue()I

    move-result v19

    .line 2384
    .local v19, "firmwareVersion":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string v51, "Firmware Version response: "

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {p3 .. p3}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v51

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2385
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "Mola firmwareVersion: %08x"

    const/16 v51, 0x1

    move/from16 v0, v51

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v51, v0

    const/16 v52, 0x0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v53

    aput-object v53, v51, v52

    invoke-static/range {v50 .. v51}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2386
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string v51, "Firmware update, sendHeartbeatOnFWResponse="

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sendHeartbeatOnFWResponse:Z

    move/from16 v51, v0

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2388
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sendHeartbeatOnFWResponse:Z

    move/from16 v48, v0

    if-eqz v48, :cond_0

    .line 2389
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "     ... sending heartbeat"

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2390
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    move/from16 v1, p2

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->sendHeartbeat(II)V

    goto/16 :goto_0

    .line 2398
    .end local v19    # "firmwareVersion":I
    .end local v34    # "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :sswitch_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string v51, "Files to upload: "

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {p3 .. p3}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v51

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2400
    const-string v48, "payload"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v48

    if-eqz v48, :cond_0

    .line 2403
    const-string v48, "payload"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v31

    .line 2404
    .local v31, "payload":Ljava/lang/Object;
    if-eqz v31, :cond_0

    .line 2407
    move-object/from16 v0, v31

    instance-of v0, v0, Ljava/util/ArrayList;

    move/from16 v48, v0

    if-eqz v48, :cond_0

    .line 2411
    :try_start_0
    move-object/from16 v0, v31

    check-cast v0, Ljava/util/ArrayList;

    move-object v11, v0

    .line 2414
    .local v11, "aList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v48

    if-lez v48, :cond_0

    .line 2415
    const/16 v48, 0x0

    move/from16 v0, v48

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 2418
    .local v17, "fileName":Ljava/lang/String;
    if-eqz v17, :cond_0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v48

    const-string v49, ""

    invoke-virtual/range {v48 .. v49}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v48

    if-nez v48, :cond_0

    .line 2420
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string v51, "FILES_TO_UPLOAD: ploading file "

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    move-object/from16 v0, v50

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2422
    const-string v48, "from"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Ljava/lang/Integer;

    invoke-virtual/range {v48 .. v48}, Ljava/lang/Integer;->intValue()I

    move-result v14

    .line 2424
    .local v14, "deviceID":I
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v13

    .line 2425
    .restart local v13    # "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v13, :cond_0

    .line 2427
    invoke-virtual {v13}, Lcom/disney/emagine/sdk/ble/EMTDevice;->okToInitiateTransfer()Z

    move-result v48

    if-eqz v48, :cond_0

    .line 2429
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->isPackagesPresentFile(Ljava/lang/String;)Z

    move-result v48

    if-eqz v48, :cond_6

    .line 2431
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "Package Query File: %s"

    const/16 v51, 0x1

    move/from16 v0, v51

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v51, v0

    const/16 v52, 0x0

    aput-object v17, v51, v52

    invoke-static/range {v50 .. v51}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 2432
    const-string v18, "packagesPresent.drt"

    .line 2434
    .local v18, "fileNameDestination":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-virtual {v0, v14, v1, v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packageFileTransferRequest(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 2449
    .end local v11    # "aList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v13    # "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .end local v14    # "deviceID":I
    .end local v17    # "fileName":Ljava/lang/String;
    .end local v18    # "fileNameDestination":Ljava/lang/String;
    :catch_0
    move-exception v15

    .line 2450
    .local v15, "ex":Ljava/lang/ClassCastException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string v51, "payload found and expecting ArrayList<String> but found "

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    .line 2451
    invoke-virtual/range {v31 .. v31}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v51

    invoke-virtual/range {v51 .. v51}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v51

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    .line 2450
    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2438
    .end local v15    # "ex":Ljava/lang/ClassCastException;
    .restart local v11    # "aList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v13    # "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .restart local v14    # "deviceID":I
    .restart local v17    # "fileName":Ljava/lang/String;
    :cond_6
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "Player.dat File: %s"

    const/16 v51, 0x1

    move/from16 v0, v51

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v51, v0

    const/16 v52, 0x0

    aput-object v17, v51, v52

    invoke-static/range {v50 .. v51}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v50

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 2439
    const-string v48, "/"

    move-object/from16 v0, v17

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    .line 2440
    .local v12, "comps":[Ljava/lang/String;
    array-length v0, v12

    move/from16 v48, v0

    add-int/lit8 v48, v48, -0x1

    aget-object v48, v12, v48

    const-string v49, "\\."

    invoke-virtual/range {v48 .. v49}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v16

    .line 2441
    .local v16, "fileN":[Ljava/lang/String;
    new-instance v48, Ljava/lang/StringBuilder;

    invoke-direct/range {v48 .. v48}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v49, 0x0

    aget-object v49, v16, v49

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    const-string v49, ".playerdata"

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 2443
    .restart local v18    # "fileNameDestination":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-virtual {v0, v14, v1, v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packageFileTransferRequest(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 2462
    .end local v11    # "aList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v12    # "comps":[Ljava/lang/String;
    .end local v13    # "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .end local v14    # "deviceID":I
    .end local v16    # "fileN":[Ljava/lang/String;
    .end local v17    # "fileName":Ljava/lang/String;
    .end local v18    # "fileNameDestination":Ljava/lang/String;
    .end local v31    # "payload":Ljava/lang/Object;
    :sswitch_11
    const/4 v8, 0x0

    .line 2463
    .local v8, "RESET_SUCCESS":S
    const/4 v7, 0x1

    .line 2464
    .local v7, "RESET_FAILURE":S
    const/4 v5, 0x2

    .line 2466
    .local v5, "PENDING_FW_UPDATE":S
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "Received Reset Partition Download Complete"

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2468
    const-string v48, "payload"

    move-object/from16 v0, p3

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/util/ArrayList;

    .line 2469
    .local v32, "payload":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/16 v38, 0x0

    .line 2470
    .local v38, "resultString":Ljava/lang/String;
    const/16 v48, 0x0

    move-object/from16 v0, v32

    move/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v48

    check-cast v48, Ljava/lang/Short;

    invoke-virtual/range {v48 .. v48}, Ljava/lang/Short;->shortValue()S

    move-result v37

    .line 2471
    .local v37, "result":S
    const/16 v48, 0x1

    invoke-static/range {v48 .. v48}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 2473
    .local v20, "handled":Ljava/lang/Boolean;
    packed-switch v37, :pswitch_data_1

    .line 2488
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v48, v0

    sget-object v49, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v50, "Unexpected result code."

    invoke-virtual/range {v48 .. v50}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2489
    const/16 v48, 0x0

    invoke-static/range {v48 .. v48}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    .line 2493
    :goto_4
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v48

    if-eqz v48, :cond_0

    .line 2495
    const-string v48, "{\"result\": \"%s\"}"

    const/16 v49, 0x1

    move/from16 v0, v49

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v49, v0

    const/16 v50, 0x0

    aput-object v38, v49, v50

    invoke-static/range {v48 .. v49}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    .line 2497
    .local v27, "jsonResult":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v48

    const/16 v49, 0x17

    move-object/from16 v0, v48

    move/from16 v1, v49

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2476
    .end local v27    # "jsonResult":Ljava/lang/String;
    :pswitch_4
    const-string v38, "success"

    .line 2477
    goto :goto_4

    .line 2480
    :pswitch_5
    const-string v38, "failure"

    .line 2481
    goto :goto_4

    .line 2484
    :pswitch_6
    const-string v38, "pending_fw_update"

    .line 2485
    goto :goto_4

    .line 2129
    nop

    :sswitch_data_0
    .sparse-switch
        0x1581 -> :sswitch_8
        0x1588 -> :sswitch_9
        0x158a -> :sswitch_a
        0x158b -> :sswitch_7
        0x158c -> :sswitch_d
        0x158d -> :sswitch_b
        0x158f -> :sswitch_c
        0x1590 -> :sswitch_e
        0x1646 -> :sswitch_0
        0x1b5f -> :sswitch_f
        0x1f49 -> :sswitch_2
        0x232d -> :sswitch_1
        0x2331 -> :sswitch_3
        0x2333 -> :sswitch_4
        0x2335 -> :sswitch_5
        0x2337 -> :sswitch_6
        0x233a -> :sswitch_10
        0x233c -> :sswitch_11
    .end sparse-switch

    .line 2264
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 2473
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public handleDRTCommandWithSimpleData(SI[B)Z
    .locals 11
    .param p1, "command"    # S
    .param p2, "deviceId"    # I
    .param p3, "data"    # [B

    .prologue
    const/16 v10, 0x13

    .line 1996
    const/4 v5, 0x1

    .line 1998
    .local v5, "wasHandled":Z
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "{\"device_id\":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", \"event\":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "}"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2000
    .local v2, "jsonString":Ljava/lang/String;
    sparse-switch p1, :sswitch_data_0

    .line 2108
    const/4 v5, 0x0

    .line 2114
    :cond_0
    :goto_0
    :sswitch_0
    return v5

    .line 2004
    :sswitch_1
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "received SYNC_APP_PROMPT"

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2006
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v6

    invoke-virtual {v6, v10, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto :goto_0

    .line 2013
    :sswitch_2
    invoke-virtual {p3}, [B->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    iput-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->maskedKey:[B

    .line 2022
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v6

    invoke-virtual {v6, v10, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto :goto_0

    .line 2029
    :sswitch_3
    invoke-virtual {p3}, [B->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    iput-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sessionKey:[B

    .line 2031
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "received SYNC_SET_SESSION_KEY:  sessionKey = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sessionKey:[B

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2033
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v6

    invoke-virtual {v6, v10, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto :goto_0

    .line 2040
    :sswitch_4
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "received SYNC_APP_INITIATE"

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2042
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v6

    invoke-virtual {v6, v10, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto :goto_0

    .line 2049
    :sswitch_5
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "received SYNC_APP_CONFIRM"

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2051
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v6

    invoke-virtual {v6, v10, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto :goto_0

    .line 2058
    :sswitch_6
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "received SYNC_APP_SUCCESS"

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2060
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stopKeycodeTimer()V

    .line 2062
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v6

    invoke-virtual {v6, v10, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2069
    :sswitch_7
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "received SYNC_APP_PROMPT_FAIL"

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2071
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v6

    invoke-virtual {v6, v10, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2078
    :sswitch_8
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "received SYNC_APP_FAIL"

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2080
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v6

    invoke-virtual {v6, v10, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 2087
    :sswitch_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    long-to-int v6, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    and-int/lit8 v6, v6, -0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 2088
    .local v4, "timestamp":Ljava/lang/Integer;
    new-instance v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$4;

    invoke-direct {v3, p0, v4}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$4;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;Ljava/lang/Integer;)V

    .line 2090
    .local v3, "payload":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {v3}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 2092
    .local v1, "jsonPayload":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 2093
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 2094
    const/16 v6, 0x1f4a

    invoke-virtual {v0, v6, p2, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    goto/16 :goto_0

    .line 2000
    :sswitch_data_0
    .sparse-switch
        0x1581 -> :sswitch_2
        0x1588 -> :sswitch_3
        0x158a -> :sswitch_4
        0x158b -> :sswitch_1
        0x158c -> :sswitch_7
        0x158d -> :sswitch_5
        0x158f -> :sswitch_6
        0x1590 -> :sswitch_8
        0x1f48 -> :sswitch_0
        0x1f49 -> :sswitch_9
    .end sparse-switch
.end method

.method public handlePackagesPresentFile(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 10
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "deviceId"    # Ljava/lang/String;
    .param p3, "data"    # [B

    .prologue
    .line 1910
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v7, "handlePackagesPresentFile called with filename: [%s]"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1914
    new-instance v4, Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-direct {v4}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;-><init>()V

    .line 1918
    .local v4, "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    const/16 v5, 0xc

    :try_start_0
    array-length v6, p3

    invoke-static {p3, v5, v6}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeWithData([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 1920
    .local v3, "packagesPresentObj":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p0, v3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->cachePackagesPresent(Ljava/util/HashMap;)V

    .line 1922
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1924
    .local v0, "appEventDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "event"

    const/16 v6, 0x2331

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1925
    const-string v5, "from"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1926
    const-string v5, "payload"

    invoke-virtual {v0, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1928
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1930
    .local v2, "jsonString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v5

    const/16 v6, 0xf

    invoke-virtual {v5, v6, v2}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1940
    .end local v0    # "appEventDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "jsonString":Ljava/lang/String;
    .end local v3    # "packagesPresentObj":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-void

    .line 1932
    :catch_0
    move-exception v1

    .line 1934
    .local v1, "e":Ljava/lang/Throwable;
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Error: unable to parse the player.data PMP object."

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1935
    invoke-static {p3}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->print_block([B)V

    .line 1936
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public handlePlayerDataFile(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 10
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "deviceId"    # Ljava/lang/String;
    .param p3, "data"    # [B

    .prologue
    .line 1949
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v7, "handlePlayerDataFile called with filename: [%s]"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1953
    new-instance v3, Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-direct {v3}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;-><init>()V

    .line 1958
    .local v3, "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    const/16 v5, 0xc

    :try_start_0
    array-length v6, p3

    invoke-static {p3, v5, v6}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeWithData([B)Ljava/lang/Object;

    move-result-object v2

    .line 1959
    .local v2, "playerDataObj":Ljava/lang/Object;
    invoke-static {v2}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1961
    .local v1, "playerDatJson":Ljava/lang/String;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1963
    .local v4, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "device_id"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1964
    const-string v5, "playerDatJson"

    invoke-virtual {v4, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1966
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v6, "Player Data Done"

    invoke-virtual {v5, v6, v4}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1976
    .end local v1    # "playerDatJson":Ljava/lang/String;
    .end local v2    # "playerDataObj":Ljava/lang/Object;
    .end local v4    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-void

    .line 1968
    :catch_0
    move-exception v0

    .line 1970
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Error: unable to parse the player.data PMP object."

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1971
    invoke-static {p3}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->print_block([B)V

    .line 1972
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public initializeDMO()V
    .locals 1

    .prologue
    .line 337
    invoke-static {}, Lcom/disney/emagine/sdk/dmo/EMTAnalytics;->sharedInstance()Lcom/disney/emagine/sdk/dmo/EMTAnalytics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/dmo/EMTAnalytics;->getAnalyticsInstance()Lcom/disneymobile/analytics/DMOAnalytics;

    .line 338
    return-void
.end method

.method public invalidateAccessToken()V
    .locals 2

    .prologue
    .line 459
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    const-string v1, "0123456789ABCDEF"

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->updateAccessToken(Ljava/lang/String;)V

    .line 460
    return-void
.end method

.method public isAnalyticsFile(Ljava/lang/String;)Z
    .locals 2
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 1875
    const-string v0, ".dat"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1877
    const/4 v0, 0x0

    .line 1880
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isBLERadioEnabled()Z
    .locals 1

    .prologue
    .line 296
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->isBLERadioEnabled:Z

    return v0
.end method

.method public isDeviceRegistered(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;)Z
    .locals 1
    .param p1, "device"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;

    .prologue
    .line 1865
    if-eqz p1, :cond_0

    iget-short v0, p1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->imHereFlags:S

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPackagesPresentFile(Ljava/lang/String;)Z
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 1900
    const-string v0, "packagesPresent.drt"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public isPlayerDataFile(Ljava/lang/String;)Z
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 1890
    const-string v0, "playerdata"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "player.dat"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public keycodeFailed()V
    .locals 6

    .prologue
    .line 1254
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "{\"device_id\": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDeviceId()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", \"event\": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x1597

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1255
    .local v0, "jsonObject":Ljava/lang/String;
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->stringToUTF8String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1257
    .local v1, "jsonString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v2

    const/16 v3, 0x13

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 1258
    return-void
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "loginString"    # Ljava/lang/String;
    .param p2, "rtoHost"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 855
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "{\"username\":\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "\",\"password\":\"pass123\"}"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 857
    .local v4, "jsonContent":Ljava/lang/String;
    new-instance v6, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v6}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 861
    .local v6, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    const-string v0, "Authorization"

    invoke-static {}, Lcom/disney/emagine/sdk/crypto/AESjni;->sharedInstance()Lcom/disney/emagine/sdk/crypto/AESjni;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/crypto/AESjni;->getProxyKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v0, v3}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 864
    const-string v0, "Content-Type"

    const-string v3, "application/json"

    invoke-virtual {v6, v0, v3}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 866
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "/portal-service/v1/login"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 884
    .local v1, "url":Ljava/lang/String;
    new-instance v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;

    invoke-direct {v5, p0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$2;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;Ljava/lang/String;)V

    .line 918
    .local v5, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v0, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v0, v2}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mLoginClient:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    .line 919
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mLoginClient:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual/range {v0 .. v5}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->postAsync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 920
    return-void
.end method

.method public loginSuccessWithDevice(I)V
    .locals 5
    .param p1, "deviceId"    # I

    .prologue
    .line 974
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "LoginSuccess!"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 976
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->getDRTDeviceFromDeviceId(I)Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;

    move-result-object v0

    .line 978
    .local v0, "device":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    if-eqz v0, :cond_0

    .line 980
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 982
    .local v1, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "device_id"

    iget v3, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->deviceId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 983
    const-string v2, "deviceType"

    iget v3, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->deviceType:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 984
    const-string v2, "callback"

    new-instance v3, Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;

    invoke-direct {v3, p0}, Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 986
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v3, "Send Manifest Done"

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 992
    .end local v1    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-void

    .line 990
    :cond_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "Error: there is no device connected to SDK. Cannot transfer content."

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public manifestFromName(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 603
    const/4 v1, 0x0

    .line 605
    .local v1, "manifestItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestItems()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 607
    .local v0, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "name"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    .line 609
    move-object v1, v0

    .line 615
    .end local v0    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    return-object v1
.end method

.method public manifestFromPackageId(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 4
    .param p1, "packageId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 625
    const/4 v1, 0x0

    .line 627
    .local v1, "manifestItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestItems()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 629
    .local v0, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "id"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    .line 631
    move-object v1, v0

    .line 637
    .end local v0    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    return-object v1
.end method

.method public manifestSuccess()V
    .locals 4

    .prologue
    .line 1001
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1003
    .local v0, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "device_id"

    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deviceIdPending:Ljava/lang/Integer;

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1004
    const-string v2, "content"

    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestItems()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1006
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/disney/emagine/sdk/EMTData;->stringToUTF8String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1008
    .local v1, "jsonString":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 1010
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v2

    const/4 v3, 0x5

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 1012
    :cond_0
    return-void
.end method

.method public missionManager()Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    .locals 1

    .prologue
    .line 256
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    return-object v0
.end method

.method public negotiateSessionKey(I)V
    .locals 4
    .param p1, "deviceId"    # I

    .prologue
    .line 1176
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1177
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 1178
    const/16 v1, 0x158a

    const-string v2, "{}"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, p1, v2, v3}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;B)V

    .line 1179
    :cond_0
    return-void
.end method

.method public networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
    .locals 1

    .prologue
    .line 266
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    return-object v0
.end method

.method public onAnalytics(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 9
    .param p1, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 3260
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v5, "=== Analytics State ==="

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3261
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 3262
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-nez v0, :cond_1

    .line 3279
    :cond_0
    :goto_0
    return-void

    .line 3265
    :cond_1
    if-eqz p1, :cond_0

    .line 3267
    iget-object v3, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    const-string v4, "device"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disney/emagine/sdk/ble/EMTDevice;

    .line 3268
    .local v1, "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    iget-wide v4, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    long-to-int v2, v4

    .line 3270
    .local v2, "deviceId":I
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v5, "MOLA says it has Analytics data to upload [%d]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3272
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->okToInitiateTransfer()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 3274
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v5, "Calling packageAnalyticsFileTransferRequest"

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3276
    invoke-virtual {p0, v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packageAnalyticsFileTransferRequest(I)V

    goto :goto_0
.end method

.method public onConnect()V
    .locals 3

    .prologue
    .line 3102
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v2, "=== Connect State ==="

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3105
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->foreground:Lcom/disney/emagine/sdk/foreground/Foreground;

    if-nez v0, :cond_0

    .line 3108
    new-instance v0, Lcom/disney/emagine/sdk/foreground/EMTApplication;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/foreground/EMTApplication;-><init>()V

    invoke-static {v0}, Lcom/disney/emagine/sdk/foreground/Foreground;->init(Landroid/app/Application;)Lcom/disney/emagine/sdk/foreground/Foreground;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->foreground:Lcom/disney/emagine/sdk/foreground/Foreground;

    .line 3110
    invoke-static {}, Lcom/disney/emagine/sdk/foreground/Foreground;->get()Lcom/disney/emagine/sdk/foreground/Foreground;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->foregroundListener:Lcom/disney/emagine/sdk/foreground/Foreground$Listener;

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/foreground/Foreground;->addListener(Lcom/disney/emagine/sdk/foreground/Foreground$Listener;)V

    .line 3112
    :cond_0
    return-void
.end method

.method public onFileTransfer()V
    .locals 3

    .prologue
    .line 3250
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v2, "=== File Transfer State ==="

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3251
    return-void
.end method

.method public onFirmwareTransfer(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 8
    .param p1, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 3288
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v7, "=== Firmware Transfer State ==="

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3289
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 3290
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-nez v0, :cond_0

    .line 3292
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v7, "Unable to initiate firmware transfer, currentDevice() is null"

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3329
    :goto_0
    return-void

    .line 3296
    :cond_0
    if-eqz p1, :cond_2

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->okToInitiateTransfer()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 3298
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v7, "Calling firmwareTransferStateStart"

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3300
    iget-object v5, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    const-string v6, "fwpFilename"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 3303
    .local v2, "fwpFilename":Ljava/lang/String;
    :try_start_0
    iget-object v5, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    const-string v6, "device_id"

    .line 3304
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 3303
    invoke-virtual {p0, v2, v5}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->uploadFirmwareStateStart(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 3306
    :catch_0
    move-exception v1

    .line 3308
    .local v1, "ex":Ljava/io/IOException;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 3309
    .local v3, "jsonObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "finished"

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3310
    const-string v5, "fwpFilename"

    if-eqz v2, :cond_1

    .end local v2    # "fwpFilename":Ljava/lang/String;
    :goto_1
    invoke-virtual {v3, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3311
    const-string v5, "event"

    const/16 v6, 0x69

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3312
    const-string v5, "description"

    const-string v6, "unable to upload firmware"

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3313
    const-string v5, "message"

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3315
    invoke-static {v3}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 3318
    .local v4, "jsonString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v5

    const/16 v6, 0x15

    invoke-virtual {v5, v6, v4}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 3321
    invoke-static {}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v5

    const-string v6, "Send Firmware Done"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    goto :goto_0

    .line 3310
    .end local v4    # "jsonString":Ljava/lang/String;
    .restart local v2    # "fwpFilename":Ljava/lang/String;
    :cond_1
    const-string v2, "null"

    goto :goto_1

    .line 3327
    .end local v1    # "ex":Ljava/io/IOException;
    .end local v2    # "fwpFilename":Ljava/lang/String;
    .end local v3    # "jsonObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v7, "Unable to initiate firmware transfer"

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public onFirmwareTransferExit(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 3
    .param p1, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 3338
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v2, "=== Firmware Transfer State Exit ==="

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3339
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v1, "Send Firmware"

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->removeQueuedEvent(Ljava/lang/String;)V

    .line 3340
    return-void
.end method

.method public onManifestTransfer(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 7
    .param p1, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 3201
    iget-object v4, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v6, "=== Manifest Transfer State ==="

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3203
    iget-object v2, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    .line 3204
    .local v2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "device_id"

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 3205
    .local v0, "deviceId":I
    const-string v4, "deviceType"

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Short;

    invoke-virtual {v4}, Ljava/lang/Short;->shortValue()S

    move-result v1

    .line 3207
    .local v1, "deviceType":S
    const-string v4, "callback"

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;

    .line 3209
    .local v3, "success":Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;
    iget-object v4, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v4, v0, v1, v3}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->getEntitlements(ISLcom/disney/emagine/sdk/completion/EMTManifestSuccess;)V

    .line 3210
    return-void
.end method

.method public onMissionTransfer(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 7
    .param p1, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 3219
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "=== Mission Transfer State ==="

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3221
    iget-object v1, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    .line 3222
    .local v1, "manifestItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "device_id"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 3225
    .local v0, "deviceId":I
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v5

    const-string v2, "url"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "name"

    .line 3226
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "packageSHA1"

    .line 3227
    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    check-cast v4, [B

    new-instance v6, Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;

    invoke-direct {v6, p0, v0}, Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;I)V

    .line 3225
    invoke-virtual {v5, v2, v3, v4, v6}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->download(Ljava/lang/String;Ljava/lang/String;[BLcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;)V

    .line 3229
    return-void
.end method

.method public onPackageTransfer(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 7
    .param p1, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 3233
    iget-object v4, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v6, "=== Package Transfer State ==="

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3235
    iget-object v2, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    .line 3236
    .local v2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "device_id"

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 3237
    .local v0, "deviceId":I
    const-string v4, "version"

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 3238
    .local v3, "version":I
    const-string v4, "packageId"

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 3240
    .local v1, "packageId":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v4

    invoke-virtual {v4, v0, v1, v3}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sendPackageToToyStart(ILjava/lang/String;I)V

    .line 3241
    return-void
.end method

.method public onPlayerData(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 10
    .param p1, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 3145
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "=== Player Data State ==="

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3147
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 3148
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-nez v0, :cond_1

    .line 3160
    :cond_0
    :goto_0
    return-void

    .line 3151
    :cond_1
    if-eqz p1, :cond_0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->okToInitiateTransfer()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3153
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->resetStateTimer(I)V

    .line 3154
    iget-object v2, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    const-string v3, "device"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disney/emagine/sdk/ble/EMTDevice;

    .line 3156
    .local v1, "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "MOLA says it has files to upload [%d]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-wide v8, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3158
    iget-wide v2, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    long-to-int v2, v2

    invoke-virtual {p0, v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->uploadFileTransferRequest(I)V

    goto :goto_0
.end method

.method public onPlayerDataDone(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 5
    .param p1, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 3169
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "=== Player Data State Done ==="

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3170
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stopStateTimer()V

    .line 3172
    if-eqz p1, :cond_0

    iget-object v2, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    if-nez v2, :cond_1

    .line 3174
    :cond_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "Error: PLAYER_DATA_JSON transition == null"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3192
    :goto_0
    return-void

    .line 3178
    :cond_1
    iget-object v2, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    const-string v3, "playerDatJson"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 3179
    .local v0, "jsonObject":Ljava/lang/Object;
    if-nez v0, :cond_2

    .line 3181
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "Error: PLAYER_DATA_JSON object is null"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object v1, v0

    .line 3185
    check-cast v1, Ljava/lang/String;

    .line 3186
    .local v1, "jsonString":Ljava/lang/String;
    if-eqz v1, :cond_3

    .line 3188
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v2

    const/16 v3, 0x16

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto :goto_0

    .line 3190
    :cond_3
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "Error: PLAYER_DATA_JSON element is not in transition.userInfo"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onReady(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 7
    .param p1, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 3122
    iget-object v4, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v6, "=== Ready State ==="

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3124
    if-eqz p1, :cond_0

    iget-object v4, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->sourceState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v4, v4, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    const-string v5, "Connect"

    invoke-virtual {v4, v5}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_0

    .line 3126
    iget-object v4, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    const-string v5, "device_id"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 3127
    .local v1, "deviceId":I
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 3129
    .local v0, "connectedDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    iget-object v4, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v6, "Notify Application that device is Ready"

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3131
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "{\"device_id\": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", \"state\": \"connected\",\"device_type\":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceType:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "}"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3132
    .local v2, "jsonObject":Ljava/lang/String;
    invoke-static {v2}, Lcom/disney/emagine/sdk/EMTData;->stringToUTF8String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 3134
    .local v3, "jsonString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v4

    const/16 v5, 0xa

    invoke-virtual {v4, v5, v3}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 3136
    .end local v0    # "connectedDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .end local v1    # "deviceId":I
    .end local v2    # "jsonObject":Ljava/lang/String;
    .end local v3    # "jsonString":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public onRegistration(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 3
    .param p1, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 3349
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v2, "=== Registration State ==="

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3350
    return-void
.end method

.method public onScanDevices(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 12
    .param p1, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    const-wide/16 v10, 0x0

    .line 3039
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v8, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v9, "=== Scan State ==="

    invoke-virtual {v5, v8, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3040
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v0

    .line 3041
    .local v0, "controller":Lcom/disney/emagine/sdk/ble/EMTController;
    const-wide/16 v2, 0x0

    .line 3043
    .local v2, "deviceId":J
    invoke-static {}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v5

    invoke-virtual {v5}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->invalidateEventQueue()V

    .line 3044
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packagesPresent:Ljava/util/HashMap;

    .line 3047
    if-eqz p1, :cond_0

    iget-object v5, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    if-eqz v5, :cond_0

    iget-object v5, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    const-string v8, "device_id"

    invoke-virtual {v5, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 3049
    iget-object v5, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    const-string v8, "device_id"

    invoke-virtual {v5, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->longValue()J

    move-result-wide v2

    .line 3050
    iget-object v5, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->sourceState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v5, v5, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    const-string v8, "Registration"

    invoke-virtual {v5, v8}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_0

    .line 3053
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v8, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v9, "Registration is Done, setting up reconnect logic."

    invoke-virtual {v5, v8, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3054
    long-to-int v5, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->reconnectDeviceId:Ljava/lang/Integer;

    .line 3058
    :cond_0
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v5

    if-nez v5, :cond_1

    cmp-long v5, v2, v10

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->reconnectDeviceId:Ljava/lang/Integer;

    if-nez v5, :cond_2

    .line 3061
    :cond_1
    :try_start_0
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->disconnectDevice()V

    .line 3062
    long-to-int v5, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->cleanupAfterDisconnect(Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3068
    :cond_2
    if-eqz p1, :cond_4

    cmp-long v5, v2, v10

    if-eqz v5, :cond_4

    .line 3070
    iget-object v5, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->sourceState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v5, v5, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    const-string v8, "Mission Transfer"

    invoke-virtual {v5, v8}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->sourceState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v5, v5, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    const-string v8, "Package Transfer"

    .line 3071
    invoke-virtual {v5, v8}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->sourceState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v5, v5, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    const-string v8, "Firmware Transfer"

    .line 3072
    invoke-virtual {v5, v8}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, p1, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->sourceState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v5, v5, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    const-string v8, "Registration"

    .line 3073
    invoke-virtual {v5, v8}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_4

    .line 3076
    :cond_3
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v8, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Blacklist device: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "for 10 seconds to work around Mola bug EMAGINE-13275"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3077
    invoke-virtual {v0, v2, v3}, Lcom/disney/emagine/sdk/ble/EMTController;->blacklistDevice(J)V

    .line 3079
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v5

    invoke-virtual {v5}, Lcom/disney/emagine/app/EmagineApplication;->backgroundHandler()Landroid/os/Handler;

    move-result-object v4

    .line 3080
    .local v4, "mHandler":Landroid/os/Handler;
    move-wide v6, v2

    .line 3081
    .local v6, "whiteListDevice":J
    new-instance v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$8;

    invoke-direct {v5, p0, v6, v7, v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$8;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;JLcom/disney/emagine/sdk/ble/EMTController;)V

    const-wide/16 v8, 0x2710

    invoke-virtual {v4, v5, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 3091
    .end local v4    # "mHandler":Landroid/os/Handler;
    .end local v6    # "whiteListDevice":J
    :cond_4
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stopTimer()V

    .line 3092
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->scan()V

    .line 3093
    return-void

    .line 3063
    :catch_0
    move-exception v1

    .line 3064
    .local v1, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method public onTick(Ljava/util/Timer;)V
    .locals 12
    .param p1, "timer"    # Ljava/util/Timer;

    .prologue
    .line 2680
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 2681
    .local v2, "disconnectedDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v3, 0x0

    .line 2683
    .local v3, "isBLEConnectionTimeout":Z
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 2684
    .local v0, "currentDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-nez v0, :cond_0

    .line 2686
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v7, "current device is null:"

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 2687
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "     is connected: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v8

    invoke-virtual {v8}, Lcom/disney/emagine/sdk/ble/EMTController;->isConnected()Z

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 2688
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "     is ble enabled: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v8

    invoke-virtual {v8}, Lcom/disney/emagine/sdk/ble/EMTController;->isBLEEnabled()Z

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 2689
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "     is scanning: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v8

    invoke-virtual {v8}, Lcom/disney/emagine/sdk/ble/EMTController;->isScanning()Z

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 2743
    :goto_0
    return-void

    .line 2693
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->lastTimeMsgReceived:J

    sub-long/2addr v6, v8

    long-to-int v5, v6

    const/16 v6, 0x3a98

    if-le v5, v6, :cond_2

    const/4 v3, 0x1

    .line 2695
    :goto_1
    iget-object v6, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->drtDeviceList:Ljava/util/ArrayList;

    monitor-enter v6

    .line 2697
    :try_start_0
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->drtDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;

    .line 2699
    .local v1, "device":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iget-wide v10, v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->lastTimeBeaconReceived:J

    sub-long/2addr v8, v10

    long-to-int v4, v8

    .line 2701
    .local v4, "timeInterval":I
    const/16 v7, 0x3a98

    if-le v4, v7, :cond_1

    .line 2703
    iget v7, v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->deviceId:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 2742
    .end local v1    # "device":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
    .end local v4    # "timeInterval":I
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 2693
    :cond_2
    const/4 v3, 0x0

    goto :goto_1

    .line 2707
    :cond_3
    :try_start_1
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->drtDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 2709
    if-eqz v3, :cond_6

    .line 2711
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "BLE Connection Timeout"

    invoke-virtual {v5, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2712
    if-eqz v0, :cond_5

    iget-short v5, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->imHereFlags:S

    and-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_5

    .line 2714
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deviceDidLeave(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    .line 2715
    iget-wide v8, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    long-to-int v5, v8

    invoke-virtual {p0, v5}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->rebootDeviceId(I)V

    .line 2742
    :cond_4
    :goto_3
    monitor-exit v6

    goto :goto_0

    .line 2717
    :cond_5
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onTick() BLE connection timeout.  Calling disconnect for deviceId="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-wide v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2718
    iget-wide v8, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    long-to-int v5, v8

    invoke-virtual {p0, v5}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->disconnect(I)V

    goto :goto_3

    .line 2724
    :cond_6
    if-eqz v0, :cond_7

    iget-boolean v5, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->nonceEstablished:Z

    if-nez v5, :cond_7

    .line 2726
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->isReady()Z

    move-result v5

    const/4 v7, 0x1

    if-ne v5, v7, :cond_7

    const-wide/16 v8, 0x1

    .line 2727
    invoke-virtual {v0, v8, v9}, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceIDFromRadioID(J)J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v5, v8, v10

    if-eqz v5, :cond_7

    .line 2729
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "sending ImHere Message to the toy"

    invoke-virtual {v5, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 2730
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sendImHereMessage()V

    goto :goto_3

    .line 2734
    :cond_7
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->isReady()Z

    move-result v5

    if-nez v5, :cond_8

    .line 2735
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "currentDevice.isReady == false"

    invoke-virtual {v5, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 2737
    :cond_8
    const-wide/16 v8, 0x1

    invoke-virtual {v0, v8, v9}, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceIDFromRadioID(J)J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v5, v8, v10

    if-nez v5, :cond_4

    .line 2738
    iget-object v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v8, "currentDevice.deviceIDFromRadioID(1) == 0"

    invoke-virtual {v5, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3
.end method

.method public packageAnalyticsFileTransferRequest(I)V
    .locals 7
    .param p1, "deviceId"    # I

    .prologue
    .line 1399
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "[%d]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const/4 v6, -0x3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1401
    .local v1, "jsonString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1402
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 1403
    const/16 v2, 0x1f47

    invoke-virtual {v0, v2, p1, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 1404
    :cond_0
    return-void
.end method

.method public packageDeleteForDevice(Ljava/lang/String;II)V
    .locals 6
    .param p1, "packageId"    # Ljava/lang/String;
    .param p2, "deviceId"    # I
    .param p3, "version"    # I

    .prologue
    .line 1354
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTFileManager;->utf8StringFromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1356
    .local v3, "packageName":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 1374
    :cond_0
    :goto_0
    return-void

    .line 1361
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1362
    .local v1, "jsonArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, p3}, Ljava/lang/Integer;-><init>(I)V

    .line 1363
    .local v4, "packageVersion":Ljava/lang/Integer;
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1364
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1366
    invoke-static {v1}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1368
    .local v2, "jsonString":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 1370
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1371
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 1372
    const/16 v5, 0x232c

    invoke-virtual {v0, v5, p2, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    goto :goto_0
.end method

.method public packageFileTransferRequest(ILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "deviceId"    # I
    .param p2, "sourcePath"    # Ljava/lang/String;
    .param p3, "destPath"    # Ljava/lang/String;

    .prologue
    .line 1384
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "[%d,\"%s\",\"%s\"]"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const/4 v6, -0x3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object p2, v4, v5

    const/4 v5, 0x2

    aput-object p3, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1386
    .local v1, "jsonString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1387
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 1388
    const/16 v2, 0x232e

    invoke-virtual {v0, v2, p1, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 1389
    :cond_0
    return-void
.end method

.method public packageGetAvailableSpace(I)V
    .locals 3
    .param p1, "deviceId"    # I

    .prologue
    .line 1426
    const-string v1, "[]"

    .line 1428
    .local v1, "jsonString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1429
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 1430
    const/16 v2, 0x2332

    invoke-virtual {v0, v2, p1, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 1431
    :cond_0
    return-void
.end method

.method public packageQuery(I)V
    .locals 6
    .param p1, "deviceId"    # I

    .prologue
    .line 1337
    const-string v2, "[\"%s\"]"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "packagesPresent.drt"

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1339
    .local v1, "jsonString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1340
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 1341
    const/16 v2, 0x233f

    invoke-virtual {v0, v2, p1, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 1342
    :cond_0
    return-void
.end method

.method public packageQueryMessage(I)V
    .locals 3
    .param p1, "deviceId"    # I

    .prologue
    .line 1323
    const-string v1, "{}"

    .line 1325
    .local v1, "jsonString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1326
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 1327
    const/16 v2, 0x2330

    invoke-virtual {v0, v2, p1, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 1328
    :cond_0
    return-void
.end method

.method public packageTransferComplete(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceId"    # I
    .param p2, "manifestFileName"    # Ljava/lang/String;
    .param p3, "packageId"    # Ljava/lang/String;

    .prologue
    .line 3598
    return-void
.end method

.method public packageTransferComplete(ILjava/util/HashMap;)V
    .locals 4
    .param p1, "deviceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1309
    .local p2, "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "name"

    invoke-virtual {p2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "version"

    invoke-virtual {p2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1311
    .local v1, "jsonString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1312
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 1313
    const/16 v2, 0x232a

    invoke-virtual {v0, v2, p1, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 1314
    :cond_0
    return-void
.end method

.method public packageTransferStart(ILjava/util/HashMap;)V
    .locals 11
    .param p1, "deviceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v10, 0x0

    .line 1282
    const-string v7, "hmac-key"

    invoke-virtual {p2, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_0

    const-string v7, "hmac-sha1"

    invoke-virtual {p2, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_0

    const-string v7, "manifest-path"

    invoke-virtual {p2, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_1

    .line 1284
    :cond_0
    iget-object v7, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v8, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v9, "Error: No manifest exists for downloading to the Toy.  This is a server error."

    invoke-virtual {v7, v8, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1287
    :cond_1
    const-string v7, "hmac-key"

    invoke-virtual {p2, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7, v10}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    .line 1288
    .local v1, "hmacKey":[B
    const-string v7, "hmac-sha1"

    invoke-virtual {p2, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [B

    move-object v2, v7

    check-cast v2, [B

    .line 1289
    .local v2, "hmacSha1":[B
    const-string v7, "manifest-path"

    invoke-virtual {p2, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1291
    .local v4, "manifestPath":Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/io/Serializable;

    aput-object v1, v7, v10

    const/4 v8, 0x1

    aput-object v2, v7, v8

    const/4 v8, 0x2

    aput-object v4, v7, v8

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1292
    .local v3, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v6, Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-direct {v6}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;-><init>()V

    .line 1293
    .local v6, "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    invoke-virtual {v6, v3}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->PMPFromObject(Ljava/lang/Object;)Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;

    move-result-object v5

    .line 1295
    .local v5, "pmp":Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    iget-object v7, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v8, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v9, "SEND -----> PACKAGE_TRANSFER_START"

    invoke-virtual {v7, v8, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1296
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1297
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_2

    .line 1298
    const/16 v7, 0x2334

    invoke-virtual {v0, v7, p1, v5}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;)V

    .line 1299
    :cond_2
    return-void
.end method

.method public portalLibrary()Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;
    .locals 1

    .prologue
    .line 245
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibrary;

    move-result-object v0

    return-object v0
.end method

.method public rebootDeviceId(I)V
    .locals 3
    .param p1, "deviceId"    # I

    .prologue
    .line 1021
    const-string v1, "{}"

    .line 1023
    .local v1, "jsonString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1024
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 1025
    const/16 v2, 0x1b61

    invoke-virtual {v0, v2, p1, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 1026
    :cond_0
    return-void
.end method

.method public registerDevice(ILjava/util/HashMap;)V
    .locals 15
    .param p1, "deviceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 516
    .local p2, "info":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v11, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v12, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v13, "Sending owner info"

    invoke-virtual {v11, v12, v13}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    const-string v11, "displayName"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 520
    .local v2, "displayName":Ljava/lang/String;
    const-string v11, "ownerId"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [B

    move-object v4, v11

    check-cast v4, [B

    .line 521
    .local v4, "ownerIDBytes":[B
    invoke-static {v4}, Lcom/disney/emagine/sdk/EMTData;->bytesToIntObject([B)Ljava/lang/Integer;

    move-result-object v3

    .line 522
    .local v3, "ownerID":Ljava/lang/Integer;
    const-string v11, "ownerIdHash"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [B

    move-object v5, v11

    check-cast v5, [B

    .line 523
    .local v5, "ownerIDHash":[B
    const-string v11, "encryptedOwnerKey"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [B

    move-object v6, v11

    check-cast v6, [B

    .line 524
    .local v6, "ownerKey":[B
    const-string v11, "ownerKeySHA"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [B

    move-object v7, v11

    check-cast v7, [B

    .line 526
    .local v7, "ownerKeyHash":[B
    iget-object v11, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v12, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "displayName  = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 527
    iget-object v11, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v12, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "ownerID      = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 528
    iget-object v11, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v12, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "ownerIDHash  = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v5}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 529
    iget-object v11, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v12, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "ownerKey     = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v6}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    iget-object v11, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v12, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "ownerKeyHash = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {v7}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 532
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 533
    .local v8, "payload":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 534
    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 535
    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 536
    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 537
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 539
    new-instance v10, Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-direct {v10}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;-><init>()V

    .line 540
    .local v10, "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    invoke-virtual {v10, v8}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->PMPFromObject(Ljava/lang/Object;)Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;

    move-result-object v9

    .line 542
    .local v9, "pmp":Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v11

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    iput-object v12, v11, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->reconnectDeviceId:Ljava/lang/Integer;

    .line 547
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v1

    .line 548
    .local v1, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v1, :cond_0

    .line 549
    const/16 v11, 0x1647

    const/4 v12, 0x3

    move/from16 v0, p1

    invoke-virtual {v1, v11, v0, v9, v12}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;B)V

    .line 551
    :cond_0
    return-void
.end method

.method public requestDisplayNameForDeviceId(I)V
    .locals 5
    .param p1, "deviceId"    # I

    .prologue
    .line 488
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "Sending display name request"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 490
    const-string v1, "[]"

    .line 491
    .local v1, "jsonString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 492
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 493
    const/16 v2, 0x1648

    invoke-virtual {v0, v2, p1, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 494
    :cond_0
    return-void
.end method

.method public requestFirmwareVersion(IZ)V
    .locals 5
    .param p1, "deviceId"    # I
    .param p2, "sendHeartbeat"    # Z

    .prologue
    .line 2884
    iput-boolean p2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sendHeartbeatOnFWResponse:Z

    .line 2886
    const/4 v4, 0x0

    new-array v1, v4, [B

    .line 2888
    .local v1, "data":[B
    new-instance v3, Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-direct {v3}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;-><init>()V

    .line 2889
    .local v3, "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    invoke-virtual {v3, v1}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->PMPFromObject(Ljava/lang/Object;)Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;

    move-result-object v2

    .line 2891
    .local v2, "pmp":Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 2892
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 2893
    const/16 v4, 0x1b5e

    invoke-virtual {v0, v4, p1, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;)V

    .line 2894
    :cond_0
    return-void
.end method

.method public resendFileTransferStart()V
    .locals 1

    .prologue
    .line 753
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 754
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 755
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->resendFileTransferStart()V

    .line 756
    :cond_0
    return-void
.end method

.method public resetDownloadPartition(I)V
    .locals 3
    .param p1, "deviceId"    # I

    .prologue
    .line 1441
    const-string v1, "[]"

    .line 1443
    .local v1, "jsonString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1444
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 1445
    const/16 v2, 0x2336

    invoke-virtual {v0, v2, p1, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 1446
    :cond_0
    return-void
.end method

.method public resetStateTimer(I)V
    .locals 6
    .param p1, "seconds"    # I

    .prologue
    .line 2602
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v2, "starting state timer with interval:[%d] seconds"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2604
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 2605
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stopStateTimer()V

    .line 2607
    :cond_0
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimer:Ljava/util/Timer;

    .line 2608
    new-instance v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$6;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$6;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimerTask:Ljava/util/TimerTask;

    .line 2617
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimerTask:Ljava/util/TimerTask;

    mul-int/lit16 v2, p1, 0x3e8

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 2618
    return-void
.end method

.method public scan()V
    .locals 4

    .prologue
    .line 358
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v3, "scan(); called"

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v0

    .line 360
    .local v0, "controller":Lcom/disney/emagine/sdk/ble/EMTController;
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->beginScanning()V

    .line 361
    return-void
.end method

.method public sendCloseBLEConnection()V
    .locals 1

    .prologue
    .line 555
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 556
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 557
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendCloseBLEConnection()V

    .line 558
    :cond_0
    return-void
.end method

.method public sendDataEvent(SILjava/lang/String;)V
    .locals 6
    .param p1, "event"    # S
    .param p2, "deviceId"    # I
    .param p3, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 585
    invoke-static {p3}, Lcom/disney/emagine/sdk/EMTFileManager;->utf8StringFromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 587
    .local v1, "jsonString":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 589
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sendDataEvent with event = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", deviceId = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "jsonString = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 590
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 591
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 592
    invoke-virtual {v0, p1, p2, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 594
    .end local v0    # "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    :cond_0
    return-void
.end method

.method public sendImHereMessage()V
    .locals 7

    .prologue
    .line 727
    const/4 v5, 0x2

    new-array v4, v5, [B

    fill-array-data v4, :array_0

    .line 733
    .local v4, "payload":[B
    const/4 v0, 0x1

    .line 735
    .local v0, "app_type":I
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v5

    invoke-static {v5}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v5

    invoke-static {v4, v5}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v4

    .line 737
    const/4 v2, 0x0

    .line 739
    .local v2, "flags":I
    invoke-static {v2}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v5

    invoke-static {v4, v5}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v4

    .line 742
    const/4 v3, 0x0

    .line 744
    .local v3, "ownerId":I
    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v5

    invoke-static {v4, v5}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v4

    .line 746
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v1

    .line 747
    .local v1, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v1, :cond_0

    .line 748
    const/16 v5, 0x138b

    const/4 v6, -0x2

    invoke-virtual {v1, v5, v6, v4}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendSimpleEvent(SI[B)V

    .line 749
    :cond_0
    return-void

    .line 727
    :array_0
    .array-data 1
        0x30t
        0x0t
    .end array-data
.end method

.method public sendOwnerIdToDevice(I)V
    .locals 2
    .param p1, "deviceId"    # I

    .prologue
    .line 2978
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    new-instance v1, Lcom/disney/emagine/sdk/completion/EMTOwnerIdRequestCompletion;

    invoke-direct {v1, p0}, Lcom/disney/emagine/sdk/completion/EMTOwnerIdRequestCompletion;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->sendOwnerIdRequest(Lcom/disney/emagine/sdk/completion/EMTOwnerIdRequestCompletion;)V

    .line 2979
    return-void
.end method

.method public sendSDKVersionToApp()V
    .locals 5

    .prologue
    .line 347
    const-string v1, "{\"sdk_version\":\"%s\"}"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "1.0.67"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 348
    .local v0, "versionString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v1

    const/16 v2, 0x1d

    invoke-virtual {v1, v2, v0}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 349
    return-void
.end method

.method public sendTokenForDeviceId([BI)V
    .locals 8
    .param p1, "token"    # [B
    .param p2, "deviceId"    # I

    .prologue
    .line 469
    iget-object v4, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Sending token: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 471
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 472
    .local v3, "tokenList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 474
    new-instance v2, Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-direct {v2}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;-><init>()V

    .line 475
    .local v2, "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    invoke-virtual {v2, v3}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->PMPFromObject(Ljava/lang/Object;)Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;

    move-result-object v1

    .line 476
    .local v1, "pmp":Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 477
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 478
    const/16 v4, 0x1645

    const/4 v5, 0x3

    invoke-virtual {v0, v4, p2, v1, v5}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;B)V

    .line 479
    :cond_0
    return-void
.end method

.method public sendUpdateFirmware()V
    .locals 0

    .prologue
    .line 3605
    return-void
.end method

.method public setError(Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 0
    .param p1, "err"    # Lcom/disney/emagine/sdk/apple/NSError;

    .prologue
    .line 3562
    return-void
.end method

.method public setStartTime(J)V
    .locals 0
    .param p1, "st"    # J

    .prologue
    .line 3569
    return-void
.end method

.method public setTransferredBytes(J)V
    .locals 0
    .param p1, "tb"    # J

    .prologue
    .line 3576
    return-void
.end method

.method public setUploadingAnalytics(Z)V
    .locals 0
    .param p1, "state"    # Z

    .prologue
    .line 3554
    iput-boolean p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->uploadingAnalytics:Z

    .line 3555
    return-void
.end method

.method public showErrorWithTitle(Lcom/disney/emagine/sdk/apple/NSError;Ljava/lang/String;)V
    .locals 0
    .param p1, "err"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 3583
    return-void
.end method

.method public startKeycodeTimer(I)V
    .locals 6
    .param p1, "seconds"    # I

    .prologue
    .line 2644
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v2, "starting keycode timer with interval:[%d] seconds"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2646
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->keycodeTimer:Ljava/util/Timer;

    .line 2647
    new-instance v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$7;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$7;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->keycodeTimerTask:Ljava/util/TimerTask;

    .line 2656
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->keycodeTimer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->keycodeTimerTask:Ljava/util/TimerTask;

    mul-int/lit16 v2, p1, 0x3e8

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 2657
    return-void
.end method

.method public startTimer(I)V
    .locals 8
    .param p1, "seconds"    # I

    .prologue
    .line 2555
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->timer:Ljava/util/Timer;

    .line 2556
    new-instance v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$5;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$5;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->timerTask:Ljava/util/TimerTask;

    .line 2573
    const/4 v6, 0x0

    .line 2574
    .local v6, "delay":I
    move v7, p1

    .line 2576
    .local v7, "interval":I
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->timer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->timerTask:Ljava/util/TimerTask;

    int-to-long v2, v6

    mul-int/lit16 v4, v7, 0x3e8

    int-to-long v4, v4

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 2577
    return-void
.end method

.method public stateMachine()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;
    .locals 1

    .prologue
    .line 286
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    return-object v0
.end method

.method public stateMachineInit()V
    .locals 39

    .prologue
    .line 3359
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-object/from16 v34, v0

    if-eqz v34, :cond_0

    .line 3444
    :goto_0
    return-void

    .line 3364
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v34, v0

    sget-object v35, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v36, "State machine initializing..."

    invoke-virtual/range {v34 .. v36}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3366
    invoke-static {}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    .line 3368
    const-string v34, "Scanning"

    invoke-static/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/TKState;->stateWithName(Ljava/lang/String;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v23

    .line 3370
    .local v23, "scan":Lcom/disney/emagine/sdk/transitionkit/TKState;
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnScanDeviceBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnScanDeviceBlock;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v23

    iput-object v0, v1, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    .line 3372
    const-string v34, "Connect"

    invoke-static/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/TKState;->stateWithName(Ljava/lang/String;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v6

    .line 3374
    .local v6, "connect":Lcom/disney/emagine/sdk/transitionkit/TKState;
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateOnConnectBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateOnConnectBlock;-><init>()V

    move-object/from16 v0, v34

    iput-object v0, v6, Lcom/disney/emagine/sdk/transitionkit/TKState;->didExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateDelegate;

    .line 3376
    const-string v34, "Ready"

    invoke-static/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/TKState;->stateWithName(Ljava/lang/String;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v18

    .line 3378
    .local v18, "ready":Lcom/disney/emagine/sdk/transitionkit/TKState;
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnReadyBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnReadyBlock;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v18

    iput-object v0, v1, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    .line 3380
    const-string v34, "Player Data"

    invoke-static/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/TKState;->stateWithName(Ljava/lang/String;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v15

    .line 3382
    .local v15, "playerData":Lcom/disney/emagine/sdk/transitionkit/TKState;
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnPlayerDataBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnPlayerDataBlock;-><init>()V

    move-object/from16 v0, v34

    iput-object v0, v15, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    .line 3383
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateOnPlayerDataBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateOnPlayerDataBlock;-><init>()V

    move-object/from16 v0, v34

    iput-object v0, v15, Lcom/disney/emagine/sdk/transitionkit/TKState;->didExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateDelegate;

    .line 3385
    const-string v34, "Manifest Transfer"

    invoke-static/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/TKState;->stateWithName(Ljava/lang/String;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v12

    .line 3387
    .local v12, "manifestTransfer":Lcom/disney/emagine/sdk/transitionkit/TKState;
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnManifestTransferBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnManifestTransferBlock;-><init>()V

    move-object/from16 v0, v34

    iput-object v0, v12, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    .line 3389
    const-string v34, "Mission Transfer"

    invoke-static/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/TKState;->stateWithName(Ljava/lang/String;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v13

    .line 3391
    .local v13, "missionTransfer":Lcom/disney/emagine/sdk/transitionkit/TKState;
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnMissionTransferBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnMissionTransferBlock;-><init>()V

    move-object/from16 v0, v34

    iput-object v0, v13, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    .line 3393
    const-string v34, "Firmware Transfer"

    invoke-static/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/TKState;->stateWithName(Ljava/lang/String;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v11

    .line 3395
    .local v11, "firmwareTransfer":Lcom/disney/emagine/sdk/transitionkit/TKState;
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnFirmwareTransferBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnFirmwareTransferBlock;-><init>()V

    move-object/from16 v0, v34

    iput-object v0, v11, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    .line 3396
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateOnFirmwareTransferBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateOnFirmwareTransferBlock;-><init>()V

    move-object/from16 v0, v34

    iput-object v0, v11, Lcom/disney/emagine/sdk/transitionkit/TKState;->didExitStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidExitStateDelegate;

    .line 3398
    const-string v34, "Package Transfer"

    invoke-static/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/TKState;->stateWithName(Ljava/lang/String;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v14

    .line 3400
    .local v14, "packageTransfer":Lcom/disney/emagine/sdk/transitionkit/TKState;
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnPackageTransferBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnPackageTransferBlock;-><init>()V

    move-object/from16 v0, v34

    iput-object v0, v14, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    .line 3402
    const-string v34, "File Transfer"

    invoke-static/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/TKState;->stateWithName(Ljava/lang/String;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v10

    .line 3404
    .local v10, "fileTransfer":Lcom/disney/emagine/sdk/transitionkit/TKState;
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnFileTransferBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnFileTransferBlock;-><init>()V

    move-object/from16 v0, v34

    iput-object v0, v10, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    .line 3406
    const-string v34, "Analytics"

    invoke-static/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/TKState;->stateWithName(Ljava/lang/String;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v3

    .line 3408
    .local v3, "analytics":Lcom/disney/emagine/sdk/transitionkit/TKState;
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnAnalyticsBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnAnalyticsBlock;-><init>()V

    move-object/from16 v0, v34

    iput-object v0, v3, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    .line 3410
    const-string v34, "Registration"

    invoke-static/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/TKState;->stateWithName(Ljava/lang/String;)Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-result-object v21

    .line 3412
    .local v21, "registration":Lcom/disney/emagine/sdk/transitionkit/TKState;
    new-instance v34, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnRegistrationBlock;

    invoke-direct/range {v34 .. v34}, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnRegistrationBlock;-><init>()V

    move-object/from16 v0, v34

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/disney/emagine/sdk/transitionkit/TKState;->didEnterStateBlock:Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;

    .line 3414
    const-string v34, "Device Ready"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v6, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v8

    .line 3415
    .local v8, "deviceReady":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Disconnect"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0xa

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v23, v36, v37

    const/16 v37, 0x1

    aput-object v6, v36, v37

    const/16 v37, 0x2

    aput-object v18, v36, v37

    const/16 v37, 0x3

    aput-object v15, v36, v37

    const/16 v37, 0x4

    aput-object v13, v36, v37

    const/16 v37, 0x5

    aput-object v14, v36, v37

    const/16 v37, 0x6

    aput-object v10, v36, v37

    const/16 v37, 0x7

    aput-object v11, v36, v37

    const/16 v37, 0x8

    aput-object v3, v36, v37

    const/16 v37, 0x9

    aput-object v21, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v23

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v9

    .line 3416
    .local v9, "disconnect":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Rescan"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v23, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v23

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v22

    .line 3417
    .local v22, "rescan":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Player Data Available"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v18, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    invoke-static {v0, v1, v15}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v17

    .line 3418
    .local v17, "playerDataReady":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Player Data Done"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v15, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v16

    .line 3419
    .local v16, "playerDataDone":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Send Manifest"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v18, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    invoke-static {v0, v1, v12}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v28

    .line 3420
    .local v28, "sendManifest":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Send Manifest Done"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v12, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v29

    .line 3421
    .local v29, "sendManifestDone":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Send Mission"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v18, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    invoke-static {v0, v1, v13}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v30

    .line 3422
    .local v30, "sendMission":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Send Mission Done"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x2

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v13, v36, v37

    const/16 v37, 0x1

    aput-object v14, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v31

    .line 3423
    .local v31, "sendMissionDone":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Send Firmware"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v18, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    invoke-static {v0, v1, v11}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v26

    .line 3424
    .local v26, "sendFirmware":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Send Firmware Done"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v11, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v27

    .line 3425
    .local v27, "sendFirmwareDone":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Send Package"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v18, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    invoke-static {v0, v1, v14}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v32

    .line 3426
    .local v32, "sendPackage":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Send File"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v13, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    invoke-static {v0, v1, v10}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v24

    .line 3427
    .local v24, "sendFile":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Send File Done"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v10, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    invoke-static {v0, v1, v13}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v25

    .line 3428
    .local v25, "sendFileDone":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Analytics Available"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x2

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v18, v36, v37

    const/16 v37, 0x1

    aput-object v3, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    invoke-static {v0, v1, v3}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v4

    .line 3429
    .local v4, "analyticsAvailable":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Analytics Done"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v3, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v5

    .line 3430
    .local v5, "analyticsDone":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Connect"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v23, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    invoke-static {v0, v1, v6}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v7

    .line 3431
    .local v7, "connected":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Register Start"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x2

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v18, v36, v37

    const/16 v37, 0x1

    aput-object v21, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v20

    .line 3432
    .local v20, "registerStart":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "Register Done"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v21, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v23

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v19

    .line 3433
    .local v19, "registerDone":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    const-string v34, "State Timeout"

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0x2

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v15, v36, v37

    const/16 v37, 0x1

    aput-object v3, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKEvent;->eventWithName(Ljava/lang/String;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/transitionkit/TKState;)Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-result-object v33

    .line 3435
    .local v33, "stateTimeout":Lcom/disney/emagine/sdk/transitionkit/TKEvent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-object/from16 v34, v0

    new-instance v35, Ljava/util/ArrayList;

    const/16 v36, 0xb

    move/from16 v0, v36

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKState;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v23, v36, v37

    const/16 v37, 0x1

    aput-object v6, v36, v37

    const/16 v37, 0x2

    aput-object v18, v36, v37

    const/16 v37, 0x3

    aput-object v15, v36, v37

    const/16 v37, 0x4

    aput-object v12, v36, v37

    const/16 v37, 0x5

    aput-object v13, v36, v37

    const/16 v37, 0x6

    aput-object v11, v36, v37

    const/16 v37, 0x7

    aput-object v14, v36, v37

    const/16 v37, 0x8

    aput-object v10, v36, v37

    const/16 v37, 0x9

    aput-object v3, v36, v37

    const/16 v37, 0xa

    aput-object v21, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v36, Ljava/util/ArrayList;

    const/16 v37, 0x14

    move/from16 v0, v37

    new-array v0, v0, [Lcom/disney/emagine/sdk/transitionkit/TKEvent;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    aput-object v8, v37, v38

    const/16 v38, 0x1

    aput-object v7, v37, v38

    const/16 v38, 0x2

    aput-object v9, v37, v38

    const/16 v38, 0x3

    aput-object v17, v37, v38

    const/16 v38, 0x4

    aput-object v16, v37, v38

    const/16 v38, 0x5

    aput-object v28, v37, v38

    const/16 v38, 0x6

    aput-object v29, v37, v38

    const/16 v38, 0x7

    aput-object v30, v37, v38

    const/16 v38, 0x8

    aput-object v31, v37, v38

    const/16 v38, 0x9

    aput-object v26, v37, v38

    const/16 v38, 0xa

    aput-object v27, v37, v38

    const/16 v38, 0xb

    aput-object v32, v37, v38

    const/16 v38, 0xc

    aput-object v24, v37, v38

    const/16 v38, 0xd

    aput-object v25, v37, v38

    const/16 v38, 0xe

    aput-object v4, v37, v38

    const/16 v38, 0xf

    aput-object v5, v37, v38

    const/16 v38, 0x10

    aput-object v20, v37, v38

    const/16 v38, 0x11

    aput-object v22, v37, v38

    const/16 v38, 0x12

    aput-object v19, v37, v38

    const/16 v38, 0x13

    aput-object v33, v37, v38

    .line 3437
    invoke-static/range {v37 .. v37}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v37

    invoke-direct/range {v36 .. v37}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 3435
    invoke-virtual/range {v34 .. v36}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->addStatesAndEvents(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 3441
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-object/from16 v34, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v34

    iput-object v0, v1, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->initialState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    .line 3443
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v34, v0

    sget-object v35, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v36, "State machine initialized."

    invoke-virtual/range {v34 .. v36}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public stateTimedOut()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1267
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "timing out in state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    iget-object v3, v3, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v3, v3, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1268
    iput-object v4, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimer:Ljava/util/Timer;

    .line 1269
    iput-object v4, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimerTask:Ljava/util/TimerTask;

    .line 1270
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v1, "State Timeout"

    invoke-virtual {v0, v1, v4}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 1271
    return-void
.end method

.method public stopKeycodeTimer()V
    .locals 1

    .prologue
    .line 2666
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->keycodeTimerTask:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 2667
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->keycodeTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 2669
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->keycodeTimer:Ljava/util/Timer;

    .line 2670
    return-void
.end method

.method public stopStateTimer()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 2627
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimerTask:Ljava/util/TimerTask;

    if-eqz v0, :cond_0

    .line 2628
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimerTask:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 2629
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimer:Ljava/util/Timer;

    if-eqz v0, :cond_1

    .line 2630
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 2632
    :cond_1
    iput-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimer:Ljava/util/Timer;

    .line 2633
    iput-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateTimerTask:Ljava/util/TimerTask;

    .line 2634
    return-void
.end method

.method public stopTimer()V
    .locals 1

    .prologue
    .line 2586
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->timerTask:Ljava/util/TimerTask;

    if-eqz v0, :cond_0

    .line 2587
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->timerTask:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 2589
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->timer:Ljava/util/Timer;

    if-eqz v0, :cond_1

    .line 2590
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 2591
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->timer:Ljava/util/Timer;

    .line 2593
    :cond_1
    return-void
.end method

.method public testReceiveZip(I)V
    .locals 1
    .param p1, "deviceId"    # I

    .prologue
    .line 3482
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->missionManager()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->getCachedPackages(I)V

    .line 3483
    return-void
.end method

.method public testSendToken(I)V
    .locals 13
    .param p1, "deviceID"    # I

    .prologue
    const/16 v12, 0x20

    const/4 v11, 0x0

    const/16 v10, 0x10

    .line 2762
    const/16 v9, 0x30

    new-array v4, v9, [B

    fill-array-data v4, :array_0

    .line 2765
    .local v4, "iv_token":[B
    new-array v6, v12, [B

    fill-array-data v6, :array_1

    .line 2767
    .local v6, "plain_text":[B
    new-array v3, v10, [B

    fill-array-data v3, :array_2

    .line 2768
    .local v3, "iv":[B
    new-array v5, v10, [B

    fill-array-data v5, :array_3

    .line 2770
    .local v5, "key":[B
    invoke-static {v6, v3, v5}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->aesCBCEncrypt([B[B[B)[B

    move-result-object v2

    .line 2772
    .local v2, "encrypted":[B
    if-eqz v2, :cond_0

    array-length v9, v2

    if-ne v9, v12, :cond_0

    .line 2774
    invoke-static {v3, v11, v4, v11, v10}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BI[BII)[B

    .line 2775
    array-length v9, v2

    invoke-static {v6, v11, v4, v10, v9}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BI[BII)[B

    .line 2777
    invoke-virtual {v4}, [B->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 2779
    .local v1, "data":[B
    new-instance v8, Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-direct {v8}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;-><init>()V

    .line 2781
    .local v8, "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    invoke-virtual {v8, v1}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->PMPFromObject(Ljava/lang/Object;)Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;

    move-result-object v7

    .line 2783
    .local v7, "pmp":Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 2784
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 2785
    const/16 v9, 0x1645

    invoke-virtual {v0, v9, p1, v7}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;)V

    .line 2787
    .end local v0    # "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .end local v1    # "data":[B
    .end local v7    # "pmp":Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    .end local v8    # "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    :cond_0
    return-void

    .line 2762
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 2765
    :array_1
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 2767
    :array_2
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 2768
    :array_3
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        -0x1t
    .end array-data
.end method

.method public transferContent(Ljava/lang/String;I)V
    .locals 6
    .param p1, "contentName"    # Ljava/lang/String;
    .param p2, "deviceId"    # I

    .prologue
    const/4 v5, 0x0

    .line 689
    if-nez p1, :cond_0

    .line 691
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "Error: contentName is null"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 693
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v3, "Send Mission Done"

    invoke-virtual {v2, v3, v5}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 717
    :goto_0
    return-void

    .line 698
    :cond_0
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->manifestFromName(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    .line 700
    .local v1, "manifestItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez v1, :cond_1

    .line 702
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG:Ljava/lang/String;

    const-string v4, "Error: unable to retrieve manifest from manifest name"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 704
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v3, "Send Mission Done"

    invoke-virtual {v2, v3, v5}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    goto :goto_0

    .line 709
    :cond_1
    new-instance v0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;

    invoke-direct {v0, p0, p2, v1}, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;ILjava/util/HashMap;)V

    .line 711
    .local v0, "completion":Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$1;

    invoke-direct {v3, p0, v1, p2, v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$1;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;Ljava/util/HashMap;ILcom/disney/emagine/sdk/completion/EMTManifestCompletion;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 716
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public unregisterFromRTODeviceId(I)V
    .locals 2
    .param p1, "deviceId"    # I

    .prologue
    .line 806
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    new-instance v1, Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;

    invoke-direct {v1, p0, p1}, Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;I)V

    invoke-virtual {v0, p1, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->unregisterDevice(ILcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;)V

    .line 807
    return-void
.end method

.method public unregisterToy(I)V
    .locals 3
    .param p1, "deviceId"    # I

    .prologue
    .line 1035
    const-string v1, "{}"

    .line 1037
    .local v1, "jsonString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1038
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 1039
    const/16 v2, 0x164a

    invoke-virtual {v0, v2, p1, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 1040
    :cond_0
    return-void
.end method

.method public updateAccessToken(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "accessToken"    # Ljava/lang/String;
    .param p2, "proxyToken"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 446
    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTData;->stringToUTF8String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 447
    .local v0, "access":Ljava/lang/String;
    :goto_0
    if-eqz p2, :cond_0

    invoke-static {p2}, Lcom/disney/emagine/sdk/EMTData;->stringToUTF8String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 449
    .local v1, "proxy":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->updateAccessToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    return-void

    .end local v0    # "access":Ljava/lang/String;
    .end local v1    # "proxy":Ljava/lang/String;
    :cond_1
    move-object v0, v1

    .line 446
    goto :goto_0
.end method

.method public updateWithAccessToken(Ljava/lang/String;)V
    .locals 2
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 431
    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTFileManager;->utf8StringFromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->accessToken:Ljava/lang/String;

    .line 433
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->accessToken:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 435
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->accessToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->updateAccessToken(Ljava/lang/String;)V

    .line 437
    :cond_0
    return-void

    .line 431
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public uploadFileTransferRequest(I)V
    .locals 3
    .param p1, "deviceId"    # I

    .prologue
    .line 1414
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 1415
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 1416
    const/16 v1, 0x2339

    const-string v2, "[]"

    invoke-virtual {v0, v1, p1, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 1417
    :cond_0
    return-void
.end method

.method public uploadFirmware(Ljava/lang/String;I)V
    .locals 4
    .param p1, "fwpFilename"    # Ljava/lang/String;
    .param p2, "deviceId"    # I

    .prologue
    .line 2913
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v3, "Firmware Transfer"

    invoke-virtual {v2, v3}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isInState(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2915
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 2916
    .local v1, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->documentsDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2918
    .local v0, "filePath":Ljava/lang/String;
    const-string v2, "device_id"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2919
    const-string v2, "fwpFilename"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2921
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->tkStateMachine:Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    const-string v3, "Send Firmware"

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireOrQueueEvent(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 2923
    .end local v0    # "filePath":Ljava/lang/String;
    .end local v1    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return-void
.end method

.method public uploadFirmwareStateStart(Ljava/lang/String;I)V
    .locals 13
    .param p1, "fwpFilename"    # Ljava/lang/String;
    .param p2, "deviceId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2937
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1

    .line 2938
    :cond_0
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v3, "fwpFilename cannot be null or empty"

    invoke-direct {v8, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 2940
    .local v8, "cause":Ljava/lang/IllegalArgumentException;
    new-instance v10, Ljava/io/IOException;

    const-string v3, "fwpFilename cannot be null or empty"

    invoke-direct {v10, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 2941
    .local v10, "ioe":Ljava/io/IOException;
    invoke-virtual {v10, v8}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 2942
    throw v10

    .line 2946
    .end local v8    # "cause":Ljava/lang/IllegalArgumentException;
    .end local v10    # "ioe":Ljava/io/IOException;
    :cond_1
    const-string v3, "/"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 2948
    .local v9, "comps":[Ljava/lang/String;
    if-nez v9, :cond_2

    .line 2950
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fwpFilename could not be split on \'/\': "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v8, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 2952
    .restart local v8    # "cause":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3, v8}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 2954
    .end local v8    # "cause":Ljava/lang/IllegalArgumentException;
    :cond_2
    array-length v3, v9

    if-nez v3, :cond_3

    .line 2956
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v3, "fwpFilename split into 0 pieces."

    invoke-direct {v8, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 2958
    .restart local v8    # "cause":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3, v8}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 2961
    .end local v8    # "cause":Ljava/lang/IllegalArgumentException;
    :cond_3
    array-length v3, v9

    add-int/lit8 v3, v3, -0x1

    aget-object v11, v9, v3

    .line 2962
    .local v11, "molaFileName":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "firmware/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, v9

    add-int/lit8 v4, v4, -0x1

    aget-object v4, v9, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2964
    .local v1, "molaPath":Ljava/lang/String;
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTFileManager;->bytesFromFile(Ljava/lang/String;)[B

    move-result-object v2

    .line 2966
    .local v2, "fwpData":[B
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 2967
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_4

    .line 2968
    const/4 v3, 0x1

    int-to-long v4, p2

    const/4 v6, 0x0

    new-instance v7, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;

    array-length v12, v2

    invoke-direct {v7, p0, p2, v11, v12}, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;ILjava/lang/String;I)V

    invoke-virtual/range {v0 .. v7}, Lcom/disney/emagine/sdk/ble/EMTDevice;->transferFile(Ljava/lang/String;[BIJZLcom/disney/emagine/sdk/delegate/EMTTransferDelegate;)V

    .line 2969
    :cond_4
    return-void
.end method
