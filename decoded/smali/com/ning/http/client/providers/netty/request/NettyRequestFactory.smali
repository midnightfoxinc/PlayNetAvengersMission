.class public final Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;
.super Ljava/lang/Object;
.source "NettyRequestFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/netty/request/NettyRequestFactory$1;
    }
.end annotation


# static fields
.field public static final GZIP_DEFLATE:Ljava/lang/String; = "gzip,deflate"


# instance fields
.field private final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field private final nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V
    .locals 0
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p2, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 74
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    .line 75
    return-void
.end method

.method private body(Lcom/ning/http/client/Request;Lorg/jboss/netty/handler/codec/http/HttpMethod;)Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    .locals 10
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "method"    # Lorg/jboss/netty/handler/codec/http/HttpMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 213
    const/4 v0, 0x0

    .line 214
    .local v0, "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    if-eq p2, v1, :cond_0

    .line 216
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getBodyEncoding()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    sget-object v7, Lcom/ning/http/util/AsyncHttpProviderUtils;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    .line 218
    .local v7, "bodyCharset":Ljava/nio/charset/Charset;
    :goto_0
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getByteData()[B

    move-result-object v1

    if-eqz v1, :cond_2

    .line 219
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/NettyByteArrayBody;

    .end local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getByteData()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ning/http/client/providers/netty/request/body/NettyByteArrayBody;-><init>([B)V

    .line 256
    .end local v7    # "bodyCharset":Ljava/nio/charset/Charset;
    .restart local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    :cond_0
    :goto_1
    return-object v0

    .line 216
    :cond_1
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getBodyEncoding()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v7

    goto :goto_0

    .line 221
    .restart local v7    # "bodyCharset":Ljava/nio/charset/Charset;
    :cond_2
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getCompositeByteData()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 222
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/NettyCompositeByteArrayBody;

    .end local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getCompositeByteData()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ning/http/client/providers/netty/request/body/NettyCompositeByteArrayBody;-><init>(Ljava/util/List;)V

    .restart local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    goto :goto_1

    .line 224
    :cond_3
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getStringData()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 225
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;

    .end local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getStringData()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v7}, Lcom/ning/http/util/StringUtils;->charSequence2ByteBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;-><init>(Ljava/nio/ByteBuffer;)V

    .restart local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    goto :goto_1

    .line 227
    :cond_4
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getStreamData()Ljava/io/InputStream;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 228
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody;

    .end local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getStreamData()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody;-><init>(Ljava/io/InputStream;)V

    .restart local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    goto :goto_1

    .line 230
    :cond_5
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFormParams()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 232
    const/4 v8, 0x0

    .line 233
    .local v8, "contentType":Ljava/lang/String;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v1

    const-string v2, "Content-Type"

    invoke-virtual {v1, v2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 234
    const-string v8, "application/x-www-form-urlencoded"

    .line 236
    :cond_6
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;

    .end local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFormParams()Ljava/util/List;

    move-result-object v1

    invoke-static {v1, v7}, Lcom/ning/http/util/AsyncHttpProviderUtils;->urlEncodeFormParams(Ljava/util/List;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-direct {v0, v1, v8}, Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;-><init>(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 238
    .restart local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    goto :goto_1

    .end local v8    # "contentType":Ljava/lang/String;
    :cond_7
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getParts()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 239
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/NettyMultipartBody;

    .end local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getParts()Ljava/util/List;

    move-result-object v1

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v2

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-direct {v0, v1, v2, v3}, Lcom/ning/http/client/providers/netty/request/body/NettyMultipartBody;-><init>(Ljava/util/List;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V

    .restart local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    goto :goto_1

    .line 241
    :cond_8
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFile()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_9

    .line 242
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;

    .end local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFile()Ljava/io/File;

    move-result-object v1

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;-><init>(Ljava/io/File;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V

    .restart local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    goto/16 :goto_1

    .line 244
    :cond_9
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getBodyGenerator()Lcom/ning/http/client/BodyGenerator;

    move-result-object v1

    instance-of v1, v1, Lcom/ning/http/client/generators/FileBodyGenerator;

    if-eqz v1, :cond_a

    .line 245
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getBodyGenerator()Lcom/ning/http/client/BodyGenerator;

    move-result-object v9

    check-cast v9, Lcom/ning/http/client/generators/FileBodyGenerator;

    .line 246
    .local v9, "fileBodyGenerator":Lcom/ning/http/client/generators/FileBodyGenerator;
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;

    .end local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    invoke-virtual {v9}, Lcom/ning/http/client/generators/FileBodyGenerator;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v9}, Lcom/ning/http/client/generators/FileBodyGenerator;->getRegionSeek()J

    move-result-wide v2

    invoke-virtual {v9}, Lcom/ning/http/client/generators/FileBodyGenerator;->getRegionLength()J

    move-result-wide v4

    iget-object v6, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;-><init>(Ljava/io/File;JJLcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V

    .line 249
    .restart local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    goto/16 :goto_1

    .end local v9    # "fileBodyGenerator":Lcom/ning/http/client/generators/FileBodyGenerator;
    :cond_a
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getBodyGenerator()Lcom/ning/http/client/BodyGenerator;

    move-result-object v1

    instance-of v1, v1, Lcom/ning/http/client/generators/InputStreamBodyGenerator;

    if-eqz v1, :cond_b

    .line 250
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody;

    .end local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    const-class v1, Lcom/ning/http/client/generators/InputStreamBodyGenerator;

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getBodyGenerator()Lcom/ning/http/client/BodyGenerator;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/generators/InputStreamBodyGenerator;

    invoke-virtual {v1}, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody;-><init>(Ljava/io/InputStream;)V

    .restart local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    goto/16 :goto_1

    .line 252
    :cond_b
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getBodyGenerator()Lcom/ning/http/client/BodyGenerator;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 253
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;

    .end local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getBodyGenerator()Lcom/ning/http/client/BodyGenerator;

    move-result-object v1

    invoke-interface {v1}, Lcom/ning/http/client/BodyGenerator;->createBody()Lcom/ning/http/client/Body;

    move-result-object v1

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;-><init>(Lcom/ning/http/client/Body;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V

    .restart local v0    # "nettyBody":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    goto/16 :goto_1
.end method

.method private hostHeader(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;
    .locals 3
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "uri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 94
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getVirtualHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getVirtualHost()Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "host":Ljava/lang/String;
    :goto_0
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getVirtualHost()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {p2}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    .end local v0    # "host":Ljava/lang/String;
    :cond_0
    :goto_1
    return-object v0

    .line 94
    :cond_1
    invoke-virtual {p2}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 95
    .restart local v0    # "host":Ljava/lang/String;
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method private requestUri(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Lorg/jboss/netty/handler/codec/http/HttpMethod;)Ljava/lang/String;
    .locals 3
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .param p3, "method"    # Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .prologue
    .line 78
    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    if-ne p3, v1, :cond_1

    .line 79
    invoke-static {p1}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getAuthority(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 89
    :cond_0
    :goto_0
    return-object v0

    .line 81
    :cond_1
    if-eqz p2, :cond_3

    invoke-static {p1}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->useProxyConnect(Lcom/ning/http/client/uri/Uri;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isUseRelativeURIsWithConnectProxies()Z

    move-result v1

    if-nez v1, :cond_3

    .line 82
    :cond_2
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 85
    :cond_3
    invoke-static {p1}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getNonEmptyPath(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "path":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getQuery()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getQuery()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private systematicAuthorizationHeader(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/Realm;)Ljava/lang/String;
    .locals 4
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p3, "realm"    # Lcom/ning/http/client/Realm;

    .prologue
    .line 133
    const/4 v0, 0x0

    .line 135
    .local v0, "authorizationHeader":Ljava/lang/String;
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Lcom/ning/http/client/Realm;->getUsePreemptiveAuth()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p3}, Lcom/ning/http/client/Realm;->isTargetProxy()Z

    move-result v1

    if-nez v1, :cond_0

    .line 137
    sget-object v1, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory$1;->$SwitchMap$com$ning$http$client$Realm$AuthScheme:[I

    invoke-virtual {p3}, Lcom/ning/http/client/Realm;->getScheme()Lcom/ning/http/client/Realm$AuthScheme;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ning/http/client/Realm$AuthScheme;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 152
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid Authentication "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 139
    :pswitch_0
    invoke-static {p3}, Lcom/ning/http/util/AuthenticatorUtils;->computeBasicAuthentication(Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v0

    .line 156
    :cond_0
    :goto_0
    :pswitch_1
    return-object v0

    .line 142
    :pswitch_2
    invoke-virtual {p3}, Lcom/ning/http/client/Realm;->getNonce()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 143
    invoke-static {p3}, Lcom/ning/http/util/AuthenticatorUtils;->computeDigestAuthentication(Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 137
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private systematicProxyAuthorizationHeader(Lcom/ning/http/client/Request;Lcom/ning/http/client/Realm;Lcom/ning/http/client/ProxyServer;Lorg/jboss/netty/handler/codec/http/HttpMethod;)Ljava/lang/String;
    .locals 4
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "realm"    # Lcom/ning/http/client/Realm;
    .param p3, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .param p4, "method"    # Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .prologue
    .line 182
    const/4 v0, 0x0

    .line 184
    .local v0, "proxyAuthorization":Ljava/lang/String;
    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    if-eq p4, v1, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Lcom/ning/http/client/ProxyServer;->getPrincipal()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p3}, Lcom/ning/http/client/ProxyServer;->getScheme()Lcom/ning/http/client/Realm$AuthScheme;

    move-result-object v1

    sget-object v2, Lcom/ning/http/client/Realm$AuthScheme;->BASIC:Lcom/ning/http/client/Realm$AuthScheme;

    if-ne v1, v2, :cond_1

    .line 186
    invoke-static {p3}, Lcom/ning/http/util/AuthenticatorUtils;->computeBasicAuthentication(Lcom/ning/http/client/ProxyServer;)Ljava/lang/String;

    move-result-object v0

    .line 209
    :cond_0
    :goto_0
    :pswitch_0
    return-object v0

    .line 188
    :cond_1
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/ning/http/client/Realm;->getUsePreemptiveAuth()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p2}, Lcom/ning/http/client/Realm;->isTargetProxy()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 190
    sget-object v1, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory$1;->$SwitchMap$com$ning$http$client$Realm$AuthScheme:[I

    invoke-virtual {p2}, Lcom/ning/http/client/Realm;->getScheme()Lcom/ning/http/client/Realm$AuthScheme;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ning/http/client/Realm$AuthScheme;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 205
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid Authentication "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 192
    :pswitch_1
    invoke-static {p2}, Lcom/ning/http/util/AuthenticatorUtils;->computeBasicAuthentication(Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v0

    .line 193
    goto :goto_0

    .line 195
    :pswitch_2
    invoke-virtual {p2}, Lcom/ning/http/client/Realm;->getNonce()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 196
    invoke-static {p2}, Lcom/ning/http/util/AuthenticatorUtils;->computeDigestAuthentication(Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 190
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public addAuthorizationHeader(Lorg/jboss/netty/handler/codec/http/HttpHeaders;Ljava/lang/String;)V
    .locals 1
    .param p1, "headers"    # Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .param p2, "authorizationHeader"    # Ljava/lang/String;

    .prologue
    .line 260
    if-eqz p2, :cond_0

    .line 262
    const-string v0, "Authorization"

    invoke-virtual {p1, v0, p2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 263
    :cond_0
    return-void
.end method

.method public firstRequestOnlyAuthorizationHeader(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/Realm;)Ljava/lang/String;
    .locals 6
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p3, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .param p4, "realm"    # Lcom/ning/http/client/Realm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    const/4 v0, 0x0

    .line 101
    .local v0, "authorizationHeader":Ljava/lang/String;
    if-eqz p4, :cond_0

    invoke-virtual {p4}, Lcom/ning/http/client/Realm;->getUsePreemptiveAuth()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 102
    sget-object v4, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory$1;->$SwitchMap$com$ning$http$client$Realm$AuthScheme:[I

    invoke-virtual {p4}, Lcom/ning/http/client/Realm;->getScheme()Lcom/ning/http/client/Realm$AuthScheme;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ning/http/client/Realm$AuthScheme;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 128
    :cond_0
    :goto_0
    return-object v0

    .line 104
    :pswitch_0
    sget-object v4, Lcom/ning/http/client/ntlm/NTLMEngine;->INSTANCE:Lcom/ning/http/client/ntlm/NTLMEngine;

    invoke-virtual {v4}, Lcom/ning/http/client/ntlm/NTLMEngine;->generateType1Msg()Ljava/lang/String;

    move-result-object v3

    .line 105
    .local v3, "msg":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "NTLM "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 106
    goto :goto_0

    .line 110
    .end local v3    # "msg":Ljava/lang/String;
    :pswitch_1
    if-eqz p3, :cond_1

    .line 111
    invoke-virtual {p3}, Lcom/ning/http/client/ProxyServer;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 118
    .local v2, "host":Ljava/lang/String;
    :goto_1
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Negotiate "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->INSTANCE:Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;

    invoke-virtual {v5, v2}, Lcom/ning/http/client/providers/netty/spnego/SpnegoEngine;->generateToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 112
    .end local v2    # "host":Ljava/lang/String;
    :cond_1
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getVirtualHost()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 113
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getVirtualHost()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "host":Ljava/lang/String;
    goto :goto_1

    .line 115
    .end local v2    # "host":Ljava/lang/String;
    :cond_2
    invoke-virtual {p2}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "host":Ljava/lang/String;
    goto :goto_1

    .line 119
    :catch_0
    move-exception v1

    .line 120
    .local v1, "e":Ljava/lang/Throwable;
    new-instance v4, Ljava/io/IOException;

    invoke-direct {v4, v1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 102
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public firstRequestOnlyProxyAuthorizationHeader(Lcom/ning/http/client/Request;Lcom/ning/http/client/ProxyServer;Lorg/jboss/netty/handler/codec/http/HttpMethod;)Ljava/lang/String;
    .locals 6
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .param p3, "method"    # Lorg/jboss/netty/handler/codec/http/HttpMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    const/4 v3, 0x0

    .line 162
    .local v3, "proxyAuthorization":Ljava/lang/String;
    sget-object v4, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    if-ne p3, v4, :cond_1

    .line 163
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v4

    const-string v5, "Proxy-Authorization"

    invoke-virtual {v4, v5}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 164
    .local v0, "auth":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {v0}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->getNTLM(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    .line 165
    .local v2, "ntlmHeader":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 166
    move-object v3, v2

    .line 177
    .end local v0    # "auth":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "ntlmHeader":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v3

    .line 169
    :cond_1
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/ning/http/client/ProxyServer;->getPrincipal()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {p2}, Lcom/ning/http/client/ProxyServer;->getNtlmDomain()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 170
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v4

    const-string v5, "Proxy-Authorization"

    invoke-virtual {v4, v5}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 171
    .restart local v0    # "auth":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {v0}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->getNTLM(Ljava/util/List;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 172
    sget-object v4, Lcom/ning/http/client/ntlm/NTLMEngine;->INSTANCE:Lcom/ning/http/client/ntlm/NTLMEngine;

    invoke-virtual {v4}, Lcom/ning/http/client/ntlm/NTLMEngine;->generateType1Msg()Ljava/lang/String;

    move-result-object v1

    .line 173
    .local v1, "msg":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "NTLM "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public newNettyRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;ZLcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/providers/netty/request/NettyRequest;
    .locals 22
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p3, "forceConnect"    # Z
    .param p4, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 273
    if-eqz p3, :cond_0

    sget-object v11, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 274
    .local v11, "method":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    :goto_0
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-object/from16 v0, v17

    if-ne v11, v0, :cond_1

    sget-object v9, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_0:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    .line 275
    .local v9, "httpVersion":Lorg/jboss/netty/handler/codec/http/HttpVersion;
    :goto_1
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v11}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->requestUri(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Lorg/jboss/netty/handler/codec/http/HttpMethod;)Ljava/lang/String;

    move-result-object v15

    .line 277
    .local v15, "requestUri":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v11}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->body(Lcom/ning/http/client/Request;Lorg/jboss/netty/handler/codec/http/HttpMethod;)Lcom/ning/http/client/providers/netty/request/body/NettyBody;

    move-result-object v4

    .line 281
    .local v4, "body":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    instance-of v0, v4, Lcom/ning/http/client/providers/netty/request/body/NettyDirectBody;

    move/from16 v17, v0

    if-eqz v17, :cond_2

    .line 282
    const-class v17, Lcom/ning/http/client/providers/netty/request/body/NettyDirectBody;

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/ning/http/client/providers/netty/request/body/NettyDirectBody;

    invoke-virtual/range {v17 .. v17}, Lcom/ning/http/client/providers/netty/request/body/NettyDirectBody;->channelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    .line 283
    .local v5, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    new-instance v8, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;

    invoke-direct {v8, v9, v11, v15}, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpMethod;Ljava/lang/String;)V

    .line 285
    .local v8, "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    invoke-interface {v8, v5}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 286
    new-instance v12, Lcom/ning/http/client/providers/netty/request/NettyRequest;

    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-direct {v12, v8, v0}, Lcom/ning/http/client/providers/netty/request/NettyRequest;-><init>(Lorg/jboss/netty/handler/codec/http/HttpRequest;Lcom/ning/http/client/providers/netty/request/body/NettyBody;)V

    .line 293
    .end local v5    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .local v12, "nettyRequest":Lcom/ning/http/client/providers/netty/request/NettyRequest;
    :goto_2
    invoke-interface {v8}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    .line 295
    .local v7, "headers":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-object/from16 v0, v17

    if-eq v11, v0, :cond_5

    .line 297
    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 298
    .local v6, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/Iterable;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_3

    .line 273
    .end local v4    # "body":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    .end local v6    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v7    # "headers":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .end local v8    # "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .end local v9    # "httpVersion":Lorg/jboss/netty/handler/codec/http/HttpVersion;
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "method":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    .end local v12    # "nettyRequest":Lcom/ning/http/client/providers/netty/request/NettyRequest;
    .end local v15    # "requestUri":Ljava/lang/String;
    :cond_0
    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v11

    goto :goto_0

    .line 274
    .restart local v11    # "method":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    :cond_1
    sget-object v9, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    goto :goto_1

    .line 289
    .restart local v4    # "body":Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    .restart local v9    # "httpVersion":Lorg/jboss/netty/handler/codec/http/HttpVersion;
    .restart local v15    # "requestUri":Ljava/lang/String;
    :cond_2
    new-instance v8, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;

    invoke-direct {v8, v9, v11, v15}, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpMethod;Ljava/lang/String;)V

    .line 290
    .restart local v8    # "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    new-instance v12, Lcom/ning/http/client/providers/netty/request/NettyRequest;

    invoke-direct {v12, v8, v4}, Lcom/ning/http/client/providers/netty/request/NettyRequest;-><init>(Lorg/jboss/netty/handler/codec/http/HttpRequest;Lcom/ning/http/client/providers/netty/request/body/NettyBody;)V

    .restart local v12    # "nettyRequest":Lcom/ning/http/client/providers/netty/request/NettyRequest;
    goto :goto_2

    .line 301
    .restart local v7    # "headers":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .restart local v10    # "i$":Ljava/util/Iterator;
    :cond_3
    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getCookies()Ljava/util/Collection;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 302
    const-string v17, "Cookie"

    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getCookies()Ljava/util/Collection;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/ning/http/client/cookie/CookieEncoder;->encode(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 304
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/ning/http/client/AsyncHttpClientConfig;->isCompressionEnforced()Z

    move-result v17

    if-eqz v17, :cond_5

    const-string v17, "Accept-Encoding"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_5

    .line 305
    const-string v17, "Accept-Encoding"

    const-string v18, "gzip,deflate"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 308
    .end local v10    # "i$":Ljava/util/Iterator;
    :cond_5
    if-eqz v4, :cond_6

    .line 309
    invoke-interface {v4}, Lcom/ning/http/client/providers/netty/request/body/NettyBody;->getContentLength()J

    move-result-wide v18

    const-wide/16 v20, 0x0

    cmp-long v17, v18, v20

    if-gez v17, :cond_b

    .line 310
    const-string v17, "Transfer-Encoding"

    const-string v18, "chunked"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 314
    :goto_4
    invoke-interface {v4}, Lcom/ning/http/client/providers/netty/request/body/NettyBody;->getContentType()Ljava/lang/String;

    move-result-object v17

    if-eqz v17, :cond_6

    .line 315
    const-string v17, "Content-Type"

    invoke-interface {v4}, Lcom/ning/http/client/providers/netty/request/body/NettyBody;->getContentType()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 319
    :cond_6
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->isWebSocket(Ljava/lang/String;)Z

    move-result v16

    .line 320
    .local v16, "webSocket":Z
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-object/from16 v0, v17

    if-eq v11, v0, :cond_e

    if-eqz v16, :cond_e

    .line 321
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "http://"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, ":"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v17

    const/16 v19, -0x1

    move/from16 v0, v17

    move/from16 v1, v19

    if-ne v0, v1, :cond_d

    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->isSecure(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_c

    const/16 v17, 0x1bb

    :goto_5
    move-object/from16 v0, v18

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 322
    .local v13, "origin":Ljava/lang/String;
    const-string v17, "Upgrade"

    const-string v18, "WebSocket"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    const-string v18, "Connection"

    const-string v19, "Upgrade"

    invoke-virtual/range {v17 .. v19}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    const-string v18, "Origin"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v13}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    const-string v18, "Sec-WebSocket-Key"

    invoke-static {}, Lcom/ning/http/client/providers/netty/ws/WebSocketUtils;->getKey()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v17 .. v19}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    const-string v18, "Sec-WebSocket-Version"

    const-string v19, "13"

    invoke-virtual/range {v17 .. v19}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 332
    .end local v13    # "origin":Ljava/lang/String;
    :cond_7
    :goto_6
    const-string v17, "Host"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_8

    .line 333
    const-string v17, "Host"

    invoke-direct/range {p0 .. p2}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->hostHeader(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 335
    :cond_8
    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v17

    if-eqz v17, :cond_f

    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v14

    .line 338
    .local v14, "realm":Lcom/ning/http/client/Realm;
    :goto_7
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v14}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->systematicAuthorizationHeader(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v7, v1}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->addAuthorizationHeader(Lorg/jboss/netty/handler/codec/http/HttpHeaders;Ljava/lang/String;)V

    .line 340
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v14, v2, v11}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->systematicProxyAuthorizationHeader(Lcom/ning/http/client/Request;Lcom/ning/http/client/Realm;Lcom/ning/http/client/ProxyServer;Lorg/jboss/netty/handler/codec/http/HttpMethod;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v7, v1}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->setProxyAuthorizationHeader(Lorg/jboss/netty/handler/codec/http/HttpHeaders;Ljava/lang/String;)V

    .line 343
    const-string v17, "Accept"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_9

    .line 344
    const-string v17, "Accept"

    const-string v18, "*/*"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 347
    :cond_9
    const-string v17, "User-Agent"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/ning/http/client/AsyncHttpClientConfig;->getUserAgent()Ljava/lang/String;

    move-result-object v17

    if-eqz v17, :cond_a

    .line 348
    const-string v17, "User-Agent"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/ning/http/client/AsyncHttpClientConfig;->getUserAgent()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 350
    :cond_a
    return-object v12

    .line 312
    .end local v14    # "realm":Lcom/ning/http/client/Realm;
    .end local v16    # "webSocket":Z
    :cond_b
    const-string v17, "Content-Length"

    invoke-interface {v4}, Lcom/ning/http/client/providers/netty/request/body/NettyBody;->getContentLength()J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto/16 :goto_4

    .line 321
    .restart local v16    # "webSocket":Z
    :cond_c
    const/16 v17, 0x50

    goto/16 :goto_5

    :cond_d
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v17

    goto/16 :goto_5

    .line 328
    :cond_e
    const-string v17, "Connection"

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_7

    .line 329
    const-string v17, "Connection"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/ning/http/util/AsyncHttpProviderUtils;->keepAliveHeaderValue(Lcom/ning/http/client/AsyncHttpClientConfig;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto/16 :goto_6

    .line 335
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v14

    goto/16 :goto_7
.end method

.method public setProxyAuthorizationHeader(Lorg/jboss/netty/handler/codec/http/HttpHeaders;Ljava/lang/String;)V
    .locals 1
    .param p1, "headers"    # Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .param p2, "proxyAuthorizationHeader"    # Ljava/lang/String;

    .prologue
    .line 266
    if-eqz p2, :cond_0

    .line 267
    const-string v0, "Proxy-Authorization"

    invoke-virtual {p1, v0, p2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 268
    :cond_0
    return-void
.end method
