.class public Lcom/disneymobile/network/DMOBackendResponse;
.super Lcom/disneymobile/mocha/NSObject;
.source "DMOBackendResponse.java"


# static fields
.field private static DMOBackendMutex:Ljava/lang/String;

.field private static DMOBackendResponseCount:I

.field public static kDMOBackendConnectionFailureNotification:Ljava/lang/String;

.field private static multipartSeparator:Ljava/lang/String;


# instance fields
.field _params:Ljava/util/HashMap;
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

.field _response:Ljava/util/HashMap;
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

.field connection:Lcom/disneymobile/network/DMOBackendConnection;

.field dontReturn:Z

.field httpRequest:Lcom/disneymobile/network/DMOHTTPRequest;

.field private isPending:Z

.field object:Ljava/lang/Object;

.field request:Lcom/disneymobile/mocha/NSMutableURLRequest;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "GOGO-87dae883c6039b244c0d341f45f8-SEP"

    sput-object v0, Lcom/disneymobile/network/DMOBackendResponse;->multipartSeparator:Ljava/lang/String;

    .line 20
    const-string v0, "mutex"

    sput-object v0, Lcom/disneymobile/network/DMOBackendResponse;->DMOBackendMutex:Ljava/lang/String;

    .line 21
    const/4 v0, 0x0

    sput v0, Lcom/disneymobile/network/DMOBackendResponse;->DMOBackendResponseCount:I

    .line 22
    const-string v0, "BackendConnectionFailureNotification"

    sput-object v0, Lcom/disneymobile/network/DMOBackendResponse;->kDMOBackendConnectionFailureNotification:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    return-void
.end method

