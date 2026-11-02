.class public Lcom/ning/http/client/providers/netty/request/body/NettyMultipartBody;
.super Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;
.source "NettyMultipartBody.java"


# instance fields
.field private final contentType:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/multipart/MultipartBody;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V
    .locals 1
    .param p1, "body"    # Lcom/ning/http/client/multipart/MultipartBody;
    .param p2, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;-><init>(Lcom/ning/http/client/Body;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V

    .line 34
    invoke-virtual {p1}, Lcom/ning/http/client/multipart/MultipartBody;->getContentType()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyMultipartBody;->contentType:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V
    .locals 1
    .param p2, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .param p3, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/multipart/Part;",
            ">;",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;",
            "Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    .local p1, "parts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/multipart/Part;>;"
    invoke-static {p1, p2}, Lcom/ning/http/client/multipart/MultipartUtils;->newMultipartBody(Ljava/util/List;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/multipart/MultipartBody;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Lcom/ning/http/client/providers/netty/request/body/NettyMultipartBody;-><init>(Lcom/ning/http/client/multipart/MultipartBody;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V

    .line 30
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyMultipartBody;->contentType:Ljava/lang/String;

    return-object v0
.end method
