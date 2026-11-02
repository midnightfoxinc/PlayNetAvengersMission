.class public Lcom/disney/emagine/sdk/completion/EMTLoginSuccess;
.super Ljava/lang/Object;
.source "EMTLoginSuccess.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-class v0, Lcom/disney/emagine/sdk/completion/EMTLoginSuccess;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/completion/EMTLoginSuccess;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 0
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTLoginSuccess;->mDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    .line 24
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 27
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v3

    sget-object v4, Lcom/disney/emagine/sdk/completion/EMTLoginSuccess;->TAG:Ljava/lang/String;

    const-string v5, "Login success"

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    iget-object v3, p0, Lcom/disney/emagine/sdk/completion/EMTLoginSuccess;->mDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    iget-wide v0, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    .line 31
    .local v0, "deviceId":J
    iget-object v3, p0, Lcom/disney/emagine/sdk/completion/EMTLoginSuccess;->mDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    iget v2, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceType:I

    .line 33
    .local v2, "deviceType":I
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sharedInstance()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v3

    long-to-int v4, v0

    int-to-short v5, v2

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v5, v6}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->getEntitlements(ISLcom/disney/emagine/sdk/completion/EMTManifestSuccess;)V

    .line 34
    return-void
.end method
