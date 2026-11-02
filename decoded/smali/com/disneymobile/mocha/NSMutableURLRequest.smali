.class public Lcom/disneymobile/mocha/NSMutableURLRequest;
.super Lcom/disneymobile/mocha/NSURLRequest;
.source "NSMutableURLRequest.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSURLRequest;-><init>()V

    .line 6
    return-void
.end method


# virtual methods
.method public getHeaderValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "header"    # Ljava/lang/String;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/disneymobile/mocha/NSMutableURLRequest;->headerFields:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public setCachePolicy(Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;)V
    .locals 0
    .param p1, "cachePolicy"    # Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    .prologue
    .line 13
    iput-object p1, p0, Lcom/disneymobile/mocha/NSMutableURLRequest;->cachePolicy:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    .line 14
    return-void
.end method

.method public setHTTPBody(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "body"    # Ljava/lang/CharSequence;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/disneymobile/mocha/NSMutableURLRequest;->body:Ljava/lang/CharSequence;

    .line 34
    return-void
.end method

.method public setHTTPMethod(Ljava/lang/String;)V
    .locals 0
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/disneymobile/mocha/NSMutableURLRequest;->httpMethod:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public setTimeoutInterval(F)V
    .locals 0
    .param p1, "timeoutS"    # F

    .prologue
    .line 17
    iput p1, p0, Lcom/disneymobile/mocha/NSMutableURLRequest;->timeoutS:F

    .line 18
    return-void
.end method

.method public setURL(Lcom/disneymobile/mocha/NSURL;)V
    .locals 0
    .param p1, "url"    # Lcom/disneymobile/mocha/NSURL;

    .prologue
    .line 9
    iput-object p1, p0, Lcom/disneymobile/mocha/NSMutableURLRequest;->url:Lcom/disneymobile/mocha/NSURL;

    .line 10
    return-void
.end method

.method public setValueForHTTPHeaderField(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "headerField"    # Ljava/lang/String;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/disneymobile/mocha/NSMutableURLRequest;->headerFields:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    return-void
.end method
