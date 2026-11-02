.class public Lcom/disneymobile/mocha/NSURLResponse;
.super Ljava/lang/Object;
.source "NSURLResponse.java"


# instance fields
.field private final contentLength:J

.field private final contentType:Ljava/lang/String;

.field private final encodingName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 1
    .param p1, "encodingName"    # Ljava/lang/String;
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "contentLength"    # J

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/disneymobile/mocha/NSURLResponse;->encodingName:Ljava/lang/String;

    .line 11
    iput-object p2, p0, Lcom/disneymobile/mocha/NSURLResponse;->contentType:Ljava/lang/String;

    .line 12
    iput-wide p3, p0, Lcom/disneymobile/mocha/NSURLResponse;->contentLength:J

    .line 13
    return-void
.end method


# virtual methods
.method public expectedContentLength()J
    .locals 2

    .prologue
    .line 31
    iget-wide v0, p0, Lcom/disneymobile/mocha/NSURLResponse;->contentLength:J

    return-wide v0
.end method

.method public getEncodingName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLResponse;->encodingName:Ljava/lang/String;

    return-object v0
.end method

.method public getMIMEType()Ljava/lang/String;
    .locals 3

    .prologue
    .line 21
    iget-object v1, p0, Lcom/disneymobile/mocha/NSURLResponse;->contentType:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 22
    const/4 v1, 0x0

    .line 27
    :goto_0
    return-object v1

    .line 23
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/mocha/NSURLResponse;->contentType:Ljava/lang/String;

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 24
    .local v0, "parameterIndex":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 25
    iget-object v1, p0, Lcom/disneymobile/mocha/NSURLResponse;->contentType:Ljava/lang/String;

    goto :goto_0

    .line 27
    :cond_1
    iget-object v1, p0, Lcom/disneymobile/mocha/NSURLResponse;->contentType:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
