.class final Lorg/jboss/netty/handler/ssl/SslHandler$SSLEngineInboundCloseFuture;
.super Lorg/jboss/netty/channel/DefaultChannelFuture;
.source "SslHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/ssl/SslHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SSLEngineInboundCloseFuture"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/ssl/SslHandler;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/ssl/SslHandler;)V
    .locals 2

    .prologue
    .line 1663
    iput-object p1, p0, Lorg/jboss/netty/handler/ssl/SslHandler$SSLEngineInboundCloseFuture;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    .line 1664
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/jboss/netty/channel/DefaultChannelFuture;-><init>(Lorg/jboss/netty/channel/Channel;Z)V

    .line 1665
    return-void
.end method


# virtual methods
.method public getChannel()Lorg/jboss/netty/channel/Channel;
    .locals 1

    .prologue
    .line 1673
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler$SSLEngineInboundCloseFuture;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-static {v0}, Lorg/jboss/netty/handler/ssl/SslHandler;->access$700(Lorg/jboss/netty/handler/ssl/SslHandler;)Lorg/jboss/netty/channel/ChannelHandlerContext;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1675
    const/4 v0, 0x0

    .line 1677
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler$SSLEngineInboundCloseFuture;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-static {v0}, Lorg/jboss/netty/handler/ssl/SslHandler;->access$700(Lorg/jboss/netty/handler/ssl/SslHandler;)Lorg/jboss/netty/channel/ChannelHandlerContext;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    goto :goto_0
.end method

.method setClosed()V
    .locals 0

    .prologue
    .line 1668
    invoke-super {p0}, Lorg/jboss/netty/channel/DefaultChannelFuture;->setSuccess()Z

    .line 1669
    return-void
.end method

.method public setFailure(Ljava/lang/Throwable;)Z
    .locals 1
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 1688
    const/4 v0, 0x0

    return v0
.end method

.method public setSuccess()Z
    .locals 1

    .prologue
    .line 1683
    const/4 v0, 0x0

    return v0
.end method
