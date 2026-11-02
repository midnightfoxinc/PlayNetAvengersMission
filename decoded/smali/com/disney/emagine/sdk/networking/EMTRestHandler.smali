.class public abstract Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.super Ljava/lang/Object;
.source "EMTRestHandler.java"


# instance fields
.field protected contentCopy:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field protected contents:Ljava/util/HashMap;
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

.field private deviceId:I

.field private deviceType:S

.field protected docPath:Ljava/lang/String;

.field protected metadata:Ljava/util/HashMap;
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

.field private ownerId:Ljava/lang/String;

.field private status:Z

.field private success:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contents:Ljava/util/HashMap;

    .line 23
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contentCopy:Ljava/util/ArrayList;

    .line 24
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->metadata:Ljava/util/HashMap;

    .line 25
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->ownerId:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->docPath:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->success:Ljava/lang/Runnable;

    .line 28
    iput-boolean v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->status:Z

    .line 29
    iput v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceId:I

    .line 30
    iput-short v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceType:S

    .line 78
    return-void
.end method

.method public constructor <init>(ILjava/lang/Runnable;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "fu"    # Ljava/lang/Runnable;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contents:Ljava/util/HashMap;

    .line 23
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contentCopy:Ljava/util/ArrayList;

    .line 24
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->metadata:Ljava/util/HashMap;

    .line 25
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->ownerId:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->docPath:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->success:Ljava/lang/Runnable;

    .line 28
    iput-boolean v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->status:Z

    .line 29
    iput v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceId:I

    .line 30
    iput-short v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceType:S

    .line 42
    iput p1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceId:I

    .line 43
    iput-object p2, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->success:Ljava/lang/Runnable;

    .line 44
    return-void
.end method

.method public constructor <init>(ILjava/util/HashMap;Ljava/util/HashMap;)V
    .locals 2
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "ct":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "md":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contents:Ljava/util/HashMap;

    .line 23
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contentCopy:Ljava/util/ArrayList;

    .line 24
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->metadata:Ljava/util/HashMap;

    .line 25
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->ownerId:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->docPath:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->success:Ljava/lang/Runnable;

    .line 28
    iput-boolean v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->status:Z

    .line 29
    iput v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceId:I

    .line 30
    iput-short v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceType:S

    .line 48
    iput p1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceId:I

    .line 49
    iput-object p2, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contents:Ljava/util/HashMap;

    .line 50
    iput-object p3, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->metadata:Ljava/util/HashMap;

    .line 51
    return-void
.end method

.method public constructor <init>(ISLjava/lang/String;Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "dt"    # S
    .param p3, "od"    # Ljava/lang/String;
    .param p4, "fu"    # Ljava/lang/Runnable;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contents:Ljava/util/HashMap;

    .line 23
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contentCopy:Ljava/util/ArrayList;

    .line 24
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->metadata:Ljava/util/HashMap;

    .line 25
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->ownerId:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->docPath:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->success:Ljava/lang/Runnable;

    .line 28
    iput-boolean v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->status:Z

    .line 29
    iput v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceId:I

    .line 30
    iput-short v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceType:S

    .line 34
    iput p1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceId:I

    .line 35
    iput-short p2, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceType:S

    .line 36
    iput-object p3, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->ownerId:Ljava/lang/String;

    .line 37
    iput-object p4, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->success:Ljava/lang/Runnable;

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "fu"    # Ljava/lang/Runnable;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contents:Ljava/util/HashMap;

    .line 23
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contentCopy:Ljava/util/ArrayList;

    .line 24
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->metadata:Ljava/util/HashMap;

    .line 25
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->ownerId:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->docPath:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->success:Ljava/lang/Runnable;

    .line 28
    iput-boolean v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->status:Z

    .line 29
    iput v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceId:I

    .line 30
    iput-short v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceType:S

    .line 72
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->success:Ljava/lang/Runnable;

    .line 73
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contents:Ljava/util/HashMap;

    .line 23
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contentCopy:Ljava/util/ArrayList;

    .line 24
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->metadata:Ljava/util/HashMap;

    .line 25
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->ownerId:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->docPath:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->success:Ljava/lang/Runnable;

    .line 28
    iput-boolean v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->status:Z

    .line 29
    iput v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceId:I

    .line 30
    iput-short v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceType:S

    .line 61
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->docPath:Ljava/lang/String;

    .line 62
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->ownerId:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Ljava/lang/Runnable;)V
    .locals 2
    .param p2, "fu"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "cc":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contents:Ljava/util/HashMap;

    .line 23
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contentCopy:Ljava/util/ArrayList;

    .line 24
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->metadata:Ljava/util/HashMap;

    .line 25
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->ownerId:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->docPath:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->success:Ljava/lang/Runnable;

    .line 28
    iput-boolean v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->status:Z

    .line 29
    iput v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceId:I

    .line 30
    iput-short v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceType:S

    .line 55
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contentCopy:Ljava/util/ArrayList;

    .line 56
    iput-object p2, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->success:Ljava/lang/Runnable;

    .line 57
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2
    .param p1, "success"    # Z

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contents:Ljava/util/HashMap;

    .line 23
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->contentCopy:Ljava/util/ArrayList;

    .line 24
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->metadata:Ljava/util/HashMap;

    .line 25
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->ownerId:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->docPath:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->success:Ljava/lang/Runnable;

    .line 28
    iput-boolean v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->status:Z

    .line 29
    iput v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceId:I

    .line 30
    iput-short v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->deviceType:S

    .line 67
    iput-boolean p1, p0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->status:Z

    .line 68
    return-void
.end method


# virtual methods
.method public onCompleted(Lorg/apache/http/client/HttpClient;Lorg/apache/http/HttpResponse;Ljava/lang/Exception;)V
    .locals 9
    .param p1, "client"    # Lorg/apache/http/client/HttpClient;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 82
    const/high16 v5, -0x80000000

    .line 83
    .local v5, "status":I
    const/4 v1, 0x0

    .line 84
    .local v1, "headers":[Lorg/apache/http/Header;
    const/4 v0, 0x0

    .line 85
    .local v0, "content":[B
    const/4 v2, 0x0

    .line 87
    .local v2, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    if-eqz p2, :cond_0

    .line 88
    invoke-static {p2}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getContent(Lorg/apache/http/HttpResponse;)[B

    move-result-object v0

    .line 89
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    .line 90
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    .line 91
    .local v6, "statusLine":Lorg/apache/http/StatusLine;
    if-eqz v6, :cond_0

    .line 92
    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5

    .line 97
    .end local v6    # "statusLine":Lorg/apache/http/StatusLine;
    :cond_0
    if-eqz v1, :cond_1

    array-length v8, v1

    if-lez v8, :cond_1

    .line 99
    new-instance v2, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    .end local v2    # "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-direct {v2}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 101
    .restart local v2    # "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v8, v1

    if-ge v3, v8, :cond_1

    .line 103
    aget-object v8, v1, v3

    invoke-interface {v8}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v4

    .line 104
    .local v4, "key":Ljava/lang/String;
    aget-object v8, v1, v3

    invoke-interface {v8}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    .line 106
    .local v7, "value":Ljava/lang/String;
    invoke-virtual {v2, v4, v7}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 101
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 110
    .end local v3    # "i":I
    .end local v4    # "key":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    :cond_1
    if-eqz p1, :cond_2

    .line 112
    invoke-interface {p1}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 115
    :cond_2
    if-eqz p3, :cond_4

    .line 117
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v8

    :goto_1
    invoke-virtual {p0, v5, v8, v0, p3}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->onFailure(ILjava/util/ArrayList;[BLjava/lang/Throwable;)V

    .line 136
    :goto_2
    return-void

    .line 117
    :cond_3
    const/4 v8, 0x0

    goto :goto_1

    .line 122
    :cond_4
    packed-switch v5, :pswitch_data_0

    .line 132
    :pswitch_0
    invoke-virtual {v2}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {p0, v5, v8, v0, p3}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->onFailure(ILjava/util/ArrayList;[BLjava/lang/Throwable;)V

    goto :goto_2

    .line 127
    :pswitch_1
    invoke-virtual {v2}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {p0, v5, v8, v0}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->onSuccess(ILjava/util/ArrayList;[B)V

    goto :goto_2

    .line 122
    nop

    :pswitch_data_0
    .packed-switch 0xc8
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public abstract onFailure(ILjava/util/ArrayList;[BLjava/lang/Throwable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;[B",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation
.end method

.method public abstract onSuccess(ILjava/util/ArrayList;[B)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;[B)V"
        }
    .end annotation
.end method
