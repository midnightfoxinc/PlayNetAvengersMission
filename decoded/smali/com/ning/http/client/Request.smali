.class public interface abstract Lcom/ning/http/client/Request;
.super Ljava/lang/Object;
.source "Request.java"


# virtual methods
.method public abstract getBodyEncoding()Ljava/lang/String;
.end method

.method public abstract getBodyGenerator()Lcom/ning/http/client/BodyGenerator;
.end method

.method public abstract getByteData()[B
.end method

.method public abstract getCompositeByteData()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation
.end method

.method public abstract getConnectionPoolPartitioning()Lcom/ning/http/client/ConnectionPoolPartitioning;
.end method

.method public abstract getContentLength()J
.end method

.method public abstract getCookies()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/ning/http/client/cookie/Cookie;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getFile()Ljava/io/File;
.end method

.method public abstract getFollowRedirect()Ljava/lang/Boolean;
.end method

.method public abstract getFormParams()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
.end method

.method public abstract getInetAddress()Ljava/net/InetAddress;
.end method

.method public abstract getLocalAddress()Ljava/net/InetAddress;
.end method

.method public abstract getMethod()Ljava/lang/String;
.end method

.method public abstract getParts()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/multipart/Part;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getProxyServer()Lcom/ning/http/client/ProxyServer;
.end method

.method public abstract getQueryParams()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getRangeOffset()J
.end method

.method public abstract getRealm()Lcom/ning/http/client/Realm;
.end method

.method public abstract getRequestTimeout()I
.end method

.method public abstract getStreamData()Ljava/io/InputStream;
.end method

.method public abstract getStringData()Ljava/lang/String;
.end method

.method public abstract getUri()Lcom/ning/http/client/uri/Uri;
.end method

.method public abstract getUrl()Ljava/lang/String;
.end method

.method public abstract getVirtualHost()Ljava/lang/String;
.end method
