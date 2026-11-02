.class public Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;
.super Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;
.source "DefaultHttpResponse.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/HttpResponse;


# instance fields
.field private status:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V
    .locals 0
    .param p1, "version"    # Lorg/jboss/netty/handler/codec/http/HttpVersion;
    .param p2, "status"    # Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;)V

    .line 35
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;->setStatus(Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 36
    return-void
.end method


# virtual methods
.method public getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;->status:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    return-object v0
.end method

.method public setStatus(Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V
    .locals 2
    .param p1, "status"    # Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    .prologue
    .line 43
    if-nez p1, :cond_0

    .line 44
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "status"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;->status:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    .line 47
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    const-string v1, "(chunked: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;->isChunked()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 55
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 59
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;->appendHeaders(Ljava/lang/StringBuilder;)V

    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    sget-object v2, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
