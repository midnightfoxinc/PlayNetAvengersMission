.class public Lorg/jboss/netty/handler/codec/http/HttpRequestEncoder;
.super Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;
.source "HttpRequestEncoder.java"


# static fields
.field private static final QUESTION_MARK:C = '?'

.field private static final SLASH:C = '/'


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;-><init>()V

    return-void
.end method


# virtual methods
.method protected encodeInitialLine(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessage;)V
    .locals 12
    .param p1, "buf"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v11, 0x20

    const/4 v10, -0x1

    const/16 v9, 0x2f

    .line 32
    move-object v2, p2

    check-cast v2, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .line 33
    .local v2, "request":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getMethod()Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "ASCII"

    invoke-virtual {v7, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    invoke-interface {p1, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 34
    invoke-interface {p1, v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 38
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getUri()Ljava/lang/String;

    move-result-object v6

    .line 39
    .local v6, "uri":Ljava/lang/String;
    const-string v7, "://"

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 40
    .local v4, "start":I
    if-eq v4, v10, :cond_0

    .line 41
    add-int/lit8 v5, v4, 0x3

    .line 44
    .local v5, "startIndex":I
    const/16 v7, 0x3f

    invoke-virtual {v6, v7, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 45
    .local v0, "index":I
    if-ne v0, v10, :cond_1

    .line 46
    invoke-virtual {v6, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    if-gt v7, v5, :cond_0

    .line 47
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 61
    .end local v0    # "index":I
    .end local v5    # "startIndex":I
    :cond_0
    :goto_0
    const-string v7, "UTF-8"

    invoke-virtual {v6, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    invoke-interface {p1, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 62
    invoke-interface {p1, v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 63
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "ASCII"

    invoke-virtual {v7, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    invoke-interface {p1, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 64
    const/16 v7, 0xd

    invoke-interface {p1, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 65
    const/16 v7, 0xa

    invoke-interface {p1, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 66
    return-void

    .line 50
    .restart local v0    # "index":I
    .restart local v5    # "startIndex":I
    :cond_1
    invoke-virtual {v6, v9, v0}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v7

    if-gt v7, v5, :cond_0

    .line 51
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v1

    .line 52
    .local v1, "len":I
    new-instance v3, Ljava/lang/StringBuilder;

    add-int/lit8 v7, v1, 0x1

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 53
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    invoke-virtual {v3, v6, v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 54
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 55
    invoke-virtual {v3, v6, v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 56
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0
.end method
