.class public Lcom/ning/http/client/providers/netty/channel/SslInitializer;
.super Lorg/jboss/netty/channel/SimpleChannelDownstreamHandler;
.source "SslInitializer.java"


# instance fields
.field private final channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)V
    .locals 0
    .param p1, "channelManager"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelDownstreamHandler;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/channel/SslInitializer;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .line 36
    return-void
.end method


# virtual methods
.method public connectRequested(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 7
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/InetSocketAddress;

    .line 41
    .local v2, "remoteInetSocketAddress":Ljava/net/InetSocketAddress;
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getHostString()Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, "peerHost":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v1

    .line 44
    .local v1, "peerPort":I
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/SslInitializer;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v4, v0, v1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->createSslHandler(Ljava/lang/String;I)Lorg/jboss/netty/handler/ssl/SslHandler;

    move-result-object v3

    .line 46
    .local v3, "sslHandler":Lorg/jboss/netty/handler/ssl/SslHandler;
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v4

    const-string v5, "sslHandler"

    const-string v6, "sslHandler"

    invoke-interface {v4, v5, v6, v3}, Lorg/jboss/netty/channel/ChannelPipeline;->replace(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelHandler;

    .line 48
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 49
    return-void
.end method
