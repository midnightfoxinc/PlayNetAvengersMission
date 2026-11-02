.class public abstract Lcom/ning/http/client/ResponseBase;
.super Ljava/lang/Object;
.source "ResponseBase.java"

# interfaces
.implements Lcom/ning/http/client/Response;


# instance fields
.field protected final bodyParts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;"
        }
    .end annotation
.end field

.field private cookies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/cookie/Cookie;",
            ">;"
        }
    .end annotation
.end field

.field protected final headers:Lcom/ning/http/client/HttpResponseHeaders;

.field protected final status:Lcom/ning/http/client/HttpResponseStatus;


# direct methods
.method protected constructor <init>(Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)V
    .locals 0
    .param p1, "status"    # Lcom/ning/http/client/HttpResponseStatus;
    .param p2, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/HttpResponseStatus;",
            "Lcom/ning/http/client/HttpResponseHeaders;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p3, "bodyParts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p3, p0, Lcom/ning/http/client/ResponseBase;->bodyParts:Ljava/util/List;

    .line 35
    iput-object p2, p0, Lcom/ning/http/client/ResponseBase;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    .line 36
    iput-object p1, p0, Lcom/ning/http/client/ResponseBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    .line 37
    return-void
.end method


# virtual methods
.method protected abstract buildCookies()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/cookie/Cookie;",
            ">;"
        }
    .end annotation
.end method

.method protected calculateCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;
    .locals 2
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 43
    if-nez p1, :cond_0

    .line 44
    invoke-virtual {p0}, Lcom/ning/http/client/ResponseBase;->getContentType()Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "contentType":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 46
    invoke-static {v0}, Lcom/ning/http/util/AsyncHttpProviderUtils;->parseCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 48
    .end local v0    # "contentType":Ljava/lang/String;
    :cond_0
    if-eqz p1, :cond_1

    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_1
    sget-object v1, Lcom/ning/http/util/AsyncHttpProviderUtils;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    goto :goto_0
.end method

.method public final getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    if-eqz v0, :cond_0

    const-string v0, "Content-Type"

    invoke-virtual {p0, v0}, Lcom/ning/http/client/ResponseBase;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCookies()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/cookie/Cookie;",
            ">;"
        }
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->cookies:Ljava/util/List;

    if-nez v0, :cond_0

    .line 103
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/ning/http/client/ResponseBase;->buildCookies()Ljava/util/List;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/ning/http/client/ResponseBase;->cookies:Ljava/util/List;

    .line 104
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->cookies:Ljava/util/List;

    return-object v0

    .line 103
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public final getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/ning/http/client/ResponseBase;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseHeaders;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-direct {v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>()V

    goto :goto_0
.end method

.method public final getHeaders(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/ning/http/client/ResponseBase;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public final getStatusCode()I
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseStatus;->getStatusCode()I

    move-result v0

    return v0
.end method

.method public final getStatusText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseStatus;->getStatusText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getUri()Lcom/ning/http/client/uri/Uri;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseStatus;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    return-object v0
.end method

.method public hasResponseBody()Z
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->bodyParts:Ljava/util/List;

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public hasResponseHeaders()Z
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseHeaders;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Map;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasResponseStatus()Z
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isRedirected()Z
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/ning/http/client/ResponseBase;->status:Lcom/ning/http/client/HttpResponseStatus;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseStatus;->getStatusCode()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 96
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 94
    :pswitch_1
    const/4 v0, 0x1

    goto :goto_0

    .line 88
    nop

    :pswitch_data_0
    .packed-switch 0x12d
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
