.class public final Lcom/ning/http/client/providers/netty/request/NettyRequest;
.super Ljava/lang/Object;
.source "NettyRequest.java"


# instance fields
.field private final body:Lcom/ning/http/client/providers/netty/request/body/NettyBody;

.field private final httpRequest:Lorg/jboss/netty/handler/codec/http/HttpRequest;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpRequest;Lcom/ning/http/client/providers/netty/request/body/NettyBody;)V
    .locals 0
    .param p1, "httpRequest"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p2, "body"    # Lcom/ning/http/client/providers/netty/request/body/NettyBody;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/NettyRequest;->httpRequest:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .line 27
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/request/NettyRequest;->body:Lcom/ning/http/client/providers/netty/request/body/NettyBody;

    .line 28
    return-void
.end method


# virtual methods
.method public getBody()Lcom/ning/http/client/providers/netty/request/body/NettyBody;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyRequest;->body:Lcom/ning/http/client/providers/netty/request/body/NettyBody;

    return-object v0
.end method

.method public getHttpRequest()Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyRequest;->httpRequest:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    return-object v0
.end method
