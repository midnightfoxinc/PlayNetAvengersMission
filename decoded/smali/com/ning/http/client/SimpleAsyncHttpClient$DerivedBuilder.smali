.class public interface abstract Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
.super Ljava/lang/Object;
.source "SimpleAsyncHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/SimpleAsyncHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "DerivedBuilder"
.end annotation


# virtual methods
.method public abstract addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
.end method

.method public abstract addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
.end method

.method public abstract addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
.end method

.method public abstract addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
.end method

.method public abstract addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
.end method

.method public abstract build()Lcom/ning/http/client/SimpleAsyncHttpClient;
.end method

.method public abstract setFollowRedirects(Z)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
.end method

.method public abstract setFormParams(Ljava/util/List;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;"
        }
    .end annotation
.end method

.method public abstract setFormParams(Ljava/util/Map;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;"
        }
    .end annotation
.end method

.method public abstract setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
.end method

.method public abstract setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
.end method

.method public abstract setHeaders(Ljava/util/Map;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;"
        }
    .end annotation
.end method

.method public abstract setResumableDownload(Z)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
.end method

.method public abstract setUrl(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
.end method

.method public abstract setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
.end method
