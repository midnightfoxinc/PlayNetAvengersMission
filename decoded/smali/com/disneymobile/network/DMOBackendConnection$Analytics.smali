.class public Lcom/disneymobile/network/DMOBackendConnection$Analytics;
.super Ljava/lang/Object;
.source "DMOBackendConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/network/DMOBackendConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Analytics"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disneymobile/network/DMOBackendConnection;


# direct methods
.method public constructor <init>(Lcom/disneymobile/network/DMOBackendConnection;)V
    .locals 0

    .prologue
    .line 313
    iput-object p1, p0, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->this$0:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private _analyticsSignatureFromArgumentsAndHttpMethod(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    .locals 18
    .param p2, "httpMethod"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 340
    .local p1, "arguments":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual/range {p1 .. p1}, Ljava/util/HashMap;->size()I

    move-result v14

    new-array v8, v14, [Ljava/lang/String;

    .line 341
    .local v8, "queryPairs":[Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v14

    new-instance v15, Lcom/disneymobile/mocha/support/Selector;

    const-string v16, "compareTo"

    invoke-direct/range {v15 .. v16}, Lcom/disneymobile/mocha/support/Selector;-><init>(Ljava/lang/String;)V

    invoke-static {v14, v15}, Lcom/disneymobile/mocha/Utilities;->sortedArrayUsingSelector(Ljava/util/Set;Lcom/disneymobile/mocha/support/Selector;)[Ljava/lang/String;

    move-result-object v7

    .line 342
    .local v7, "queryKeys":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v14, v8

    if-ge v4, v14, :cond_2

    .line 343
    aget-object v6, v7, v4

    .line 344
    .local v6, "queryKey":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 346
    .local v9, "queryValue":Ljava/lang/Object;
    instance-of v14, v9, Lcom/disneymobile/mocha/NSData;

    if-eqz v14, :cond_0

    .line 342
    .end local v9    # "queryValue":Ljava/lang/Object;
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 350
    .restart local v9    # "queryValue":Ljava/lang/Object;
    :cond_0
    if-eqz v9, :cond_1

    .line 351
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    const-string v15, " "

    const-string v16, "+"

    invoke-virtual/range {v14 .. v16}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    .line 359
    .local v9, "queryValue":Ljava/lang/String;
    :goto_2
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v8, v4

    goto :goto_1

    .line 353
    .local v9, "queryValue":Ljava/lang/Object;
    :cond_1
    const-string v9, ""

    .local v9, "queryValue":Ljava/lang/String;
    goto :goto_2

    .line 364
    .end local v6    # "queryKey":Ljava/lang/String;
    .end local v9    # "queryValue":Ljava/lang/String;
    :cond_2
    const-string v14, "&"

    invoke-static {v8, v14}, Lcom/disneymobile/mocha/Utilities;->concatString([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 365
    .local v3, "hash":Ljava/lang/String;
    const-string v14, "%@"

    invoke-virtual {v3, v14, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 367
    .local v10, "rawHash":Ljava/lang/String;
    const-string v14, "%@&"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->this$0:Lcom/disneymobile/network/DMOBackendConnection;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/disneymobile/network/DMOBackendConnection;->access$100(Lcom/disneymobile/network/DMOBackendConnection;)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Lcom/disneymobile/mocha/Utilities;->stringWithFormat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 373
    .local v5, "keyStr":Ljava/lang/String;
    const/4 v14, 0x0

    invoke-static {v5, v14}, Lcom/disneymobile/mocha/Utilities;->dataUsingEncoding(Ljava/lang/String;I)Lcom/disneymobile/mocha/NSData;

    move-result-object v13

    .line 374
    .local v13, "secretData":Lcom/disneymobile/mocha/NSData;
    const/4 v14, 0x0

    invoke-static {v10, v14}, Lcom/disneymobile/mocha/Utilities;->dataUsingEncoding(Ljava/lang/String;I)Lcom/disneymobile/mocha/NSData;

    move-result-object v2

    .line 375
    .local v2, "clearTextData":Lcom/disneymobile/mocha/NSData;
    invoke-static {v13, v2}, Lcom/disneymobile/network/DMOBackendConnection;->access$200(Lcom/disneymobile/mocha/NSData;Lcom/disneymobile/mocha/NSData;)[B

    move-result-object v11

    .line 377
    .local v11, "result":[B
    invoke-static {v11}, Lcom/disneymobile/mocha/NSData;->dataWithBytesNoCopy([B)Lcom/disneymobile/mocha/NSData;

    move-result-object v12

    .line 378
    .local v12, "resultData":Lcom/disneymobile/mocha/NSData;
    invoke-virtual {v12}, Lcom/disneymobile/mocha/NSData;->base64Encoding()Ljava/lang/String;

    move-result-object v1

    .line 382
    .local v1, "base64EncodedResult":Ljava/lang/String;
    invoke-static {v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    return-object v14
.end method

.method private coreTrackingInfo()Ljava/util/HashMap;
    .locals 6
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
    .line 316
    sget-object v4, Lcom/disneymobile/mocha/support/UIDevice;->currentDevice:Lcom/disneymobile/mocha/support/UIDevice;

    invoke-virtual {v4}, Lcom/disneymobile/mocha/support/UIDevice;->internetConnectionStatus()Lcom/disneymobile/network/DMONetworkStatus;

    move-result-object v2

    .line 317
    .local v2, "networkStatus":Lcom/disneymobile/network/DMONetworkStatus;
    invoke-virtual {v2}, Lcom/disneymobile/network/DMONetworkStatus;->ordinal()I

    move-result v0

    .line 318
    .local v0, "connectionStatus":I
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 320
    .local v1, "connectionType":Ljava/lang/String;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 321
    .local v3, "p":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalytics;->getSysInfo()Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 322
    const-string v4, "onlineflag"

    invoke-virtual {v3, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    const-string v4, "timestamp"

    invoke-static {}, Lcom/disneymobile/network/DMOBackendConnection;->getUnixTimestamp()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    const-string v4, "api_key"

    iget-object v5, p0, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->this$0:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-static {v5}, Lcom/disneymobile/network/DMOBackendConnection;->access$000(Lcom/disneymobile/network/DMOBackendConnection;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    return-object v3
.end method


# virtual methods
.method public callAnalyticsRemoteMethod(Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/Object;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 4
    .param p1, "methodName"    # Ljava/lang/String;
    .param p3, "data"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Object;",
            ")",
            "Lcom/disneymobile/network/DMOBackendResponse;"
        }
    .end annotation

    .prologue
    .line 454
    .local p2, "trackingInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 456
    .local v0, "p":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    instance-of v2, p3, Ljava/util/HashMap;

    if-eqz v2, :cond_2

    .line 457
    check-cast p3, Ljava/util/Map;

    .end local p3    # "data":Ljava/lang/Object;
    invoke-virtual {v0, p3}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 463
    :cond_0
    :goto_0
    if-eqz p2, :cond_3

    .line 464
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 469
    :goto_1
    const-string v2, "method"

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    const-string v2, "api_sig"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 474
    const-string v2, "POST"

    invoke-direct {p0, v0, v2}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->_analyticsSignatureFromArgumentsAndHttpMethod(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 482
    .local v1, "requestSignature":Ljava/lang/String;
    const-string v2, "api_sig"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 488
    .end local v1    # "requestSignature":Ljava/lang/String;
    :cond_1
    new-instance v2, Lcom/disneymobile/network/DMOBackendResponse;

    invoke-direct {v2}, Lcom/disneymobile/network/DMOBackendResponse;-><init>()V

    iget-object v3, p0, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->this$0:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v2, v3, v0}, Lcom/disneymobile/network/DMOBackendResponse;->initWithConnectionAndPOSTDictionary(Lcom/disneymobile/network/DMOBackendConnection;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v2

    return-object v2

    .line 458
    .restart local p3    # "data":Ljava/lang/Object;
    :cond_2
    instance-of v2, p3, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 459
    const-string v2, "data"

    invoke-virtual {v0, v2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 466
    .end local p3    # "data":Ljava/lang/Object;
    :cond_3
    invoke-direct {p0}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->coreTrackingInfo()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    goto :goto_1
.end method

.method public callAnalyticsRemoteMethodWithContext(Ljava/lang/String;Ljava/lang/String;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 5
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "json"    # Ljava/lang/String;

    .prologue
    .line 388
    move-object v0, p2

    .line 390
    .local v0, "data":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 391
    const-string v0, ""

    .line 394
    :cond_0
    invoke-direct {p0}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->coreTrackingInfo()Ljava/util/HashMap;

    move-result-object v1

    .line 395
    .local v1, "p":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "method"

    invoke-virtual {v1, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    if-eqz p2, :cond_1

    .line 398
    const-string v3, "data"

    invoke-virtual {v1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    :cond_1
    const-string v3, "POST"

    invoke-direct {p0, v1, v3}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->_analyticsSignatureFromArgumentsAndHttpMethod(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 407
    .local v2, "requestSignature":Ljava/lang/String;
    const-string v3, "api_sig"

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    new-instance v3, Lcom/disneymobile/network/DMOBackendResponse;

    invoke-direct {v3}, Lcom/disneymobile/network/DMOBackendResponse;-><init>()V

    iget-object v4, p0, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->this$0:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v3, v4, v1}, Lcom/disneymobile/network/DMOBackendResponse;->initWithConnectionAndPOSTDictionary(Lcom/disneymobile/network/DMOBackendConnection;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v3

    return-object v3
.end method

.method public callInitialAnalyticsRemoteMethodWithParameters(Ljava/lang/String;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;
    .locals 4
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/disneymobile/network/DMOBackendResponse;"
        }
    .end annotation

    .prologue
    .line 418
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 419
    .local v0, "p":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->coreTrackingInfo()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 420
    const-string v2, "method"

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 423
    iget-object v2, p0, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->this$0:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-static {v2}, Lcom/disneymobile/network/DMOBackendConnection;->access$300(Lcom/disneymobile/network/DMOBackendConnection;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->this$0:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-static {v2}, Lcom/disneymobile/network/DMOBackendConnection;->access$300(Lcom/disneymobile/network/DMOBackendConnection;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 424
    const-string v2, "client_id"

    iget-object v3, p0, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->this$0:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-static {v3}, Lcom/disneymobile/network/DMOBackendConnection;->access$300(Lcom/disneymobile/network/DMOBackendConnection;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    :cond_0
    const-string v2, "POST"

    invoke-direct {p0, v0, v2}, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->_analyticsSignatureFromArgumentsAndHttpMethod(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 434
    .local v1, "requestSignature":Ljava/lang/String;
    const-string v2, "api_sig"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    new-instance v2, Lcom/disneymobile/network/DMOBackendResponse;

    invoke-direct {v2}, Lcom/disneymobile/network/DMOBackendResponse;-><init>()V

    iget-object v3, p0, Lcom/disneymobile/network/DMOBackendConnection$Analytics;->this$0:Lcom/disneymobile/network/DMOBackendConnection;

    invoke-virtual {v2, v3, v0}, Lcom/disneymobile/network/DMOBackendResponse;->initWithConnectionAndPOSTDictionary(Lcom/disneymobile/network/DMOBackendConnection;Ljava/util/HashMap;)Lcom/disneymobile/network/DMOBackendResponse;

    move-result-object v2

    return-object v2
.end method
