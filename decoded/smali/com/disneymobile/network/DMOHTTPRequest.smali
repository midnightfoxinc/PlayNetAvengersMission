.class public Lcom/disneymobile/network/DMOHTTPRequest;
.super Lcom/disneymobile/mocha/NSObject;
.source "DMOHTTPRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;
    }
.end annotation


# instance fields
.field completeProgress:I

.field connection:Lcom/disneymobile/mocha/NSURLConnection;

.field data:Lcom/disneymobile/mocha/NSMutableData;

.field delegate:Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;

.field doneAction:Lcom/disneymobile/mocha/support/Selector;

.field errorAction:Lcom/disneymobile/mocha/support/Selector;

.field expectedContentLength:J

.field object:Ljava/lang/Object;

.field receivedContentLength:J

.field request:Lcom/disneymobile/mocha/NSURLRequest;

.field sentProgressOnce:Z

.field target:Ljava/lang/Object;

.field url:Lcom/disneymobile/mocha/NSURL;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 210
    return-void
.end method

.method private _computeCompleteProgress()V
    .locals 6

    .prologue
    .line 188
    iget v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->completeProgress:I

    .line 191
    .local v0, "originalProgress":I
    invoke-virtual {p0}, Lcom/disneymobile/network/DMOHTTPRequest;->determinateLength()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 192
    const-wide/16 v2, 0x64

    iget-wide v4, p0, Lcom/disneymobile/network/DMOHTTPRequest;->receivedContentLength:J

    mul-long/2addr v2, v4

    long-to-double v2, v2

    iget-wide v4, p0, Lcom/disneymobile/network/DMOHTTPRequest;->expectedContentLength:J

    long-to-double v4, v4

    div-double/2addr v2, v4

    double-to-int v1, v2

    iput v1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->completeProgress:I

    .line 197
    :cond_0
    iget v1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->completeProgress:I

    if-ne v0, v1, :cond_1

    iget-boolean v1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->sentProgressOnce:Z

    if-nez v1, :cond_2

    .line 198
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->sentProgressOnce:Z

    .line 200
    iget-object v1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->delegate:Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;

    if-eqz v1, :cond_2

    .line 201
    iget-object v1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->delegate:Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;

    iget v2, p0, Lcom/disneymobile/network/DMOHTTPRequest;->completeProgress:I

    invoke-interface {v1, p0, v2}, Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;->httpRequestChangedCompleteProgress(Lcom/disneymobile/network/DMOHTTPRequest;I)V

    .line 204
    :cond_2
    return-void
.end method

.method private _releaseConnection()V
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->connection:Lcom/disneymobile/mocha/NSURLConnection;

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->connection:Lcom/disneymobile/mocha/NSURLConnection;

    invoke-virtual {v0}, Lcom/disneymobile/mocha/NSURLConnection;->cancel()V

    .line 182
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->connection:Lcom/disneymobile/mocha/NSURLConnection;

    .line 184
    :cond_0
    return-void
.end method

.method public static dataWithRequest(Lcom/disneymobile/mocha/NSURLRequest;)Lcom/disneymobile/network/DMOHTTPRequest;
    .locals 1
    .param p0, "inRequest"    # Lcom/disneymobile/mocha/NSURLRequest;

    .prologue
    .line 43
    new-instance v0, Lcom/disneymobile/network/DMOHTTPRequest;

    invoke-direct {v0}, Lcom/disneymobile/network/DMOHTTPRequest;-><init>()V

    invoke-direct {v0, p0}, Lcom/disneymobile/network/DMOHTTPRequest;->initWithRequest(Lcom/disneymobile/mocha/NSURLRequest;)Lcom/disneymobile/network/DMOHTTPRequest;

    move-result-object v0

    return-object v0
.end method

.method public static dataWithURL(Lcom/disneymobile/mocha/NSURL;)Lcom/disneymobile/network/DMOHTTPRequest;
    .locals 1
    .param p0, "inURL"    # Lcom/disneymobile/mocha/NSURL;

    .prologue
    .line 38
    new-instance v0, Lcom/disneymobile/network/DMOHTTPRequest;

    invoke-direct {v0}, Lcom/disneymobile/network/DMOHTTPRequest;-><init>()V

    invoke-direct {v0, p0}, Lcom/disneymobile/network/DMOHTTPRequest;->initWithURL(Lcom/disneymobile/mocha/NSURL;)Lcom/disneymobile/network/DMOHTTPRequest;

    move-result-object v0

    return-object v0
.end method

.method private initWithRequest(Lcom/disneymobile/mocha/NSURLRequest;)Lcom/disneymobile/network/DMOHTTPRequest;
    .locals 1
    .param p1, "inRequest"    # Lcom/disneymobile/mocha/NSURLRequest;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->request:Lcom/disneymobile/mocha/NSURLRequest;

    .line 57
    new-instance v0, Lcom/disneymobile/mocha/NSMutableData;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSMutableData;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->data:Lcom/disneymobile/mocha/NSMutableData;

    .line 59
    return-object p0
.end method

