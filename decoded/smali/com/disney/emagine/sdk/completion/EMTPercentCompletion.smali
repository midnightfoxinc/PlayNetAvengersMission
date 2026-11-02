.class public Lcom/disney/emagine/sdk/completion/EMTPercentCompletion;
.super Ljava/lang/Object;
.source "EMTPercentCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;


# instance fields
.field delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

.field percentage:C

.field remainingTime:I


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;)V
    .locals 1
    .param p1, "del"    # Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-char v0, p0, Lcom/disney/emagine/sdk/completion/EMTPercentCompletion;->percentage:C

    .line 22
    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTPercentCompletion;->remainingTime:I

    .line 27
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTPercentCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    .line 28
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 38
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;ZII)V
    .locals 7
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "finished"    # Z
    .param p3, "percentage"    # I
    .param p4, "remainingTime"    # I

    .prologue
    .line 32
    iget-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTPercentCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    invoke-interface {v0}, Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTPercentCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    invoke-interface {v1}, Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;->TAG()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Mission transfer: %d%%, remaining time = %d seconds"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    return-void
.end method
