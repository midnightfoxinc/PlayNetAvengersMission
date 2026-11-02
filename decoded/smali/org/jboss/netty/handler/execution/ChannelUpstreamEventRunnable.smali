.class public Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;
.super Lorg/jboss/netty/handler/execution/ChannelEventRunnable;
.source "ChannelUpstreamEventRunnable.java"


# direct methods
.method public constructor <init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/util/concurrent/Executor;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;-><init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/util/concurrent/Executor;)V

    .line 36
    return-void
.end method


# virtual methods
.method protected doRun()V
    .locals 2

    .prologue
    .line 43
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iget-object v1, p0, Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;->e:Lorg/jboss/netty/channel/ChannelEvent;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 44
    return-void
.end method