.method private initWithURL(Lcom/disneymobile/mocha/NSURL;)Lcom/disneymobile/network/DMOHTTPRequest;
    .locals 1
    .param p1, "inURL"    # Lcom/disneymobile/mocha/NSURL;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->url:Lcom/disneymobile/mocha/NSURL;

    .line 49
    new-instance v0, Lcom/disneymobile/mocha/NSMutableData;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSMutableData;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->data:Lcom/disneymobile/mocha/NSMutableData;

    .line 51
    return-object p0
.end method


# virtual methods
.method public cancelRequest()V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/disneymobile/network/DMOHTTPRequest;->_releaseConnection()V

    .line 73
    return-void
.end method

.method public connectionDidFailWithError(Lcom/disneymobile/mocha/NSURLConnection;Lcom/disneymobile/mocha/NSError;)V
    .locals 3
    .param p1, "connection"    # Lcom/disneymobile/mocha/NSURLConnection;
    .param p2, "error"    # Lcom/disneymobile/mocha/NSError;
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 153
    invoke-static {}, Lcom/disneymobile/mocha/NSNotificationCenter;->defaultCenter()Lcom/disneymobile/mocha/NSNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/disneymobile/network/DMOBackendResponse;->kDMOBackendConnectionFailureNotification:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/disneymobile/mocha/NSNotification;->notificationWithNameAndObject(Ljava/lang/String;Ljava/lang/Object;)Lcom/disneymobile/mocha/NSNotification;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disneymobile/mocha/NSNotificationCenter;->postNotification(Lcom/disneymobile/mocha/NSNotification;)V

    .line 155
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->target:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->errorAction:Lcom/disneymobile/mocha/support/Selector;

    if-eqz v0, :cond_0

    .line 156
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->target:Ljava/lang/Object;

    iget-object v1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->errorAction:Lcom/disneymobile/mocha/support/Selector;

    invoke-static {v0, v1, p0}, Lcom/disneymobile/mocha/NSObject;->performSelectorWithObject(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->delegate:Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;

    if-eqz v0, :cond_1

    .line 159
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->delegate:Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;

    invoke-interface {v0, p0, p2}, Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;->httpRequestDidFailWithError(Lcom/disneymobile/network/DMOHTTPRequest;Lcom/disneymobile/mocha/NSError;)V

    .line 162
    :cond_1
    invoke-direct {p0}, Lcom/disneymobile/network/DMOHTTPRequest;->_releaseConnection()V

    .line 163
    return-void
.end method

.method public connectionDidFinishLoading(Lcom/disneymobile/mocha/NSURLConnection;)V
    .locals 2
    .param p1, "connection"    # Lcom/disneymobile/mocha/NSURLConnection;
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 168
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->target:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->doneAction:Lcom/disneymobile/mocha/support/Selector;

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->target:Ljava/lang/Object;

    iget-object v1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->doneAction:Lcom/disneymobile/mocha/support/Selector;

    invoke-static {v0, v1, p0}, Lcom/disneymobile/mocha/NSObject;->performSelectorWithObject(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    :cond_0
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->delegate:Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;

    if-eqz v0, :cond_1

    .line 172
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->delegate:Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;

    invoke-interface {v0, p0}, Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;->httpRequestDidFinishLoading(Lcom/disneymobile/network/DMOHTTPRequest;)V

    .line 175
    :cond_1
    invoke-direct {p0}, Lcom/disneymobile/network/DMOHTTPRequest;->_releaseConnection()V

    .line 176
    return-void
.end method

.method public connectionDidReceiveData(Lcom/disneymobile/mocha/NSURLConnection;[B)V
    .locals 2
    .param p1, "connection"    # Lcom/disneymobile/mocha/NSURLConnection;
    .param p2, "inData"    # [B
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 142
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->data:Lcom/disneymobile/mocha/NSMutableData;

    invoke-virtual {v0, p2}, Lcom/disneymobile/mocha/NSMutableData;->appendDataByReference([B)V

    .line 144
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->data:Lcom/disneymobile/mocha/NSMutableData;

    invoke-virtual {v0}, Lcom/disneymobile/mocha/NSMutableData;->length()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->receivedContentLength:J

    .line 145
    invoke-direct {p0}, Lcom/disneymobile/network/DMOHTTPRequest;->_computeCompleteProgress()V

    .line 146
    return-void
.end method

.method public connectionDidReceiveResponse(Lcom/disneymobile/mocha/NSURLConnection;Lcom/disneymobile/mocha/NSURLResponse;)V
    .locals 4
    .param p1, "connection"    # Lcom/disneymobile/mocha/NSURLConnection;
    .param p2, "response"    # Lcom/disneymobile/mocha/NSURLResponse;
    .annotation runtime Lcom/disneymobile/mocha/support/SelectorTarget;
    .end annotation

    .prologue
    .line 127
    move-object v1, p2

    check-cast v1, Lcom/disneymobile/mocha/NSHTTPURLResponse;

    invoke-virtual {v1}, Lcom/disneymobile/mocha/NSHTTPURLResponse;->statusCode()I

    move-result v0

    .line 130
    .local v0, "statusCode":I
    const/16 v1, 0x1f4

    if-lt v0, v1, :cond_0

    .line 131
    invoke-static {}, Lcom/disneymobile/mocha/NSNotificationCenter;->defaultCenter()Lcom/disneymobile/mocha/NSNotificationCenter;

    move-result-object v1

    sget-object v2, Lcom/disneymobile/network/DMOBackendResponse;->kDMOBackendConnectionFailureNotification:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/disneymobile/mocha/NSNotification;->notificationWithNameAndObject(Ljava/lang/String;Ljava/lang/Object;)Lcom/disneymobile/mocha/NSNotification;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/disneymobile/mocha/NSNotificationCenter;->postNotification(Lcom/disneymobile/mocha/NSNotification;)V

    .line 133
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->data:Lcom/disneymobile/mocha/NSMutableData;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/disneymobile/mocha/NSMutableData;->setLength(I)V

    .line 135
    invoke-virtual {p2}, Lcom/disneymobile/mocha/NSURLResponse;->expectedContentLength()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/disneymobile/network/DMOHTTPRequest;->expectedContentLength:J

    .line 136
    invoke-direct {p0}, Lcom/disneymobile/network/DMOHTTPRequest;->_computeCompleteProgress()V

    .line 137
    return-void
.end method

.method public data()Lcom/disneymobile/mocha/NSMutableData;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->data:Lcom/disneymobile/mocha/NSMutableData;

    return-object v0
.end method

.method public delegate()Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->delegate:Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;

    return-object v0
.end method

.method public determinateLength()Z
    .locals 4

    .prologue
    .line 118
    iget-wide v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->expectedContentLength:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCompleteProgress()I
    .locals 1

    .prologue
    .line 108
    iget v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->completeProgress:I

    return v0
.end method

.method public loading()Z
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->connection:Lcom/disneymobile/mocha/NSURLConnection;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public object()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->object:Ljava/lang/Object;

    return-object v0
.end method

.method public request()Lcom/disneymobile/mocha/NSURLRequest;
    .locals 3

    .prologue
    .line 95
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->request:Lcom/disneymobile/mocha/NSURLRequest;

    if-nez v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->url:Lcom/disneymobile/mocha/NSURL;

    sget-object v1, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->NSURLRequestUseProtocolCachePolicy:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    const/high16 v2, 0x42700000    # 60.0f

    invoke-static {v0, v1, v2}, Lcom/disneymobile/mocha/NSURLRequest;->requestWithURLCachePolicyAndTimeoutInterval(Lcom/disneymobile/mocha/NSURL;Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;F)Lcom/disneymobile/mocha/NSURLRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->request:Lcom/disneymobile/mocha/NSURLRequest;

    .line 99
    :cond_0
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->request:Lcom/disneymobile/mocha/NSURLRequest;

    return-object v0
.end method

.method public setDelegate(Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;)V
    .locals 0
    .param p1, "delegate"    # Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->delegate:Lcom/disneymobile/network/DMOHTTPRequest$DMOHTTPRequestDelegate;

    .line 93
    return-void
.end method

.method public setObject(Ljava/lang/Object;)V
    .locals 0
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->object:Ljava/lang/Object;

    .line 87
    return-void
.end method

.method public setTargetDoneActionAndErrorAction(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Lcom/disneymobile/mocha/support/Selector;)V
    .locals 0
    .param p1, "inTarget"    # Ljava/lang/Object;
    .param p2, "inDoneAction"    # Lcom/disneymobile/mocha/support/Selector;
    .param p3, "inErrorAction"    # Lcom/disneymobile/mocha/support/Selector;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->target:Ljava/lang/Object;

    .line 78
    iput-object p2, p0, Lcom/disneymobile/network/DMOHTTPRequest;->doneAction:Lcom/disneymobile/mocha/support/Selector;

    .line 79
    iput-object p3, p0, Lcom/disneymobile/network/DMOHTTPRequest;->errorAction:Lcom/disneymobile/mocha/support/Selector;

    .line 80
    return-void
.end method

.method public startRequest()V
    .locals 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->connection:Lcom/disneymobile/mocha/NSURLConnection;

    if-nez v0, :cond_0

    .line 65
    new-instance v0, Lcom/disneymobile/mocha/NSURLConnection;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSURLConnection;-><init>()V

    iget-object v1, p0, Lcom/disneymobile/network/DMOHTTPRequest;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v0, v1, p0}, Lcom/disneymobile/mocha/NSURLConnection;->initWithRequestDelegate(Lcom/disneymobile/mocha/NSURLRequest;Ljava/lang/Object;)Lcom/disneymobile/mocha/NSURLConnection;

    move-result-object v0

    iput-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->connection:Lcom/disneymobile/mocha/NSURLConnection;

    .line 66
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->data:Lcom/disneymobile/mocha/NSMutableData;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/disneymobile/mocha/NSMutableData;->setLength(I)V

    .line 68
    :cond_0
    return-void
.end method

.method public url()Lcom/disneymobile/mocha/NSURL;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/disneymobile/network/DMOHTTPRequest;->url:Lcom/disneymobile/mocha/NSURL;

    return-object v0
.end method