.method private _asyncFetchResponse(Ljava/util/HashMap;)V
    .locals 4
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
    .line 274
    .local p1, "details":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v1, Lcom/disneymobile/network/DMOBackendResponse;->DMOBackendMutex:Ljava/lang/String;

    monitor-enter v1

    .line 275
    :try_start_0
    sget v0, Lcom/disneymobile/network/DMOBackendResponse;->DMOBackendResponseCount:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/disneymobile/network/DMOBackendResponse;->DMOBackendResponseCount:I

    .line 276
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 285
    const-string v0, "request"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSURLRequest;

    invoke-static {v0}, Lcom/disneymobile/network/DMOHTTPRequest;->dataWithRequest(Lcom/disneymobile/mocha/NSURLRequest;)Lcom/disneymobile/network/DMOHTTPRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->httpRequest:Lcom/disneymobile/network/DMOHTTPRequest;

    .line 286
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->httpRequest:Lcom/disneymobile/network/DMOHTTPRequest;

    new-instance v1, Lcom/disneymobile/mocha/support/Selector;

    const-string v2, "_httpRequestDone"

    invoke-direct {v1, v2}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    new-instance v2, Lcom/disneymobile/mocha/support/Selector;

    const-string v3, "_httpRequestDone"

    invoke-direct {v2, v3}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1, v2}, Lcom/disneymobile/network/DMOHTTPRequest;->setTargetDoneActionAndErrorAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Lcom/disneymobile/mocha/support/Selector;)V

    .line 287
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->httpRequest:Lcom/disneymobile/network/DMOHTTPRequest;

    invoke-virtual {v0, p1}, Lcom/disneymobile/network/DMOHTTPRequest;->setObject(Ljava/lang/Object;)V

    .line 289
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->httpRequest:Lcom/disneymobile/network/DMOHTTPRequest;

    invoke-virtual {v0}, Lcom/disneymobile/network/DMOHTTPRequest;->startRequest()V

    .line 290
    return-void

    .line 276
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private _asyncResponseDone(Ljava/util/HashMap;)V
    .locals 6
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
    .local p1, "results":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v5, 0x3

    const/4 v4, 0x2

    .line 297
    sget-object v3, Lcom/disneymobile/network/DMOBackendResponse;->DMOBackendMutex:Ljava/lang/String;

    monitor-enter v3

    .line 298
    :try_start_0
    sget v2, Lcom/disneymobile/network/DMOBackendResponse;->DMOBackendResponseCount:I

    add-int/lit8 v2, v2, -0x1

    sput v2, Lcom/disneymobile/network/DMOBackendResponse;->DMOBackendResponseCount:I

    .line 299
    sget v2, Lcom/disneymobile/network/DMOBackendResponse;->DMOBackendResponseCount:I

    if-nez v2, :cond_0

    .line 302
    :cond_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 305
    const-string v2, "response"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    iput-object v2, p0, Lcom/disneymobile/network/DMOBackendResponse;->_response:Ljava/util/HashMap;

    .line 306
    invoke-virtual {p0}, Lcom/disneymobile/network/DMOBackendResponse;->response()Ljava/util/HashMap;

    .line 308
    iget-boolean v2, p0, Lcom/disneymobile/network/DMOBackendResponse;->dontReturn:Z

    if-nez v2, :cond_3

    .line 309
    const-string v2, "return"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSInvocation;

    .line 310
    .local v0, "call":Lcom/disneymobile/mocha/NSInvocation;
    invoke-virtual {v0}, Lcom/disneymobile/mocha/NSInvocation;->methodSignature()Lcom/disneymobile/mocha/NSMethodSignature;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disneymobile/mocha/NSMethodSignature;->numberOfArguments()I

    move-result v2

    if-le v2, v4, :cond_1

    .line 311
    invoke-virtual {v0, p0, v4}, Lcom/disneymobile/mocha/NSInvocation;->setArgumentAtIndex(Ljava/lang/Object;I)Lcom/disneymobile/mocha/NSError;

    .line 313
    :cond_1
    const-string v2, "userData"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Lcom/disneymobile/mocha/NSInvocation;->methodSignature()Lcom/disneymobile/mocha/NSMethodSignature;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disneymobile/mocha/NSMethodSignature;->numberOfArguments()I

    move-result v2

    if-le v2, v5, :cond_2

    .line 314
    const-string v2, "userData"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 315
    .local v1, "userData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v0, v1, v5}, Lcom/disneymobile/mocha/NSInvocation;->setArgumentAtIndex(Ljava/lang/Object;I)Lcom/disneymobile/mocha/NSError;

    .line 317
    .end local v1    # "userData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/disneymobile/mocha/NSInvocation;->invokeWithError(Lcom/disneymobile/mocha/support/Out;)Ljava/lang/Object;

    .line 323
    .end local v0    # "call":Lcom/disneymobile/mocha/NSInvocation;
    :cond_3
    return-void

    .line 302
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method private _fetchResponseForRequest(Lcom/disneymobile/mocha/NSURLRequest;)Ljava/util/HashMap;
    .locals 8
    .param p1, "inRequest"    # Lcom/disneymobile/mocha/NSURLRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/NSURLRequest;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 245
    new-instance v3, Lcom/disneymobile/mocha/support/Out;

    invoke-direct {v3}, Lcom/disneymobile/mocha/support/Out;-><init>()V

    .line 246
    .local v3, "response":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSURLResponse;>;"
    new-instance v1, Lcom/disneymobile/mocha/support/Out;

    invoke-direct {v1}, Lcom/disneymobile/mocha/support/Out;-><init>()V

    .line 247
    .local v1, "error":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    invoke-static {p1, v3, v1}, Lcom/disneymobile/mocha/NSURLConnection;->sendSynchronousRequestReturningResponseAndError(Lcom/disneymobile/mocha/NSURLRequest;Lcom/disneymobile/mocha/support/Out;Lcom/disneymobile/mocha/support/Out;)Lcom/disneymobile/mocha/NSData;

    move-result-object v0

    .line 250
    .local v0, "data":Lcom/disneymobile/mocha/NSData;
    invoke-virtual {v3}, Lcom/disneymobile/mocha/support/Out;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/disneymobile/mocha/NSHTTPURLResponse;

    .line 251
    .local v2, "requestData":Lcom/disneymobile/mocha/NSHTTPURLResponse;
    if-nez v2, :cond_0

    .line 252
    invoke-static {}, Lcom/disneymobile/mocha/NSNotificationCenter;->defaultCenter()Lcom/disneymobile/mocha/NSNotificationCenter;

    move-result-object v6

    sget-object v7, Lcom/disneymobile/network/DMOBackendResponse;->kDMOBackendConnectionFailureNotification:Ljava/lang/String;

    invoke-virtual {v6, v7, v4}, Lcom/disneymobile/mocha/NSNotificationCenter;->postNotificationNameAndObject(Ljava/lang/String;Ljava/lang/Object;)V

    .line 270
    :goto_0
    return-object v4

    .line 259
    :cond_0
    invoke-virtual {v2}, Lcom/disneymobile/mocha/NSHTTPURLResponse;->statusCode()I

    move-result v5

    .line 261
    .local v5, "statusCode":I
    const/16 v6, 0xc8

    if-eq v5, v6, :cond_1

    const/16 v6, 0xcc

    if-ne v5, v6, :cond_3

    :cond_1
    invoke-virtual {v1}, Lcom/disneymobile/mocha/support/Out;->hasValue()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v1}, Lcom/disneymobile/mocha/support/Out;->getValue()Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_3

    :cond_2
    if-nez v0, :cond_4

    .line 262
    :cond_3
    invoke-static {}, Lcom/disneymobile/mocha/NSNotificationCenter;->defaultCenter()Lcom/disneymobile/mocha/NSNotificationCenter;

    move-result-object v6

    sget-object v7, Lcom/disneymobile/network/DMOBackendResponse;->kDMOBackendConnectionFailureNotification:Ljava/lang/String;

    invoke-virtual {v6, v7, v4}, Lcom/disneymobile/mocha/NSNotificationCenter;->postNotificationNameAndObject(Ljava/lang/String;Ljava/lang/Object;)V

    .line 264
    :cond_4
    sget-object v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;->Default:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

    sget-object v7, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->XMLFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    invoke-static {v0, v6, v7, v4}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->propertyListWithDataOptionsFormatAndError(Lcom/disneymobile/mocha/NSData;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/support/Out;)Ljava/lang/Object;

    move-result-object v4

    .line 270
    .local v4, "result":Ljava/lang/Object;
    if-eqz v4, :cond_5

    check-cast v4, Ljava/util/HashMap;

    goto :goto_0

    :cond_5
    new-instance v4, Ljava/util/HashMap;

    .end local v4    # "result":Ljava/lang/Object;
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    goto :goto_0
.end method

