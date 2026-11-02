.class Lcom/disneymobile/analytics/DMOAnalyticsConnection;
.super Ljava/lang/Object;
.source "DMOAnalyticsConnection.java"


# static fields
.field public static TAG:Ljava/lang/String;

.field private static sharedAnalyticsConnection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;


# instance fields
.field private backendConnection:Lcom/disneymobile/network/DMOBackendConnection;

.field private canPost:Z

.field private mBacklogQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mOutboundQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-string v0, "DMOAnalytics"

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->TAG:Ljava/lang/String;

    .line 42
    const/4 v0, 0x0

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->sharedAnalyticsConnection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mBacklogQueue:Ljava/util/ArrayList;

    return-void
.end method

.method private addBacklogResponse(Lcom/disneymobile/network/DMOBackendResponse;)V
    .locals 2
    .param p1, "response"    # Lcom/disneymobile/network/DMOBackendResponse;

    .prologue
    .line 229
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mBacklogQueue:Ljava/util/ArrayList;

    invoke-direct {p0, v0, p1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->hasDuplicateResponse(Ljava/util/ArrayList;Lcom/disneymobile/network/DMOBackendResponse;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 230
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mBacklogQueue:Ljava/util/ArrayList;

    monitor-enter v1

    .line 231
    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p1, v0}, Lcom/disneymobile/network/DMOBackendResponse;->setPending(Z)V

    .line 232
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mBacklogQueue:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 233
    monitor-exit v1

    .line 235
    :cond_0
    return-void

    .line 233
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private addResponseQueue(Lcom/disneymobile/network/DMOBackendResponse;)V
    .locals 2
    .param p1, "response"    # Lcom/disneymobile/network/DMOBackendResponse;

    .prologue
    .line 270
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {}, Lcom/disneymobile/mocha/support/BacklogManager;->getMagicQNumber()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 271
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->saveQueue()V

    .line 274
    :cond_0
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    invoke-direct {p0, v0, p1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->hasDuplicateResponse(Ljava/util/ArrayList;Lcom/disneymobile/network/DMOBackendResponse;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 275
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    monitor-enter v1

    .line 276
    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p1, v0}, Lcom/disneymobile/network/DMOBackendResponse;->setPending(Z)V

    .line 277
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 278
    monitor-exit v1

    .line 280
    :cond_1
    return-void

    .line 278
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static getSharedAnalyticsConnection()Lcom/disneymobile/analytics/DMOAnalyticsConnection;
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->sharedAnalyticsConnection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    if-nez v0, :cond_0

    .line 52
    new-instance v0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    invoke-direct {v0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;-><init>()V

    invoke-direct {v0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->init()Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    move-result-object v0

    sput-object v0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->sharedAnalyticsConnection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    .line 53
    :cond_0
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->sharedAnalyticsConnection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    return-object v0
.end method

.method private hasDuplicateResponse(Ljava/util/ArrayList;Lcom/disneymobile/network/DMOBackendResponse;)Z
    .locals 7
    .param p2, "response"    # Lcom/disneymobile/network/DMOBackendResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/disneymobile/network/DMOBackendResponse;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 284
    .local p1, "queue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 286
    .local v0, "hasDuplicate":Z
    invoke-virtual {p2}, Lcom/disneymobile/network/DMOBackendResponse;->_params()Ljava/util/HashMap;

    move-result-object v1

    .line 288
    .local v1, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    monitor-enter p1

    .line 289
    :try_start_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 290
    .local v2, "queueIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Object;>;"
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 291
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/disneymobile/network/DMOBackendResponse;

    .line 293
    .local v4, "queuedResponse":Lcom/disneymobile/network/DMOBackendResponse;
    if-nez v4, :cond_1

    .line 296
    const/4 v0, 0x1

    .line 297
    goto :goto_0

    .line 300
    :cond_1
    invoke-virtual {v4}, Lcom/disneymobile/network/DMOBackendResponse;->_params()Ljava/util/HashMap;

    move-result-object v3

    .line 301
    .local v3, "queuedParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "method"

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "method"

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, "timestamp"

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "timestamp"

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 303
    const-string v5, "data"

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3

    const-string v5, "data"

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "data"

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 304
    const/4 v0, 0x1

    .line 311
    .end local v3    # "queuedParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "queuedResponse":Lcom/disneymobile/network/DMOBackendResponse;
    :cond_2
    :goto_1
    monitor-exit p1

    .line 313
    return v0

    .line 305
    .restart local v3    # "queuedParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v4    # "queuedResponse":Lcom/disneymobile/network/DMOBackendResponse;
    :cond_3
    const-string v5, "data"

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_2

    .line 306
    const/4 v0, 0x1

    goto :goto_1

    .line 311
    .end local v2    # "queueIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Object;>;"
    .end local v3    # "queuedParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "queuedResponse":Lcom/disneymobile/network/DMOBackendResponse;
    :catchall_0
    move-exception v5

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5
.end method

.method private init()Lcom/disneymobile/analytics/DMOAnalyticsConnection;
    .locals 1

    .prologue
    .line 84
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->initWithBackendConnection(Lcom/disneymobile/network/DMOBackendConnection;)Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    move-result-object v0

    return-object v0
.end method

.method private static isNewUser()Ljava/lang/Integer;
    .locals 4

    .prologue
    .line 368
    const-string v1, "is_new_user"

    .line 370
    .local v1, "key":Ljava/lang/String;
    invoke-static {}, Lcom/disneymobile/mocha/NSUserDefaults;->standardUserDefaults()Lcom/disneymobile/mocha/NSUserDefaults;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/disneymobile/mocha/NSUserDefaults;->integerForKey(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 373
    .local v0, "isNewUser":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 374
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 375
    invoke-static {}, Lcom/disneymobile/mocha/NSUserDefaults;->standardUserDefaults()Lcom/disneymobile/mocha/NSUserDefaults;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcom/disneymobile/mocha/NSUserDefaults;->setIntegerForKey(Ljava/lang/Integer;Ljava/lang/String;)V

    .line 378
    :cond_0
    return-object v0
.end method


# virtual methods
.method public _handleReturnResponse(Ljava/lang/Object;)V
    .locals 3
    .param p1, "r"    # Ljava/lang/Object;
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 322
    move-object v0, p1

    check-cast v0, Lcom/disneymobile/network/DMOBackendResponse;

    .line 324
    .local v0, "response":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {v0}, Lcom/disneymobile/network/DMOBackendResponse;->ok()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 326
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/disneymobile/network/DMOBackendResponse;->setPending(Z)V

    .line 328
    iget-object v2, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    monitor-enter v2

    .line 329
    :try_start_0
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 330
    monitor-exit v2

    .line 332
    :cond_0
    return-void

    .line 330
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public _handleReturnResponseForBacklog(Ljava/lang/Object;)V
    .locals 3
    .param p1, "r"    # Ljava/lang/Object;
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 210
    move-object v0, p1

    check-cast v0, Lcom/disneymobile/network/DMOBackendResponse;

    .line 212
    .local v0, "response":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {v0}, Lcom/disneymobile/network/DMOBackendResponse;->ok()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 214
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/disneymobile/network/DMOBackendResponse;->setPending(Z)V

    .line 217
    iget-object v2, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mBacklogQueue:Ljava/util/ArrayList;

    monitor-enter v2

    .line 218
    :try_start_0
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mBacklogQueue:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 219
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 222
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mBacklogQueue:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 223
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->restoreQueue()V

    .line 226
    :cond_0
    return-void

    .line 219
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public analyticsEnd(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 3
    .param p1, "appState"    # Ljava/lang/String;

    .prologue
    .line 463
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->backendConnection:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v1}, Lcom/disneymobile/network/DMOBackendConnection;->analytics()Lcom/disneymobile/network/DMOBackendConnection$Analytics;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->callAnalyticsRemoteMethodWithContext(Ljava/lang/String;Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    .line 466
    .local v0, "response":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->getCanPost()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 467
    new-instance v1, Lcom/disneymobile/mocha/support/Selector;

    const-string v2, "_handleReturnResponse"

    invoke-direct {v1, v2}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Lcom/disneymobile/network/DMOBackendResponse;->returnTargetAndAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V

    .line 468
    :cond_0
    invoke-direct {p0, v0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->addResponseQueue(Lcom/disneymobile/network/DMOBackendResponse;)V

    .line 469
    return-object v0
.end method

.method public analyticsEvent(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 3
    .param p1, "event"    # Ljava/lang/String;

    .prologue
    .line 483
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->backendConnection:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v1}, Lcom/disneymobile/network/DMOBackendConnection;->analytics()Lcom/disneymobile/network/DMOBackendConnection$Analytics;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->callAnalyticsRemoteMethodWithContext(Ljava/lang/String;Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    .line 486
    .local v0, "response":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->getCanPost()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 487
    new-instance v1, Lcom/disneymobile/mocha/support/Selector;

    const-string v2, "_handleReturnResponse"

    invoke-direct {v1, v2}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Lcom/disneymobile/network/DMOBackendResponse;->returnTargetAndAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V

    .line 488
    :cond_0
    invoke-direct {p0, v0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->addResponseQueue(Lcom/disneymobile/network/DMOBackendResponse;)V

    .line 489
    return-object v0
.end method

.method public analyticsEventWithContext(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 3
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "details"    # Lorg/json/JSONObject;

    .prologue
    .line 504
    if-nez p2, :cond_0

    .line 505
    new-instance p2, Lorg/json/JSONObject;

    .end local p2    # "details":Lorg/json/JSONObject;
    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 508
    .restart local p2    # "details":Lorg/json/JSONObject;
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->backendConnection:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v1}, Lcom/disneymobile/network/DMOBackendConnection;->analytics()Lcom/disneymobile/network/DMOBackendConnection$Analytics;

    move-result-object v1

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->callAnalyticsRemoteMethodWithContext(Ljava/lang/String;Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v0

    .line 511
    .local v0, "response":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->getCanPost()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 512
    new-instance v1, Lcom/disneymobile/mocha/support/Selector;

    const-string v2, "_handleReturnResponse"

    invoke-direct {v1, v2}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Lcom/disneymobile/network/DMOBackendResponse;->returnTargetAndAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V

    .line 513
    :cond_1
    invoke-direct {p0, v0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->addResponseQueue(Lcom/disneymobile/network/DMOBackendResponse;)V

    .line 514
    return-object v0
.end method

.method public analyticsForeground(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 4
    .param p1, "appState"    # Ljava/lang/String;

    .prologue
    .line 443
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 445
    .local v0, "eventInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "tag"

    const-string v3, "clicked_link"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    const-string v2, "is_new_user"

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->isNewUser()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    iget-object v2, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->backendConnection:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v2}, Lcom/disneymobile/network/DMOBackendConnection;->analytics()Lcom/disneymobile/network/DMOBackendConnection$Analytics;

    move-result-object v2

    invoke-virtual {v2, p1, v0}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->callInitialAnalyticsRemoteMethodWithParameters(Ljava/lang/String;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v1

    .line 449
    .local v1, "response":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->getCanPost()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isGidaAvailable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 450
    new-instance v2, Lcom/disneymobile/mocha/support/Selector;

    const-string v3, "_handleReturnResponse"

    invoke-direct {v2, v3}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0, v2}, Lcom/disneymobile/network/DMOBackendResponse;->returnTargetAndAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V

    .line 451
    :cond_0
    invoke-direct {p0, v1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->addResponseQueue(Lcom/disneymobile/network/DMOBackendResponse;)V

    .line 452
    return-object v1
.end method

.method public analyticsStart(Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 4
    .param p1, "appState"    # Ljava/lang/String;

    .prologue
    .line 342
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 344
    .local v0, "eventInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalytics;->getSysInfo()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 345
    const-string v2, "tag"

    const-string v3, "clicked_link"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    const-string v2, "is_new_user"

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->isNewUser()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    iget-object v2, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->backendConnection:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v2}, Lcom/disneymobile/network/DMOBackendConnection;->analytics()Lcom/disneymobile/network/DMOBackendConnection$Analytics;

    move-result-object v2

    invoke-virtual {v2, p1, v0}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->callInitialAnalyticsRemoteMethodWithParameters(Ljava/lang/String;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v1

    .line 355
    .local v1, "response":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->getCanPost()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isGidaAvailable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 356
    new-instance v2, Lcom/disneymobile/mocha/support/Selector;

    const-string v3, "_handleReturnResponse"

    invoke-direct {v2, v3}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0, v2}, Lcom/disneymobile/network/DMOBackendResponse;->returnTargetAndAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V

    .line 357
    :cond_0
    invoke-direct {p0, v1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->addResponseQueue(Lcom/disneymobile/network/DMOBackendResponse;)V

    .line 358
    return-object v1
.end method

.method public flushQueue()V
    .locals 6

    .prologue
    .line 245
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->getCanPost()Z

    move-result v3

    if-nez v3, :cond_1

    .line 260
    :cond_0
    :goto_0
    return-void

    .line 246
    :cond_1
    iget-object v3, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 247
    .local v0, "count":I
    if-lez v0, :cond_0

    .line 250
    iget-object v4, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    monitor-enter v4

    .line 251
    :try_start_0
    iget-object v3, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 252
    .local v1, "queueIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Object;>;"
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 253
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/disneymobile/network/DMOBackendResponse;

    .line 255
    .local v2, "response":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {v2}, Lcom/disneymobile/network/DMOBackendResponse;->isPending()Z

    move-result v3

    if-nez v3, :cond_2

    .line 256
    new-instance v3, Lcom/disneymobile/mocha/support/Selector;

    const-string v5, "_handleReturnResponse"

    invoke-direct {v3, v5}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0, v3}, Lcom/disneymobile/network/DMOBackendResponse;->returnTargetAndAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V

    goto :goto_1

    .line 259
    .end local v1    # "queueIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Object;>;"
    .end local v2    # "response":Lcom/disneymobile/network/DMOBackendResponse;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .restart local v1    # "queueIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Object;>;"
    :cond_3
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public gameAction(Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 4
    .param p1, "eventContext"    # Lorg/json/JSONObject;

    .prologue
    .line 389
    if-nez p1, :cond_0

    .line 390
    new-instance p1, Lorg/json/JSONObject;

    .end local p1    # "eventContext":Lorg/json/JSONObject;
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 393
    .restart local p1    # "eventContext":Lorg/json/JSONObject;
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 394
    .local v0, "eventInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "tag"

    const-string v3, "game_action"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    const-string v2, "data"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    iget-object v2, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->backendConnection:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v2}, Lcom/disneymobile/network/DMOBackendConnection;->analytics()Lcom/disneymobile/network/DMOBackendConnection$Analytics;

    move-result-object v2

    const-string v3, "game_action"

    invoke-virtual {v2, v3, v0}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->callInitialAnalyticsRemoteMethodWithParameters(Ljava/lang/String;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v1

    .line 400
    .local v1, "response":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->getCanPost()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 401
    new-instance v2, Lcom/disneymobile/mocha/support/Selector;

    const-string v3, "_handleReturnResponse"

    invoke-direct {v2, v3}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0, v2}, Lcom/disneymobile/network/DMOBackendResponse;->returnTargetAndAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V

    .line 402
    :cond_1
    invoke-direct {p0, v1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->addResponseQueue(Lcom/disneymobile/network/DMOBackendResponse;)V

    .line 403
    return-object v1
.end method

.method public getCanPost()Z
    .locals 1

    .prologue
    .line 103
    iget-boolean v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->canPost:Z

    return v0
.end method

.method public initWithBackendConnection(Lcom/disneymobile/network/DMOBackendConnection;)Lcom/disneymobile/analytics/DMOAnalyticsConnection;
    .locals 2
    .param p1, "bconn"    # Lcom/disneymobile/network/DMOBackendConnection;

    .prologue
    .line 63
    if-eqz p1, :cond_0

    .line 64
    iput-object p1, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->backendConnection:Lcom/disneymobile/network/DMOBackendConnection;

    .line 72
    sput-object p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->sharedAnalyticsConnection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    .line 73
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->sharedAnalyticsConnection:Lcom/disneymobile/analytics/DMOAnalyticsConnection;

    return-object v0

    .line 67
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "FAIL: initWithBackendConnection: called with a nil parameter!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isGidaCollected()Z
    .locals 1

    .prologue
    .line 93
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isGidaCollected()Z

    move-result v0

    return v0
.end method

.method public moneyAction(Lorg/json/JSONObject;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 4
    .param p1, "eventContext"    # Lorg/json/JSONObject;

    .prologue
    .line 416
    if-nez p1, :cond_0

    .line 417
    new-instance p1, Lorg/json/JSONObject;

    .end local p1    # "eventContext":Lorg/json/JSONObject;
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 420
    .restart local p1    # "eventContext":Lorg/json/JSONObject;
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 421
    .local v0, "eventInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "tag"

    const-string v3, "money"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 422
    const-string v2, "data"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 423
    const-string v2, "source"

    const-string v3, "CCBILL"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    const-string v2, "subtype"

    const-string v3, "CCBILL"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    iget-object v2, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->backendConnection:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v2}, Lcom/disneymobile/network/DMOBackendConnection;->analytics()Lcom/disneymobile/network/DMOBackendConnection$Analytics;

    move-result-object v2

    const-string v3, "money"

    invoke-virtual {v2, v3, v0}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->callInitialAnalyticsRemoteMethodWithParameters(Ljava/lang/String;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v1

    .line 429
    .local v1, "response":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->getCanPost()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 430
    new-instance v2, Lcom/disneymobile/mocha/support/Selector;

    const-string v3, "_handleReturnResponse"

    invoke-direct {v2, v3}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0, v2}, Lcom/disneymobile/network/DMOBackendResponse;->returnTargetAndAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V

    .line 431
    :cond_1
    invoke-direct {p0, v1}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->addResponseQueue(Lcom/disneymobile/network/DMOBackendResponse;)V

    .line 432
    return-object v1
.end method

.method public restoreQueue()V
    .locals 4

    .prologue
    .line 159
    invoke-static {}, Lcom/disneymobile/mocha/support/BacklogManager;->loadOneBacklogQ()V

    .line 161
    invoke-static {}, Lcom/disneymobile/mocha/support/BacklogManager;->getInMemBacklogRequests()Ljava/util/ArrayList;

    move-result-object v2

    .line 164
    .local v2, "inMemBacklogRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disneymobile/mocha/support/BacklogRequest;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 166
    .local v1, "backlogRequestIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/disneymobile/mocha/support/BacklogRequest;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 167
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/support/BacklogRequest;

    .line 168
    .local v0, "backlogRequest":Lcom/disneymobile/mocha/support/BacklogRequest;
    invoke-virtual {p0, v0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->sendBacklogEvent(Lcom/disneymobile/mocha/support/BacklogRequest;)Lcom/disneymobile/network/DMOBackendResponse;

    goto :goto_0

    .line 170
    .end local v0    # "backlogRequest":Lcom/disneymobile/mocha/support/BacklogRequest;
    :cond_0
    return-void
.end method

.method public saveQueue()V
    .locals 11

    .prologue
    .line 118
    const-wide/16 v2, 0x0

    .line 119
    .local v2, "elapsed":J
    invoke-static {}, Lcom/disneymobile/mocha/support/BacklogManager;->getUnixTimeStamp()J

    move-result-wide v6

    .line 121
    .local v6, "now":J
    :try_start_0
    invoke-static {}, Lcom/disneymobile/mocha/NSUserDefaults;->backlogSettings()Lcom/disneymobile/mocha/NSUserDefaults;

    move-result-object v1

    .line 122
    .local v1, "settings":Lcom/disneymobile/mocha/NSUserDefaults;
    const-string v8, "lastReadOn"

    invoke-virtual {v1, v8}, Lcom/disneymobile/mocha/NSUserDefaults;->longForKey(Ljava/lang/String;)J

    move-result-wide v4

    .line 123
    .local v4, "lastReadOn":J
    const-wide/16 v8, 0x0

    cmp-long v8, v4, v8

    if-nez v8, :cond_0

    .line 124
    invoke-static {}, Lcom/disneymobile/mocha/NSUserDefaults;->backlogSettings()Lcom/disneymobile/mocha/NSUserDefaults;

    move-result-object v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const-string v10, "lastReadOn"

    invoke-virtual {v8, v9, v10}, Lcom/disneymobile/mocha/NSUserDefaults;->setLongForKey(Ljava/lang/Long;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    move-wide v4, v6

    .line 127
    :cond_0
    sub-long v2, v6, v4

    .line 136
    .end local v1    # "settings":Lcom/disneymobile/mocha/NSUserDefaults;
    .end local v4    # "lastReadOn":J
    :goto_0
    const-wide/16 v8, 0x1e

    cmp-long v8, v2, v8

    if-lez v8, :cond_1

    .line 138
    iget-object v9, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mBacklogQueue:Ljava/util/ArrayList;

    monitor-enter v9

    .line 139
    :try_start_1
    iget-object v8, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mBacklogQueue:Ljava/util/ArrayList;

    invoke-static {v8}, Lcom/disneymobile/mocha/support/BacklogManager;->splitNPersistQs(Ljava/util/ArrayList;)V

    .line 140
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 143
    :cond_1
    iget-object v9, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    monitor-enter v9

    .line 144
    :try_start_2
    iget-object v8, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    invoke-static {v8}, Lcom/disneymobile/mocha/support/BacklogManager;->splitNPersistQs(Ljava/util/ArrayList;)V

    .line 145
    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 148
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mBacklogQueue:Ljava/util/ArrayList;

    .line 149
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->mOutboundQueue:Ljava/util/ArrayList;

    .line 150
    return-void

    .line 128
    :catch_0
    move-exception v0

    .line 129
    .local v0, "e":Ljava/lang/Exception;
    sget-object v8, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->TAG:Ljava/lang/String;

    const-string v9, "Failed to read lastReadOn timestamp. Initializing default timestamp"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    invoke-static {}, Lcom/disneymobile/mocha/NSUserDefaults;->backlogSettings()Lcom/disneymobile/mocha/NSUserDefaults;

    move-result-object v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const-string v10, "lastReadOn"

    invoke-virtual {v8, v9, v10}, Lcom/disneymobile/mocha/NSUserDefaults;->setLongForKey(Ljava/lang/Long;Ljava/lang/String;)V

    goto :goto_0

    .line 140
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    :try_start_3
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v8

    .line 145
    :catchall_1
    move-exception v8

    :try_start_4
    monitor-exit v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v8
.end method

.method public sendBacklogEvent(Lcom/disneymobile/mocha/support/BacklogRequest;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 6
    .param p1, "backlogRequest"    # Lcom/disneymobile/mocha/support/BacklogRequest;

    .prologue
    .line 186
    invoke-virtual {p1}, Lcom/disneymobile/mocha/support/BacklogRequest;->getMethodName()Ljava/lang/String;

    move-result-object v1

    .line 187
    .local v1, "methodName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/disneymobile/mocha/support/BacklogRequest;->getTrackingInfo()Ljava/util/HashMap;

    move-result-object v3

    .line 188
    .local v3, "trackingInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1}, Lcom/disneymobile/mocha/support/BacklogRequest;->getData()Ljava/lang/Object;

    move-result-object v0

    .line 192
    .local v0, "data":Ljava/lang/Object;
    iget-object v4, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->backendConnection:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v4}, Lcom/disneymobile/network/DMOBackendConnection;->analytics()Lcom/disneymobile/network/DMOBackendConnection$Analytics;

    move-result-object v4

    invoke-virtual {v4, v1, v3, v0}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->callAnalyticsRemoteMethod(Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/Object;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v2

    .line 195
    .local v2, "response":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->getCanPost()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v2}, Lcom/disneymobile/network/DMOBackendResponse;->isPending()Z

    move-result v4

    if-nez v4, :cond_0

    .line 196
    new-instance v4, Lcom/disneymobile/mocha/support/Selector;

    const-string v5, "_handleReturnResponseForBacklog"

    invoke-direct {v4, v5}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0, v4}, Lcom/disneymobile/network/DMOBackendResponse;->returnTargetAndAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V

    .line 200
    :cond_0
    invoke-direct {p0, v2}, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->addBacklogResponse(Lcom/disneymobile/network/DMOBackendResponse;)V

    .line 201
    return-object v2
.end method

.method public setCanPost(Z)V
    .locals 0
    .param p1, "boolCanPost"    # Z

    .prologue
    .line 106
    iput-boolean p1, p0, Lcom/disneymobile/analytics/DMOAnalyticsConnection;->canPost:Z

    .line 107
    return-void
.end method
