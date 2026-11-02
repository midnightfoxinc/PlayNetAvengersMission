.class public Lcom/disney/emagine/sdk/EMTCallback;
.super Ljava/lang/Object;
.source "EMTCallback.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static instance:Lcom/disney/emagine/sdk/EMTCallback;


# instance fields
.field private delegate:Lcom/disney/emagine/sdk/delegate/EMTCallbackDelegate;

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const-class v0, Lcom/disney/emagine/sdk/EMTCallback;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/EMTCallback;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/EMTCallback;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 37
    return-void
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/disney/emagine/sdk/EMTCallback;->instance:Lcom/disney/emagine/sdk/EMTCallback;

    if-nez v0, :cond_0

    .line 43
    new-instance v0, Lcom/disney/emagine/sdk/EMTCallback;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/EMTCallback;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/EMTCallback;->instance:Lcom/disney/emagine/sdk/EMTCallback;

    .line 46
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/EMTCallback;->instance:Lcom/disney/emagine/sdk/EMTCallback;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 440
    return-void
.end method

.method public sendAppEvent(ILjava/lang/String;)V
    .locals 4
    .param p1, "event"    # I
    .param p2, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 429
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTCallback;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/EMTCallback;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendAppEvent event="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " jsonData="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 430
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTCallback;->delegate:Lcom/disney/emagine/sdk/delegate/EMTCallbackDelegate;

    if-eqz v0, :cond_0

    .line 432
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTCallback;->delegate:Lcom/disney/emagine/sdk/delegate/EMTCallbackDelegate;

    invoke-interface {v0, p1, p2}, Lcom/disney/emagine/sdk/delegate/EMTCallbackDelegate;->BLECallback(ILjava/lang/String;)V

    .line 434
    :cond_0
    return-void
.end method

.method public setDelegate(Lcom/disney/emagine/sdk/delegate/EMTCallbackDelegate;)V
    .locals 0
    .param p1, "delegate"    # Lcom/disney/emagine/sdk/delegate/EMTCallbackDelegate;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/disney/emagine/sdk/EMTCallback;->delegate:Lcom/disney/emagine/sdk/delegate/EMTCallbackDelegate;

    .line 52
    return-void
.end method
