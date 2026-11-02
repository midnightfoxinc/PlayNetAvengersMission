.class public abstract Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
.super Ljava/lang/Object;
.source "SpdyHeaders.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders$HttpNames;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# static fields
.field public static final EMPTY_HEADERS:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders$1;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders$1;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->EMPTY_HEADERS:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    return-void
.end method

.method public static addHeader(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p0, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 181
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 182
    return-void
.end method

.method public static getHeader(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 142
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getHeader(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 154
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 155
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 158
    .end local p2    # "defaultValue":Ljava/lang/String;
    :goto_0
    return-object p2

    .restart local p2    # "defaultValue":Ljava/lang/String;
    :cond_0
    move-object p2, v0

    goto :goto_0
.end method

.method public static getHost(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Ljava/lang/String;
    .locals 2
    .param p0, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .prologue
    .line 195
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":host"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMethod(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpMethod;
    .locals 3
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .prologue
    .line 217
    :try_start_0
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v1

    const-string v2, ":method"

    invoke-virtual {v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpMethod;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 219
    :goto_0
    return-object v1

    .line 218
    :catch_0
    move-exception v0

    .line 219
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getScheme(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Ljava/lang/String;
    .locals 2
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .prologue
    .line 241
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":scheme"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getStatus(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;
    .locals 8
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .prologue
    .line 263
    :try_start_0
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v6

    const-string v7, ":status"

    invoke-virtual {v6, v7}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 264
    .local v5, "status":Ljava/lang/String;
    const/16 v6, 0x20

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 265
    .local v4, "space":I
    const/4 v6, -0x1

    if-ne v4, v6, :cond_1

    .line 266
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-static {v6}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->valueOf(I)Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v3

    .line 278
    .end local v4    # "space":I
    .end local v5    # "status":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v3

    .line 268
    .restart local v4    # "space":I
    .restart local v5    # "status":Ljava/lang/String;
    :cond_1
    const/4 v6, 0x0

    invoke-virtual {v5, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 269
    .local v0, "code":I
    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 270
    .local v2, "reasonPhrase":Ljava/lang/String;
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->valueOf(I)Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v3

    .line 271
    .local v3, "responseStatus":Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;
    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getReasonPhrase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 274
    new-instance v3, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    .end local v3    # "responseStatus":Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;
    invoke-direct {v3, v0, v2}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;-><init>(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 277
    .end local v0    # "code":I
    .end local v2    # "reasonPhrase":Ljava/lang/String;
    .end local v4    # "space":I
    .end local v5    # "status":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 278
    .local v1, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static getUrl(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Ljava/lang/String;
    .locals 2
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .prologue
    .line 300
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":path"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVersion(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpVersion;
    .locals 3
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .prologue
    .line 322
    :try_start_0
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v1

    const-string v2, ":version"

    invoke-virtual {v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpVersion;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 324
    :goto_0
    return-object v1

    .line 323
    :catch_0
    move-exception v0

    .line 324
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static removeHost(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .locals 2
    .param p0, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .prologue
    .line 188
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":host"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 189
    return-void
.end method

.method public static removeMethod(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .locals 2
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .prologue
    .line 209
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":method"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 210
    return-void
.end method

.method public static removeScheme(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .locals 2
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .prologue
    .line 234
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":scheme"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 235
    return-void
.end method

.method public static removeStatus(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .locals 2
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .prologue
    .line 255
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":status"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 256
    return-void
.end method

.method public static removeUrl(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .locals 2
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .prologue
    .line 293
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":path"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 294
    return-void
.end method

.method public static removeVersion(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .locals 2
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .prologue
    .line 314
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":version"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 315
    return-void
.end method

.method public static setHeader(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Ljava/lang/String;Ljava/lang/Iterable;)V
    .locals 1
    .param p0, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 174
    .local p2, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 175
    return-void
.end method

.method public static setHeader(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p0, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 166
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 167
    return-void
.end method

.method public static setHost(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Ljava/lang/String;)V
    .locals 2
    .param p0, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 202
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":host"

    invoke-virtual {v0, v1, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 203
    return-void
.end method

.method public static setMethod(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpMethod;)V
    .locals 3
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .param p2, "method"    # Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .prologue
    .line 227
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":method"

    invoke-virtual {p2}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 228
    return-void
.end method

.method public static setScheme(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Ljava/lang/String;)V
    .locals 2
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .param p2, "scheme"    # Ljava/lang/String;

    .prologue
    .line 248
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":scheme"

    invoke-virtual {v0, v1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 249
    return-void
.end method

.method public static setStatus(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V
    .locals 3
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .param p2, "status"    # Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    .prologue
    .line 286
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":status"

    invoke-virtual {p2}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 287
    return-void
.end method

.method public static setUrl(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Ljava/lang/String;)V
    .locals 2
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 307
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":path"

    invoke-virtual {v0, v1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 308
    return-void
.end method

.method public static setVersion(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpVersion;)V
    .locals 3
    .param p0, "spdyVersion"    # I
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .param p2, "httpVersion"    # Lorg/jboss/netty/handler/codec/http/HttpVersion;

    .prologue
    .line 332
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v0

    const-string v1, ":version"

    invoke-virtual {p2}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 333
    return-void
.end method


# virtual methods
.method public abstract add(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<*>;)",
            "Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;"
        }
    .end annotation
.end method

.method public abstract add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
.end method

.method public abstract clear()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
.end method

.method public abstract contains(Ljava/lang/String;)Z
.end method

.method public abstract entries()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract get(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getAll(Ljava/lang/String;)Ljava/util/List;
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
.end method

.method public abstract isEmpty()Z
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 337
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->entries()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public abstract names()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
.end method

.method public abstract set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<*>;)",
            "Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;"
        }
    .end annotation
.end method

.method public abstract set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
.end method
