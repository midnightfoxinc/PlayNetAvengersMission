.class public Lcom/disney/emagine/sdk/completion/EMTMissionCompletion;
.super Ljava/lang/Object;
.source "EMTMissionCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;


# instance fields
.field delegate:Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;

.field deviceId:I

.field manifestItem:Ljava/util/HashMap;
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


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;Ljava/util/HashMap;I)V
    .locals 1
    .param p1, "del"    # Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;
    .param p3, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTMissionCompletion;->deviceId:I

    .line 29
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTMissionCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;

    .line 30
    iput-object p2, p0, Lcom/disney/emagine/sdk/completion/EMTMissionCompletion;->manifestItem:Ljava/util/HashMap;

    .line 31
    iput p3, p0, Lcom/disney/emagine/sdk/completion/EMTMissionCompletion;->deviceId:I

    .line 32
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 49
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;ZII)V
    .locals 8
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "finished"    # Z
    .param p3, "percentage"    # I
    .param p4, "remainingTime"    # I

    .prologue
    .line 36
    iget-object v2, p0, Lcom/disney/emagine/sdk/completion/EMTMissionCompletion;->manifestItem:Ljava/util/HashMap;

    const-string v3, "type"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 38
    .local v1, "type":I
    if-eqz v1, :cond_0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 40
    :cond_0
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sharedInstance()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v0

    .line 42
    .local v0, "manager":Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    iget-object v2, p0, Lcom/disney/emagine/sdk/completion/EMTMissionCompletion;->manifestItem:Ljava/util/HashMap;

    iget v3, p0, Lcom/disney/emagine/sdk/completion/EMTMissionCompletion;->deviceId:I

    new-instance v4, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;

    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTMissionCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTMissionCompletion;->manifestItem:Ljava/util/HashMap;

    iget v7, p0, Lcom/disney/emagine/sdk/completion/EMTMissionCompletion;->deviceId:I

    invoke-direct {v4, v5, v6, v7}, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;-><init>(Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;Ljava/util/HashMap;I)V

    invoke-virtual {v0, v2, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sendMission(Ljava/util/HashMap;ILcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;)V

    .line 44
    .end local v0    # "manager":Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    :cond_1
    return-void
.end method