.method private cancel()V
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->httpRequest:Lcom/disneymobile/network/DMOHTTPRequest;

    invoke-virtual {v0}, Lcom/disneymobile/network/DMOHTTPRequest;->cancelRequest()V

    .line 231
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->dontReturn:Z

    .line 232
    return-void
.end method

.method private clearReturnTarget()V
    .locals 1

    .prologue
    .line 238
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->dontReturn:Z

    .line 239
    return-void
.end method


# virtual methods
.method public _httpRequestDone(Lcom/disneymobile/network/DMOHTTPRequest;)V
    .locals 8
    .param p1, "inRequest"    # Lcom/disneymobile/network/DMOHTTPRequest;
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 333
    new-instance v1, Lcom/disneymobile/mocha/support/Out;

    invoke-direct {v1}, Lcom/disneymobile/mocha/support/Out;-><init>()V

    .line 336
    .local v1, "error":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    iget-object v5, p0, Lcom/disneymobile/network/DMOBackendResponse;->httpRequest:Lcom/disneymobile/network/DMOHTTPRequest;

    invoke-virtual {v5}, Lcom/disneymobile/network/DMOHTTPRequest;->data()Lcom/disneymobile/mocha/NSMutableData;

    move-result-object v5

    sget-object v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;->Default:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

    sget-object v7, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->XMLFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    invoke-static {v5, v6, v7, v1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->propertyListWithDataOptionsFormatAndError(Lcom/disneymobile/mocha/NSData;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/support/Out;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 338
    .local v2, "response":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v1}, Lcom/disneymobile/mocha/support/Out;->hasValue()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 339
    invoke-virtual {p0}, Lcom/disneymobile/network/DMOBackendResponse;->getLogPrefix()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "NSPropertyListSerialization error: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lcom/disneymobile/mocha/support/Out;->getValue()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    :cond_0
    if-nez v2, :cond_1

    .line 348
    new-instance v2, Ljava/util/HashMap;

    .end local v2    # "response":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 352
    .restart local v2    # "response":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    iget-object v5, p0, Lcom/disneymobile/network/DMOBackendResponse;->httpRequest:Lcom/disneymobile/network/DMOHTTPRequest;

    invoke-virtual {v5}, Lcom/disneymobile/network/DMOHTTPRequest;->object()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 354
    .local v0, "details":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "userData"

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 355
    .local v4, "userData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 356
    .local v3, "results":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "response"

    invoke-virtual {v3, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    const-string v5, "return"

    const-string v6, "return"

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    if-eqz v4, :cond_2

    .line 359
    const-string v5, "userData"

    invoke-virtual {v3, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    :cond_2
    invoke-direct {p0, v3}, Lcom/disneymobile/network/DMOBackendResponse;->_asyncResponseDone(Ljava/util/HashMap;)V

    .line 362
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/disneymobile/network/DMOBackendResponse;->httpRequest:Lcom/disneymobile/network/DMOHTTPRequest;

    .line 363
    return-void
.end method

.method public _ignoreReturn(Ljava/lang/Object;)V
    .locals 0
    .param p1, "r"    # Ljava/lang/Object;
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 328
    return-void
.end method

.method public _params()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 132
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->_params:Ljava/util/HashMap;

    return-object v0
.end method

.method public connection()Lcom/disneymobile/network/DMOBackendConnection;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->connection:Lcom/disneymobile/network/DMOBackendConnection;

    return-object v0
.end method

.method public content()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 179
    invoke-virtual {p0}, Lcom/disneymobile/network/DMOBackendResponse;->response()Ljava/util/HashMap;

    move-result-object v1

    const-string v2, "content"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 180
    .local v0, "content":Ljava/lang/Object;
    if-eqz v0, :cond_0

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_1

    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 181
    :cond_0
    const/4 v0, 0x0

    .line 184
    .end local v0    # "content":Ljava/lang/Object;
    :cond_1
    return-object v0
.end method

.method public ignoreReturn()V
    .locals 2

    .prologue
    .line 200
    new-instance v0, Lcom/disneymobile/mocha/support/Selector;

    const-string v1, "_ignoreReturn"

    invoke-direct {v0, v1}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p0, v0}, Lcom/disneymobile/network/DMOBackendResponse;->returnTargetAndAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V

    .line 201
    return-void
.end method

.method public initWithConnectionAndPOSTDictionary(Lcom/disneymobile/network/DMOBackendConnection;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 12
    .param p1, "c"    # Lcom/disneymobile/network/DMOBackendConnection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/network/DMOBackendConnection;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/disneymobile/network/DMOBackendResponse;"
        }
    .end annotation

    .prologue
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 64
    iput-object p1, p0, Lcom/disneymobile/network/DMOBackendResponse;->connection:Lcom/disneymobile/network/DMOBackendConnection;

    .line 65
    iput-object p2, p0, Lcom/disneymobile/network/DMOBackendResponse;->_params:Ljava/util/HashMap;

    .line 66
    new-instance v6, Lcom/disneymobile/mocha/NSMutableURLRequest;

    invoke-direct {v6}, Lcom/disneymobile/mocha/NSMutableURLRequest;-><init>()V

    iput-object v6, p0, Lcom/disneymobile/network/DMOBackendResponse;->request:Lcom/disneymobile/mocha/NSMutableURLRequest;

    .line 67
    iget-object v6, p0, Lcom/disneymobile/network/DMOBackendResponse;->request:Lcom/disneymobile/mocha/NSMutableURLRequest;

    sget-object v7, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->ReloadIgnoringLocalAndRemoteCacheData:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    invoke-virtual {v6, v7}, Lcom/disneymobile/mocha/NSMutableURLRequest;->setCachePolicy(Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;)V

    .line 68
    iget-object v6, p0, Lcom/disneymobile/network/DMOBackendResponse;->request:Lcom/disneymobile/mocha/NSMutableURLRequest;

    iget-object v7, p0, Lcom/disneymobile/network/DMOBackendResponse;->connection:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v7}, Lcom/disneymobile/network/DMOBackendConnection;->URL()Lcom/disneymobile/mocha/NSURL;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/disneymobile/mocha/NSMutableURLRequest;->setURL(Lcom/disneymobile/mocha/NSURL;)V

    .line 69
    iget-object v6, p0, Lcom/disneymobile/network/DMOBackendResponse;->request:Lcom/disneymobile/mocha/NSMutableURLRequest;

    const-string v7, "POST"

    invoke-virtual {v6, v7}, Lcom/disneymobile/mocha/NSMutableURLRequest;->setHTTPMethod(Ljava/lang/String;)V

    .line 72
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .local v1, "body":Ljava/lang/StringBuilder;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "multipart/form-data; boundary="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Lcom/disneymobile/network/DMOBackendResponse;->multipartSeparator:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 76
    .local v2, "contentType":Ljava/lang/String;
    iget-object v6, p0, Lcom/disneymobile/network/DMOBackendResponse;->request:Lcom/disneymobile/mocha/NSMutableURLRequest;

    const-string v7, "Content-Type"

    invoke-virtual {v6, v2, v7}, Lcom/disneymobile/mocha/NSMutableURLRequest;->setValueForHTTPHeaderField(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    iget-object v6, p0, Lcom/disneymobile/network/DMOBackendResponse;->request:Lcom/disneymobile/mocha/NSMutableURLRequest;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "FD "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getCellophaneUsername()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getCellophanePassword()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Authorization"

    invoke-virtual {v6, v7, v8}, Lcom/disneymobile/mocha/NSMutableURLRequest;->setValueForHTTPHeaderField(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    invoke-virtual {p2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 84
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 86
    .local v5, "value":Ljava/lang/Object;
    instance-of v6, v5, Ljava/nio/ByteBuffer;

    if-eqz v6, :cond_0

    .line 87
    const-string v6, "--%s\r\nContent-Disposition: form-data; name=\"%s\"; filename=\"uplodedPhoto\"\r\nContent-Type: application/octet-stream\r\n\r\n"

    new-array v7, v11, [Ljava/lang/Object;

    sget-object v8, Lcom/disneymobile/network/DMOBackendResponse;->multipartSeparator:Ljava/lang/String;

    aput-object v8, v7, v9

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "addstr":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    check-cast v5, Ljava/nio/ByteBuffer;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asCharBuffer()Ljava/nio/CharBuffer;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 90
    const-string v6, "\r\n"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 91
    .end local v0    # "addstr":Ljava/lang/String;
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_0
    instance-of v6, v5, Lcom/disneymobile/mocha/NSData;

    if-eqz v6, :cond_1

    .line 92
    const-string v6, "--%s\r\nContent-Disposition: form-data; name=\"%s\"; filename=\"uplodedPhoto\"\r\nContent-Type: application/octet-stream\r\n\r\n"

    new-array v7, v11, [Ljava/lang/Object;

    sget-object v8, Lcom/disneymobile/network/DMOBackendResponse;->multipartSeparator:Ljava/lang/String;

    aput-object v8, v7, v9

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 93
    .restart local v0    # "addstr":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    const-string v6, "\r\n"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 96
    .end local v0    # "addstr":Ljava/lang/String;
    :cond_1
    if-eqz v5, :cond_2

    .line 97
    const-string v6, "--%s\r\nContent-Disposition: form-data; name=\"%s\"\r\n\r\n%s\r\n"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    sget-object v8, Lcom/disneymobile/network/DMOBackendResponse;->multipartSeparator:Ljava/lang/String;

    aput-object v8, v7, v9

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 98
    .restart local v0    # "addstr":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 100
    .end local v0    # "addstr":Ljava/lang/String;
    :cond_2
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, " has a null value - "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 105
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "value":Ljava/lang/Object;
    :cond_3
    const-string v6, "--"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    sget-object v6, Lcom/disneymobile/network/DMOBackendResponse;->multipartSeparator:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    const-string v6, "--\r\n"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    iget-object v6, p0, Lcom/disneymobile/network/DMOBackendResponse;->request:Lcom/disneymobile/mocha/NSMutableURLRequest;

    invoke-virtual {v6, v1}, Lcom/disneymobile/mocha/NSMutableURLRequest;->setHTTPBody(Ljava/lang/CharSequence;)V

    .line 114
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/disneymobile/network/DMOBackendResponse;->_response:Ljava/util/HashMap;

    .line 116
    return-object p0
.end method

.method public isPending()Z
    .locals 1

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->isPending:Z

    return v0
.end method

.method public object()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->object:Ljava/lang/Object;

    return-object v0
.end method

.method public ok()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 143
    invoke-virtual {p0}, Lcom/disneymobile/network/DMOBackendResponse;->statusCode()I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public response()Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 189
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->_response:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->request:Lcom/disneymobile/mocha/NSMutableURLRequest;

    invoke-direct {p0, v0}, Lcom/disneymobile/network/DMOBackendResponse;->_fetchResponseForRequest(Lcom/disneymobile/mocha/NSURLRequest;)Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->_response:Ljava/util/HashMap;

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->_response:Ljava/util/HashMap;

    if-eqz v0, :cond_1

    .line 193
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->connection:Lcom/disneymobile/network/DMOBackendConnection;

    iget-object v1, p0, Lcom/disneymobile/network/DMOBackendResponse;->_response:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Lcom/disneymobile/network/DMOBackendConnection;->_processStandardResponseFields(Ljava/util/HashMap;)V

    .line 195
    :cond_1
    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->_response:Ljava/util/HashMap;

    instance-of v0, v0, Ljava/util/HashMap;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/disneymobile/network/DMOBackendResponse;->_response:Ljava/util/HashMap;

    :goto_0
    return-object v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public returnTargetActionAndUserData(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/util/HashMap;)V
    .locals 5
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "action"    # Lcom/disneymobile/mocha/support/Selector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/disneymobile/mocha/support/Selector;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 213
    .local p3, "userData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p1, p2}, Lcom/disneymobile/mocha/NSObject;->methodSignatureForSelector(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)Lcom/disneymobile/mocha/NSMethodSignature;

    move-result-object v2

    .line 214
    .local v2, "sig":Lcom/disneymobile/mocha/NSMethodSignature;
    invoke-static {v2}, Lcom/disneymobile/mocha/NSInvocation;->invocationWithMethodSignature(Lcom/disneymobile/mocha/NSMethodSignature;)Lcom/disneymobile/mocha/NSInvocation;

    move-result-object v0

    .line 215
    .local v0, "call":Lcom/disneymobile/mocha/NSInvocation;
    invoke-virtual {v0, p1}, Lcom/disneymobile/mocha/NSInvocation;->setTarget(Ljava/lang/Object;)V

    .line 216
    invoke-virtual {v0, p2}, Lcom/disneymobile/mocha/NSInvocation;->setSelector(Lcom/disneymobile/mocha/support/Selector;)V

    .line 218
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 219
    .local v1, "details":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "return"

    invoke-virtual {v1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    const-string v3, "request"

    iget-object v4, p0, Lcom/disneymobile/network/DMOBackendResponse;->request:Lcom/disneymobile/mocha/NSMutableURLRequest;

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    if-eqz p3, :cond_0

    .line 222
    const-string v3, "userData"

    invoke-virtual {v1, v3, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    :cond_0
    invoke-direct {p0, v1}, Lcom/disneymobile/network/DMOBackendResponse;->_asyncFetchResponse(Ljava/util/HashMap;)V

    .line 225
    return-void
.end method

.method public returnTargetAndAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)V
    .locals 1
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "action"    # Lcom/disneymobile/mocha/support/Selector;

    .prologue
    .line 208
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/disneymobile/network/DMOBackendResponse;->returnTargetActionAndUserData(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/util/HashMap;)V

    .line 209
    return-void
.end method

.method public setObject(Ljava/lang/Object;)V
    .locals 0
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/disneymobile/network/DMOBackendResponse;->object:Ljava/lang/Object;

    .line 129
    return-void
.end method

.method public setPending(Z)V
    .locals 0
    .param p1, "pending"    # Z

    .prologue
    .line 60
    iput-boolean p1, p0, Lcom/disneymobile/network/DMOBackendResponse;->isPending:Z

    .line 61
    return-void
.end method

.method public set_params(Ljava/util/HashMap;)V
    .locals 0
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
    .line 136
    .local p1, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iput-object p1, p0, Lcom/disneymobile/network/DMOBackendResponse;->_params:Ljava/util/HashMap;

    .line 137
    return-void
.end method

.method public statusCode()I
    .locals 5

    .prologue
    .line 148
    const/4 v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 149
    .local v2, "state":Ljava/lang/Integer;
    invoke-virtual {p0}, Lcom/disneymobile/network/DMOBackendResponse;->response()Ljava/util/HashMap;

    move-result-object v1

    .line 151
    .local v1, "res":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez v1, :cond_0

    .line 152
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 162
    :goto_0
    return v4

    .line 155
    :cond_0
    const-string v4, "status"

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 156
    .local v3, "status":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v3, :cond_1

    .line 158
    const-string v4, "code"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 159
    .local v0, "code":Ljava/lang/Integer;
    if-eqz v0, :cond_1

    .line 160
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    goto :goto_0

    .line 162
    .end local v0    # "code":Ljava/lang/Integer;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    goto :goto_0
.end method

.method public statusText()Ljava/lang/String;
    .locals 3

    .prologue
    .line 168
    invoke-virtual {p0}, Lcom/disneymobile/network/DMOBackendResponse;->response()Ljava/util/HashMap;

    move-result-object v1

    const-string v2, "status"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 169
    .local v0, "status":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v0, :cond_0

    .line 170
    const-string v1, "reason"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 171
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
